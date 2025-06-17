import 'package:flutter/material.dart';
import 'package:flutter_app1/meet_22/api/get_user.dart';

class ListUserScreen extends StatelessWidget {
  static String id = "/users";
  const ListUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test API"), centerTitle: true, backgroundColor: Colors.amber),
      body: Column(
        children: [
          FutureBuilder(
            future: getUsers(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final user = snapshot.data?[index];
                    return ListTile(
                      title: Text("${user?.firstName} ${user?.lastName}"),
                      subtitle: Text(user!.email),
                      leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
                    );
                  },
                );
              } else {
                return Text("Error : ${snapshot.error}");
              }
            },
          ),
        ],
      ),
    );
  }
}
