class AppLink {
  static const String server =
      //'https://localhost/ecommerce';
      'https://bilal-ecommerce-app.000webhostapp.com/ecommerce';
  static const String test = '$server/test.php';

  // =========== Auth ========== //

  static const String signUp = '$server/auth/sign_up.php';
  static const String signIn = '$server/auth/sign_in.php';
  static const String verifyCode = '$server/auth/verify_code.php';
  static const String resendCode = '$server/auth/resend_code.php';

  // =========== Forget Password ========== //

  static const String checkEmail = '$server/forgetPassword/check_email.php';
  static const String verifyCodeResetPass =
      '$server/forgetPassword/verify_code_reset_password.php';
  static const String resetPassword =
      '$server/forgetPassword/reset_password.php';

  // =========== Home Page ========== //

  static const String home = '$server/home.php';
  static const String items = '$server/items.php';
  // =========== Images ========== //

  static const String categoriesImages = '$server/upload/categories';
  static const String itemsImages = '$server/upload/items';

  // =========== Favorite ========== //

  static const String addFavorite = '$server/favorite/add_favorite.php';
  static const String removeFavorite = '$server/favorite/remove_favorite.php';
  static const String myFavorites = '$server/favorite/my_favorites.php';
  static const String removeFromFavorites =
      '$server/favorite/remove_from_favorites.php';

  // =========== cart ========== //

  static const String addToCart = '$server/cart/add.php';
  static const String removeFromCart = '$server/cart/remove.php';
  static const String count = '$server/cart/count.php';
  static const String updateCount = '$server/cart/update_count.php';
  static const String getCartItems = '$server/cart/get_cart_items.php';
}
