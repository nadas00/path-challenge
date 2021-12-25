class ApiRoutes {
  static ApiRoutes? _instance;

  static ApiRoutes get instance {
    _instance ??= ApiRoutes._();
    return _instance!;
  }

  ApiRoutes._();

  final String characters = "/characters";
}
