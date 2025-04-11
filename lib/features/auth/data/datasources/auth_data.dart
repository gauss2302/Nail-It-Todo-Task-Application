import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:nail_it/core/error/exception.dart';
import 'package:nail_it/features/auth/data/models/user_model.dart';

abstract interface class AuthDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String userId,
    required String username,
    required String email,
    required String password,
  });

  Future<UserModel> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signInWithGoogle();

  Future<UserModel?> getCurrentUserData();
}

class AuthDataSourceImpl implements AuthDataSource {
  final Account account;
  final Databases databases;

  AuthDataSourceImpl({required this.account, required this.databases});

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      final user = await account.get();
      final userData = await databases.listDocuments(
        databaseId: "databaseId",
        collectionId: "profiles",
        queries: [
          Query.equal('userId', user.$id),
        ],
      );

      if (userData.documents.isEmpty) return null;

      return UserModel.fromJson(userData.documents.first.data).copyWith(
        email: user.email,
      );
    } on AppwriteException catch (e) {
      throw ServerException(e.message ?? "Error occured");
    }
  }

  @override
  Future<UserModel> signInWithEmailPassword({required String email, required String password}) async {
    try {
      final session = await account.createEmailPasswordSession(
        email: email,
        password: password,
      );

      final user = await account.get();
      return UserModel(
        id: user.$id,
        email: user.email,
        username: user.name ?? '',
      );
    } on AppwriteException catch (e) {
      throw ServerException(e.message ?? "Auth Failed");
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      await account.createOAuth2Session(
        provider: OAuthProvider.google,
      );

      final user = await account.get();

      final userData = await databases.listDocuments(
        databaseId: 'databaseId',
        collectionId: 'profiles',
        queries: [
          Query.equal('userId', user.$id),
        ],
      );

      if (userData.documents.isEmpty) {
        await databases.createDocument(
          databaseId: 'your_database_id',
          collectionId: 'profiles',
          documentId: ID.unique(),
          data: {
            'userId': user.$id,
            'username': user.name ?? 'User',
            'createdAt': DateTime.now().toIso8601String(),
          },
        );
      }

      return UserModel(
        id: user.$id,
        email: user.email,
        username: user.name ?? 'User',
        name: user.name ?? '',
        photoUrl: '',
      );
    } on AppwriteException catch (e) {
      throw ServerException(e.message ?? 'Google authentication failed');
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword(
      {required String username, required String userId, required String email, required String password}) async {
    try {
      final user = await account.create(userId: userId, email: email, password: password);

      await databases
          .createDocument(databaseId: "databaseId", collectionId: "profiles", documentId: ID.unique(), data: {
        'userId': user.$id,
        'email': user.email,
        'username': username,
        'createdAt': DateTime.now().toIso8601String(),
      });

      return UserModel(
        id: user.$id,
        email: user.email,
        username: username,
      );
    } on AppwriteException catch (e) {
      throw ServerException(e.message ?? "Reg fauled");
    }
  }
}
