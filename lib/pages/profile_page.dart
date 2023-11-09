import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/pages/textbox.dart';

void signOutConfirmation(BuildContext context) async {
  bool confirm = false;
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.amber,
      title: Text(
        "Konfirmasi Logout",
        style: TextStyle(color: Colors.lightBlue[900]),
      ),
      content: Text("Anda yakin ingin logout?"),
      actions: [
        //cancel
        TextButton(
          child: Text(
            'Tidak',
            style: TextStyle(color: Colors.red[900]),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        //logout
        TextButton(
          child: Text(
            'Ya',
            style: TextStyle(color: Colors.green[900]),
          ),
          onPressed: () {
            confirm = true;
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );

  if (confirm) {
    FirebaseAuth.instance.signOut();
  }
}

void signUserOut(BuildContext context) {
  signOutConfirmation(context);
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.amber,
        title: Text(
          "Edit " + field,
          style: TextStyle(color: Colors.lightBlue[900]),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.lightBlue[900]),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          //cancel
          TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.red[900]),
              ),
              onPressed: () => Navigator.pop(context)),
          //save
          TextButton(
              child: Text(
                'Save',
                style: TextStyle(color: Colors.green[900]),
              ),
              onPressed: () => Navigator.of(context).pop(newValue)),
        ],
      ),
    );

    //update in firestore
    if (newValue.trim().length > 0) {
      await usersCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'Profile',
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;

              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 15),
                    child: GestureDetector(
                      onTap: () {
                        signUserOut(context);
                      },
                      child: Icon(
                        Icons.logout,
                        size: 24,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage('lib/images/pp.png'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userData['username'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.amber, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    currentUser.email!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 15),
                  ),
                  Column(
                    children: [
                      MyTextBox(
                        text: userData['username'],
                        sectionName: 'username',
                        onPressed: () => editField('username'),
                      ),
                      MyTextBox(
                        text: userData['bio'],
                        sectionName: 'bio',
                        onPressed: () => editField('bio'),
                      ),
                    ],
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error${snapshot.error}'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
