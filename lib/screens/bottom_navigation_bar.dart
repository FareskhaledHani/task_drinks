

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_test/core/helper/spacing.dart';
import 'package:new_test/core/theming/colors.dart';
import 'package:new_test/screens/pay_screen/pay.dart';
import '../core/helper/service_locator.dart';
import '../core/theming/styles.dart';
import 'dialog_screen_bottom_tems/ui/dialog_screen_items.dart';
import 'drinks_screen.dart';
import 'home_screen/ui/home.dart';
import 'items_screen/controller/product_bloc.dart';
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
    // TODO: implement initState
    super.initState();
  }

  int _currentIndex = 0; // HomeScreen تكون الافتراضية في المنتصف
  bool _isDialogVisible = false; // للتحكم في إظهار مربع الحوار

  final List<Widget> _pages = [
    const HomeScreen(),
    BlocProvider(
      create: (context) => ProductBloc(getIt())..add(GetProductsEvent()),
      child: const DrinksScreen(),
    ),
    LoveScreen(),
    LocationScreen(),
    ListOfItemsDialog(onClose: () {},)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _pages[_currentIndex],
            // الصفحة الحالية
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
                // عرض مربع الحوار عند الضغط على العنصر الثاني (LoveScreen)
                _isDialogVisible = true;
              } else {
                _isDialogVisible = false; // إخفاء مربع الحوار
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

              //assets/XMLID_1193_.png
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue, // لون الخلفية الدائرية
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(10), // زيادة المسافة حول الأيقونة
                child:  const ImageIcon(AssetImage('assets/XMLID_1193_.png',),size: 40,color: ColorsManager.white,),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              //assets/Icon feather-heart.png
              icon: ImageIcon(AssetImage('assets/Icon feather-heart.png')),
              label: '',
            ),
            const BottomNavigationBarItem(
              //assets/wallet.png
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


