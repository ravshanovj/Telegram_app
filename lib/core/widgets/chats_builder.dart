import 'package:flutter/material.dart';
import 'package:telegram_app/core/widgets/my_container.dart';
import 'package:telegram_app/data/model/users_model.dart';
import 'package:telegram_app/data/service/users_service.dart';

class ChatsBuilder extends StatelessWidget {
  const ChatsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UsersService().getUsers(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          List<UsersModel> data = snapshot.data as List<UsersModel>;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return MyContainer(
                title: data[index].name.toString(),
                subtitle: data[index].username.toString(),
                index: index,
              );
            },
          );
        }
      },
    );
  }
}