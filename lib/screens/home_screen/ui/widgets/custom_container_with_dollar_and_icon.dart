import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class CustomContainerWithDollarAndPoints extends StatelessWidget {
  const CustomContainerWithDollarAndPoints({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5, // Elevation level
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 100.h,
        width: 320.w,
        decoration: const BoxDecoration(
        ),
        child: Column(
          children: [
            ListTile(
              minVerticalPadding: 25.h,
              leading: const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/dollar.png'),
              ),
              title: Text('Fares', style: TextStyles
                  .font11bGrayRegular,),
              subtitle: Text('12300 points',
                  style: TextStyles
                      .font21DarkBold),
              trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[300], // لون خلفية الزر
                    foregroundColor: Colors.white, // لون النص أو الأيقونة
                    shadowColor: Colors.grey, // لون الظل
                    elevation: 5, // ارتفاع الظل
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15), // المسافات الداخلية
                  ),
                  onPressed: () {}, child: Text('Extra Bonus',style: TextStyles.font11bWhiteRegular,)),
            ),
          ],
        ),
      ),
    );
  }
}
