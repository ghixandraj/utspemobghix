import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:main/pages/bmi_page.dart';
import 'package:main/pages/menu_page.dart';

import '../pages/grafiktab.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar();

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.home_work_outlined,
        color: Colors.amber.shade300,
      ),
      Icon(
        Icons.calculate_outlined,
        color: Colors.amber.shade300,
      ),
      Icon(
        Icons.add_chart_rounded,
        color: Colors.amber.shade300,
      ),
      Icon(
        Icons.account_circle_outlined,
        color: Colors.amber.shade300,
      ),
    ];

    List<Widget> screens = [
      HomePage(),
      MenuPage(),
      GrafikTab(),
      Profile(),
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.lightBlue[900],
      body: IndexedStack(
        children: screens,
        index: index,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          index: index,
          items: items,
          backgroundColor: Colors.transparent,
          color: Colors.lightBlue.shade800,
          animationDuration: Duration(milliseconds: 300),
          // animationCurve: Curves.ease,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          // if (newIndex == 0) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => HomePage()),
          //   );
          // } else if (newIndex == 1) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => BMI()),
          //   );
          // } else if (newIndex == 2) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => Profile()),
          //   );
          // }
          // },
        ),
      ),
    );
  }

  List<Widget> get screens => [
        HomePage(),
        BMI(),
        Profile(),
      ];
}
