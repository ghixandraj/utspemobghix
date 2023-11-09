import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/pages/auth_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => AuthPage(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.lightBlue[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
                child: Image(
              image: AssetImage('lib/images/splash.png'),
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            )),
            SizedBox(height: 20),
            Text(
              'Calculator',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  fontSize: 32),
            ),
            SizedBox(height: 5),
            Text(
              'by Ghixandra',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
