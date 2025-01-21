import 'package:flutter/material.dart';
import 'package:new_test/core/theming/colors.dart';
import 'package:new_test/screens/pay_screen/pay.dart';

import 'dialog_screen_bottom_tems/ui/dialog_screen_items.dart';
import 'home_screen/ui/home.dart';
import 'items_screen/items.dart';
import 'location_screen/location.dart';
import 'love_screen/love.dart';

class BottomNavBarCustom extends StatefulWidget {
  @override
  _BottomNavBarCustomState createState() => _BottomNavBarCustomState();
}

class _BottomNavBarCustomState extends State<BottomNavBarCustom> {
  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;
  bool _isDialogVisible = false;

  final List<Widget> _pages = [
    const HomeScreen(),
    const LocationScreen(),
    ListOfItemsDialog(onClose: () {},),
    const LoveScreen(),
    const PayScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _pages[_currentIndex],
            if (_isDialogVisible)
              BottomDialog(
                  onClose: () => setState(() => _isDialogVisible = false)
              ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xffEAECF0).withOpacity(0.85),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              if (index == 2) {
                _isDialogVisible = true;
              } else if (index == 3) {

                _isDialogVisible = false;
                _currentIndex = index;
              } else {
                _isDialogVisible = false;
                _currentIndex = index;
              }
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/Icon feather-home.png')),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/Icon feather-map-pin.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(10),
                child: const ImageIcon(AssetImage('assets/XMLID_1193_.png',), size: 40, color: ColorsManager.white),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/Icon feather-heart.png')),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/wallet.png')),
              label: '',
            ),
          ],
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
