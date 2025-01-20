import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/styles.dart';

class CustomContainerItemsAndPoints extends StatelessWidget {
  const CustomContainerItemsAndPoints({
    super.key, required this.nameItems, required this.numberPoints, required this.image, required this.backGroundColor,
  });

  final String nameItems;
  final Color backGroundColor;
  final String image;
  final double numberPoints;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 114.h,
          width: 80.w,
          color: Colors.white,// عرض الحاوية
          // اللون الأساسي (90%)
        ),
        Positioned(
          bottom: 0, // تحديد الجزء العلوي
          child: Container(
            height: 90.h, // 10% من الارتفاع الكلي
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //
              color: backGroundColor,// نفس عرض الحاوية
            ),
            child: Column(
              children: [
                verticalSpacing(45.h),
                // Lomo en piña
                Text(nameItems,style: TextStyles.font9WhiteRegular,),
                verticalSpacing(8),
                Container(
                  width: 60.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffFF9D17), // اللون الأول
                        Color(0xffF5B65F), // اللون الأول
                        // اللون الثاني
                      ],
                      begin: Alignment.topRight, // بداية التدرج
                      end: Alignment.bottomLeft, // نهاية التدرج
                    ),
                  ),
                  child: Center(child: Text('${numberPoints} points',style: TextStyles.font9WhiteRegular,)),
                )
              ],
            ),
            // اللون الأصفر
          ),
        ),
        Positioned(
            top: 1.h,
            left: 11.w,
            //assets/one.png
            child: Image.asset(image))
      ],
    );
  }
}