import 'package:flutter/material.dart';
import 'package:modul7/users.model.dart';

class UserDetailPage extends StatelessWidget {
  final Data user; // Menerima objek User untuk ditampilkan

  UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage('${user.avatar}'),
              ),
              SizedBox(height: 20,),
              Text('ID: ${user.id}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text(
                'Name: ${user.firstName} ${user.lastName}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text(
                'Email: ${user.email}',
                style: TextStyle(fontSize: 18),
              ),
              // Tambahkan detail lainnya sesuai kebutuhan dari objek User
            ],
          ),
        ),
      ),
    );
  }
}
