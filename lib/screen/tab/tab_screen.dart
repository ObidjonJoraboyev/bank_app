//
// import 'package:flutter/material.dart';
//
// class TabScreen extends StatefulWidget {
//   const TabScreen({super.key});
//
//   @override
//   State<TabScreen> createState() => _TabScreenState();
// }
//
// class _TabScreenState extends State<TabScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("TAB"),
//       ),
//     );
//   }
// }
import 'package:exson_bank/screen/tab/plofiles/profile/profile_screen.dart';
import 'package:exson_bank/utils/size/size.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors/app_colors.dart';
import 'card/card_screen.dart';
import 'history/history_screen.dart';
import 'home/home_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> _screens = [];
  int _activeIndex = 1;

  @override
  void initState() {
    _screens = [
      const HomeScreen(),
      const CardScreen(),
      const HistoryScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _screens[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle : TextStyle(color: Colors.white),
        selectedLabelStyle : TextStyle(color: Colors.white),
        fixedColor: AppColors.black,
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor: AppColors.c_2C2C73,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: AppColors.white,
              size: 40,
            ),
            icon: Icon(
              Icons.home,
              color: AppColors.black,
              size: 40,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.credit_card,
              color: AppColors.white,
              size: 40,
            ),
            icon: Icon(
              Icons.credit_card,
              color: AppColors.black,
              size: 40,
            ),
            label: "Card",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.history,
              color: AppColors.white,
              size: 40,
            ),
            icon: Icon(
              Icons.history,
              color: AppColors.black,
              size: 40,
            ),
            label: "History",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.settings,
              color: AppColors.white,
              size: 40,
            ),
            icon: Icon(
              Icons.settings,
              color: AppColors.black,
              size: 40,
            ),
            label: "Setting",
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 50.w,
        height: 50.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: AppColors.c_FDB623.withOpacity(0.5),
              blurRadius: 30,
              spreadRadius: 0,
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: AppColors.c_7A7AFD,
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return QrScannerScreen(
            //         barcode: (barcode) {
            //           ScaffoldMessenger.of(context).showSnackBar(
            //             SnackBar(
            //               content: Text(barcode.code.toString()),
            //             ),
            //           );
            //           context.read<ScannerBloc>().add(
            //             AddScannerEvent(
            //               scannerModel: ScannerModel(
            //                 name: "Data",
            //                 qrCode: barcode.code.toString(),
            //               ),
            //             ),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // );
          },
          child: Icon(
            Icons.transform,
            size: 30.w,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
