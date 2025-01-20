import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/styles.dart';

class CustomTopContainer extends StatelessWidget {
  const CustomTopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffF5B65F), Color(0xffFF9D17)],
          // الألوان المستخدمة في التدرج
          begin: Alignment.topLeft,
          // بداية التدرج
          end: Alignment.bottomRight, // نهاية التدرج
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 50.0.w, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buy and win',
              style: TextStyles.font16WhiteBold,
            ),
            verticalSpacing(10),
            SizedBox(
              width: 120.w,
              child: Text(
                'All your purchases have Acumelative points',
                style: TextStyles.font9WhiteRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
