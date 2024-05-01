import 'package:bank_app/screens/tab/card_/card_screen.dart';
import 'package:bank_app/screens/tab/history/history_screen.dart';
import 'package:bank_app/screens/tab/home/home_screen.dart';
import 'package:bank_app/screens/tab/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> screens = [
    const HomeScreen(),
    const CardScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: CupertinoColors.activeBlue,
        selectedLabelStyle:
            const TextStyle(color: CupertinoColors.activeBlue, fontSize: 14),
        unselectedLabelStyle:
            const TextStyle(color: CupertinoColors.black, fontSize: 14),
        unselectedItemColor: Colors.grey,
        onTap: (v) {
          activeIndex = v;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
              label: "Home", icon: Icon(CupertinoIcons.house_fill)),
          BottomNavigationBarItem(
              label: "Card", icon: Icon(CupertinoIcons.creditcard_fill)),
          BottomNavigationBarItem(
              label: "History", icon: Icon(CupertinoIcons.time)),
          BottomNavigationBarItem(
              label: "Profile", icon: Icon(CupertinoIcons.profile_circled)),
        ],
      ),
    );
  }
}
