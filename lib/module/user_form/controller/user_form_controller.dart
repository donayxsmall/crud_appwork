import 'package:crud_user_appwork/core.dart';
import 'package:crud_user_appwork/service/user_service/user_service.dart';
import 'package:crud_user_appwork/shared/util/dialog/show_info_dialog.dart';
import 'package:crud_user_appwork/shared/util/show_loading/show_loading.dart';
import 'package:flutter/material.dart';

class UserFormController extends State<UserFormView> {
  static late UserFormController instance;
  late UserFormView view;

  @override
  void initState() {
    instance = this;
    if (isEditMode) {
      id = widget.item!['id'];
      firstName = widget.item!['first_name'];
      lastName = widget.item!['last_name'];
      email = widget.item!['email'];
      gender = widget.item!['gender'];
      birthPlace = widget.item!['birth_place'];
      birthDate = widget.item!['birth_date'];
      photo = widget.item!['photo'];
    }

    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool get isEditMode => widget.item != null;

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? birthPlace;
  String? birthDate;
  String? photo;

  final formKey = GlobalKey<FormState>();

  doSave() async {
    final form = formKey.currentState;
    if (form == null || !form.validate()) return;

    try {
      showLoading();

      if (isEditMode) {
        await UserService().update(id: widget.item!['id'], item: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'gender': gender,
          'birth_place': birthPlace,
          'birth_date': birthDate,
          'photo': photo,
        });
      } else {
        await UserService().add({
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'gender': gender,
          'birth_place': birthPlace,
          'birth_date': birthDate,
          'photo': photo,
        });
      }

      hideLoading();
      Get.offAll(const UserListView());
    } on Exception catch (err) {
      showInfoDialog('Data Error $err');
      hideLoading();
    }
  }
}
