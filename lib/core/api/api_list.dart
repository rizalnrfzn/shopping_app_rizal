class ApiList {
  ApiList._();

  static const baseUrl = 'https://api.escuelajs.co/api/v1';

  // Authentication
  static const login = '$baseUrl/auth/login';
  static const getUser = '$baseUrl/auth/profile';

  // products
  static const products = '$baseUrl/products';

  // categeories
  static const categories = '$baseUrl/categories';
}
