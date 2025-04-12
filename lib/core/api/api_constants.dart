class ApiConstants {
  // Base URL
  static const String baseUrl = 'http://localhost:8090';

  // API Version
  static const String apiVersion = '/api/v1';

  // Auth Endpoints
  static const String register = '$apiVersion/auth/register';
  static const String login = '$apiVersion/auth/login';
  static const String refreshToken = '$apiVersion/auth/refresh';
  static const String logout = '$apiVersion/auth/logout';

  // Owner Auth Endpoints
  static const String ownerRegister = '$apiVersion/owner/auth/register';
  static const String ownerLogin = '$apiVersion/owner/auth/login';
  static const String ownerRefreshToken = '$apiVersion/owner/auth/refresh';
  static const String ownerLogout = '$apiVersion/owner/auth/logout';

  // User Endpoints
  static const String users = '$apiVersion/users';
  static const String userById = '$apiVersion/users/'; // Append user ID

  // Restaurant Endpoints
  static const String restaurants = '$apiVersion/restaurants';
  static const String restaurantById = '$apiVersion/restaurants/'; // Append restaurant ID
  static const String myRestaurants = '$apiVersion/restaurants/my';
}
