import 'package:flutter/material.dart';
import 'package:modul7/api_data_source.dart';
import 'package:modul7/user_detail_page.dart';
import 'package:modul7/users.model.dart';

class HalamanUsers extends StatelessWidget {
  const HalamanUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Users'),
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('ADA ERROR');
          }
          if (snapshot.hasData) {
            ClassModul users = ClassModul.fromJson(snapshot.data!);
            return ListView.builder(
              itemCount: users.data!.length,
              itemBuilder: (context, index) {
                var user = users.data![index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UserDetailPage(user: user),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(user.avatar!),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text('${user.email}'),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
