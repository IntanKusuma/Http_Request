import 'package:modul7/base_network.dart';

class ApiDataSource{
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadUsers() {
    return BaseNetwork.get("users?delay=1");
  }
}