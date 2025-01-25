import 'package:assignment/constants/apis.dart';
import 'package:assignment/data/handlers/http_handlers.dart';
import 'package:assignment/data/models/user_model.dart';

class UserRepository {
  HttpHandlers httpHandlers = HttpHandlers();
  Future<UserResponseModel> fetchUsers(
      {required int page, int results = 10}) async {
    final response =
        await httpHandlers.get('${APIS.BASE_URL}?page=$page&results=$results');
    return UserResponseModel.fromJson(response);
  }
}
