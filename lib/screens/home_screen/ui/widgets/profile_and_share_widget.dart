import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_test/core/helper/spacing.dart';
import 'package:new_test/screens/share_screen/share_screen.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../profile_screen/profile_screen.dart';


class ProfileAndShare extends StatelessWidget {
  const ProfileAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0.h, right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: '',
               builder: (BuildContext context) {
                return const ProfileScreen();
              },
              );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/prof.jpg'),
            ),
          ),
           SizedBox(
            child: Row(
              children: [
                const Icon(FontAwesomeIcons.bell, color: ColorsManager.white),
                horizontalSpacing(
                  30.w
                ),
                GestureDetector(
                  onTap:(){
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: '',
                      builder: (BuildContext context) {
                      return ShareScreen();
                    },
                    );
                  } ,
                  child: Icon(
                    FontAwesomeIcons.shareAlt,
                    size: 29,
                    color: Colors.white,
                    opticalSize: 1,
                    grade: 1,
                    weight: 10,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}




