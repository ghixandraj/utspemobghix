import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showInfoDialog('Password reset link sent! Check your email');
    } on FirebaseAuthException catch (e) {
      print(e);
      showInfoDialog(e.message.toString());
    }
  }

  void showInfoDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.lightBlue[900],
          title: Text(
            'Informasi',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          // Tambahkan Center widget disini
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Reset Password',
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 25),

                Center(
                    child: Image(
                  image: AssetImage('lib/images/loginregisforgot.png'),
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                )),

                SizedBox(height: 25),

                Text(
                  'enter your email and we will send you a reset password link',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),

                SizedBox(height: 25),

                // Email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                SizedBox(height: 30),

                ElevatedButton(
                  onPressed: passwordReset,
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                        color: Colors.lightBlue[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          100), // Atur angka sesuai dengan keinginan Anda
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
