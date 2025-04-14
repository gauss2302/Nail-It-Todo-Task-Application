import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_it/core/routes/routes.dart';
import 'package:nail_it/core/theme/app_pallete.dart';
import 'package:nail_it/core/widgets/appbar.dart';
import 'package:nail_it/features/auth/presentation/bloc/auth_bloc.dart';


class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperBar(appbartitle: 'M Y  P R O F I L E'),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is AuthAuthenticated){
            return _buildAuthenticatedContent (context, state);
          } else {
            return _buildUnauthenticatedContent(context);
          }
        },
      ),
    );
  }

  Widget _buildAuthenticatedContent(BuildContext context, AuthAuthenticated state) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile header
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppPallete.gradient1, AppPallete.gradient2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Text(
                      state.user.name.isNotEmpty
                          ? state.user.name[0].toUpperCase()
                          : (state.user.username.isNotEmpty ? state.user.username[0].toUpperCase() : 'U'),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppPallete.gradient1,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.name.isNotEmpty ? state.user.name : state.user.username,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          state.user.email,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Member since ${_formatDate(state.user.createdAt)}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Profile sections
            _buildProfileSection(
              context,
              'Account Information',
              [
                _buildProfileTile(
                  context,
                  'Edit Profile',
                  Icons.person_outline,
                      () {
                    // Navigate to edit profile page
                  },
                ),
                _buildProfileTile(
                  context,
                  'Update Password',
                  Icons.lock_outline,
                      () {
                    // Navigate to update password page
                  },
                ),
                _buildProfileTile(
                  context,
                  'Notification Settings',
                  Icons.notifications_none,
                      () {
                    // Navigate to notification settings
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            _buildProfileSection(
              context,
              'Restaurants',
              [
                _buildProfileTile(
                  context,
                  'My Restaurants',
                  Icons.restaurant_outlined,
                      () {
                    // Navigate to my restaurants page
                  },
                ),
                _buildProfileTile(
                  context,
                  'Add Restaurant',
                  Icons.add_business_outlined,
                      () {
                    // Navigate to add restaurant page
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            _buildProfileSection(
              context,
              'App Settings',
              [
                _buildProfileTile(
                  context,
                  'Settings',
                  Icons.settings_outlined,
                      () {
                    context.go(AppRoutes.home);
                  },
                ),
                _buildProfileTile(
                  context,
                  'Help & Support',
                  Icons.help_outline,
                      () {
                    // Navigate to help page
                  },
                ),
                _buildProfileTile(
                  context,
                  'About',
                  Icons.info_outline,
                      () {
                    // Navigate to about page
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Logout button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthLogoutRequested());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade100,
                  foregroundColor: Colors.red.shade800,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                icon: const Icon(Icons.logout),
                label: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(
      BuildContext context,
      String title,
      List<Widget> children,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileTile(
      BuildContext context,
      String title,
      IconData icon,
      VoidCallback onTap,
      ) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppPallete.gradient1,
      ),
      title: Text(title),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
      onTap: onTap,
    );
  }

  Widget _buildUnauthenticatedContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.account_circle_outlined,
            size: 100,
            color: AppPallete.gradient1,
          ),
          const SizedBox(height: 16),
          const Text(
            'You need to be logged in to view your profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              context.go(AppRoutes.login);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppPallete.gradient1,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}