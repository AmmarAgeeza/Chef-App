class EndPoint {
  static const String baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
  static const String chefSignIn = 'chef/signin';
  static const String chefChangePassword = 'chef/change-password';
  static const String chefDelete = 'chef/delete';
  static const String chefGet = 'chef/get-chef/';
  static const String sendCode = 'chef/send-code';
  static const String changeForgottenPassword =
      'chef/change-forgotten-password';
  static const String updateChef = 'chef/update';
  static const String logout = 'chef/logout';
  static const String addMeal = 'meal/add-to-menu';
  static const String updateMeal = 'chef/update-meal/';
  static const String deleteMeal = 'meal/delete-meal/';
  static const String getAllMeal = 'meal/get-meals';

  static String getChefDataEndPoint(id) {
    return '$chefGet$id';
  }

  static String getupdateMealEndPoint(id) {
    return '$updateMeal$id';
  }

  static String getdeleteMealEndPoint(id) {
    return '$deleteMeal$id';
  }
  static String getAllChefMeals(id) {
    return 'chef/get-chef/$id/meals';
  }
}

class ApiKeys {
  static const String id = 'id';
  static const String email = 'email';
  static const String password = 'password';
  static const String confirmPassword = 'confirmPassword';
  static const String code = 'code';
  static const String message = 'message';
  static const String token = 'token';
  static const String name = 'name';
  static const String description = 'description';
  static const String price = 'price';
  static const String category = 'category';
  static const String mealImages = 'mealImages';
  static const String howToSell = 'howToSell';
}
