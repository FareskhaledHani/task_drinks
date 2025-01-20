import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theming/styles.dart';

class CustomItemNameAndPhoto extends StatelessWidget {
  const CustomItemNameAndPhoto({
    super.key,
    required this.title,
    required this.backGround,
    required this.backGroundColor, required this.onTap,
  });

  final String backGround;
  final String title;
  final Color backGroundColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap:onTap ,
          child: Container(
            height: 64.h,
            width: 64.w,
            decoration: BoxDecoration(
              color: backGroundColor,
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(image: AssetImage(backGround)),
              //'assets/cocktail.png'
            ),
          ),
        ),
        verticalSpacing(5.h),
        Text(
          title,
          style: TextStyles.font14DarkBlueMedium,
        ),
      ],
    );
  }
}
