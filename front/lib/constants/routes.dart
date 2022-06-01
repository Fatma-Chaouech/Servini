enum Routes {
  WELCOME,
}

extension RoutesExtension on Routes {
  String get path {
    return this.toString().split('.').last;
  }
}

const API_URL = 'http://10.0.2.2:3000';