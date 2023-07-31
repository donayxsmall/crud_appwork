import 'package:crud_user_appwork/core.dart';
import 'package:crud_user_appwork/service/user_service/user_service.dart';
import 'package:flutter/material.dart';

class UserListController extends State<UserListView> {
  static late UserListController instance;
  late UserListView view;

  @override
  void initState() {
    instance = this;
    getUser();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List users = [];

  getUser() async {
    // showLoading();
    try {
      users = await UserService().getUsers();
      setState(() {});
    } on DioException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }

    // hideLoading();

    // setState(() {});
  }

  doDelete(int id) async {
    await UserService().delete(id: id);
    getUser();
  }
}
