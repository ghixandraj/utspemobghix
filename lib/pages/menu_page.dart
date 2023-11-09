import 'package:flutter/material.dart';
import 'package:main/pages/bmi_page.dart';
import 'package:main/pages/calculator_page.dart';
import 'package:main/pages/koversisuhu_page.dart';

import 'konversimassa_page.dart';
import 'konversipanjang_page.dart';
import 'konversiuang_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  Widget buildMenuItem(
    BuildContext context,
    String title,
    IconData icon,
    Function() onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            size: 48,
            color: Colors.white70, // Warna ikon diatur di sini
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white70, // Warna teks diatur di sini
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Center(
                    child: Image(
                      image: AssetImage('lib/images/splash.png'),
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Let\'s Calculate!',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'choose what you want to do',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      buildMenuItem(context, 'Kalkulator', Icons.calculate, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Calculator(),
                          ),
                        );
                      }),
                      buildMenuItem(context, 'Massa', Icons.scale_rounded, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MassConverter(),
                          ),
                        );
                      }),
                      buildMenuItem(context, 'Panjang', Icons.escalator_rounded,
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LengthConverter(),
                          ),
                        );
                      }),
                      buildMenuItem(context, 'BMI', Icons.accessibility_rounded,
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BMI(),
                          ),
                        );
                      }),
                      buildMenuItem(
                          context, 'Suhu', Icons.device_thermostat_sharp, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TemperatureConversionPage(),
                          ),
                        );
                      }),
                      buildMenuItem(
                          context, 'Mata Uang', Icons.monetization_on_rounded,
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Currencyconverterpage(),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
