import 'package:dfvue/Providers/profileProvider.dart';
import 'package:dfvue/Repositories/authentication_repo.dart';
import 'package:dfvue/Repositories/user_repository.dart';
import 'package:dfvue/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Profile'),
        ),
        body: Consumer<ProfileProvider>(
          builder: (context, profile, child) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: profile.isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Name: ${profile.userProfile!.name}',
                          style: TextStyle(fontSize: 20)),
                      SizedBox(height: 10),
                      Text('Email: ${profile.userProfile!.email}',
                          style: TextStyle(fontSize: 20)),
                      SizedBox(height: 10),
                      Text('Password: ${profile.userProfile!.password}',
                          style: TextStyle(fontSize: 20)),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to edit profile screen
                        },
                        child: Text('Edit Profile'),
                      ),
                    ],
                  ),
          ),
        ));
  }
}
