import 'package:crud_user_appwork/shared/util/dialog/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:crud_user_appwork/core.dart';

class UserListView extends StatefulWidget {
  const UserListView({Key? key}) : super(key: key);

  Widget build(context, UserListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("UserList"),
        actions: const [],
      ),
      body: controller.users.isEmpty
          ? const Text('sdsdsd')
          : ListView.builder(
              itemCount: controller.users.length,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.users[index];
                var birthDate = item['birth_date'] != null
                    ? ", ${DateFormat("d MMM y").format(DateTime.parse(item['birth_date']))}"
                    : '';
                return InkWell(
                  onTap: () async {
                    await Get.to(UserFormView(
                      item: item,
                    ));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.grey, width: 1)),
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  backgroundImage: imageProvider),
                            ),
                            imageUrl: item['photo'],
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          SizedBox(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['first_name'] + " " + item['last_name'],
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  item['email'],
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  item['birth_place'] + " " + birthDate,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: item['gender'] == 'Female'
                                ? const Icon(
                                    Icons.female,
                                    color: Colors.pink,
                                  )
                                : const Icon(
                                    Icons.male,
                                    color: Colors.blue,
                                  ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {
                                  showConfirmationDialog().then((value) {
                                    if (value) {
                                      controller.doDelete(item['id']);
                                    }
                                  });
                                  // controller.doDelete(item['id']);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(const UserFormView());
        },
      ),
    );
  }

  @override
  State<UserListView> createState() => UserListController();
}
