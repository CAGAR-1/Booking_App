enum APIPath {
  // AUTH  //
  login,

  //HOME//
  imageSlider,
  category
}

class APIPathHelper {
  static const String baseUrl = "http://192.168.1.4/go_fresha_backend";
  static String authAPIs(APIPath path, {String? keyword}) {
    switch (path) {
      case APIPath.login:
        return "/login.php";

      default:
        return "";
    }
  }

  static String homeAPIs(APIPath path, {String? keyword, String? id}) {
    switch (path) {
      case APIPath.imageSlider:
        return "/get_PackageAndOffer.php";
      case APIPath.category:
        return "/getCategories.php";

      default:
        return "";
    }
  }
}
