
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/styles.dart';

class CustomMainContainerAndTiteAndPercent extends StatelessWidget {
  const CustomMainContainerAndTiteAndPercent({
    super.key, required this.image, required this.title, required this.percent, required this.backGroundColor,
  });
  final String image;
  final String title;
  final String percent;
  final Color backGroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(15)),
      height: 115.h,
      width: 150.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image.asset(image)),
          verticalSpacing(10),
          Text(title,
              style: TextStyles.font11blackRegular,
              textAlign: TextAlign.center),
          Text(
            percent,
            style: TextStyles.font11blackRegular,
          ),
        ],
      ),
    );
  }
}
