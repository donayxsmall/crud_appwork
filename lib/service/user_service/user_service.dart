import 'package:crud_user_appwork/constant.dart';
import 'package:dio/dio.dart';

class UserService {
  add(Map item) async {
    await Dio().post(
      "$urlApi/api/users",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: item,
    );
  }

  update({
    required int id,
    required Map item,
  }) async {
    await Dio().post(
      "$urlApi/api/users/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: item,
    );
  }

  delete({required id}) async {
    await Dio().delete(
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      "$urlApi/api/users/$id",
    );
  }

  getUsers() async {
    var response = await Dio().get(
      "$urlApi/api/users",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj['data'];
  }
}
