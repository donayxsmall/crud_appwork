import 'package:flutter/material.dart';

import 'package:crud_user_appwork/core.dart';
import 'package:crud_user_appwork/shared/util/validator/validator.dart';
import 'package:crud_user_appwork/shared/widget/form/date_picker/datepicker.dart';
import 'package:crud_user_appwork/shared/widget/form/dropdown/dropdown.dart';
import 'package:crud_user_appwork/shared/widget/form/image_picker/image_picker.dart';
import 'package:crud_user_appwork/shared/widget/form/textfield/text_field.dart';

import '../controller/user_form_controller.dart';

class UserFormView extends StatefulWidget {
  const UserFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  final Map? item;

  Widget build(context, UserFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("UserForm"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        QImagePicker(
                          label: "Photo",
                          validator: Validator.required,
                          value: controller.photo,
                          onChanged: (value) {
                            controller.photo = value;
                          },
                        ),
                        QTextField(
                          label: "First Name",
                          validator: Validator.required,
                          value: controller.firstName,
                          onChanged: (value) {
                            controller.firstName = value;
                          },
                        ),
                        QTextField(
                          label: "Last Name",
                          value: controller.lastName,
                          onChanged: (value) {
                            controller.lastName = value;
                          },
                        ),
                        QTextField(
                          label: "Email",
                          validator: Validator.email,
                          suffixIcon: Icons.email,
                          value: controller.email,
                          onChanged: (value) {
                            controller.email = value;
                          },
                        ),
                        QDropdownField(
                          label: "Gender",
                          validator: Validator.required,
                          value: controller.gender,
                          items: const [
                            {
                              "label": "Male",
                              "value": 1,
                            },
                            {
                              "label": "Female",
                              "value": 2,
                            }
                          ],
                          onChanged: (value, label) {
                            controller.gender = label;
                          },
                        ),
                        QTextField(
                          label: "Birth Place",
                          validator: Validator.required,
                          value: controller.birthPlace,
                          onChanged: (value) {
                            controller.birthPlace = value;
                          },
                        ),
                        QDatePicker(
                          label: "Birth Date",
                          validator: Validator.required,
                          value: controller.birthDate == null
                              ? null
                              : DateTime.parse(controller.birthDate!),
                          onChanged: (value) {
                            controller.birthDate = value.toString();
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                            ),
                            onPressed: () {
                              controller.doSave();
                            },
                            child: const Text("Save"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<UserFormView> createState() => UserFormController();
}
