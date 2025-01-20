import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/styles.dart';
import 'CustomProgressBar.dart';
import 'custom_flag_with_name.dart';

class CustomContainerWithProfileAndPercent extends StatelessWidget {
  const CustomContainerWithProfileAndPercent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5, // Elevation level
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height:218.h,
        width: 320.w,
        decoration: const BoxDecoration(
        ),
        child: Column(
          children: [
            ListTile(
              leading:  CircleAvatar(
                backgroundImage: AssetImage('assets/prof.jpg'),
              ),
              title: Text('Fares', style: TextStyles.font18DarkBlueBold,),
              subtitle: Text('fareskhaled@gmail.com',style: TextStyles.font12GrayMedium),
              trailing: Icon(Icons.qr_code_scanner,size: 40,),
            ),

            const ProgressBar(progress: 0.5,),
            verticalSpacing(20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomFlagWithNumberContainer(image: 'assets/flag2.png', nameFlag: '15.000',),
                CustomFlagWithNumberContainer(image: 'assets/flag1.png', nameFlag: '10.000',),
                CustomFlagWithNumberContainer(image: 'assets/flag3.png', nameFlag: '5.000',),
                CustomFlagWithNumberContainer(image: 'assets/flag4.png', nameFlag: '1.000',),
              ],),
            verticalSpacing(10),
            const Divider(thickness: 2,indent: 10,endIndent: 10,),
            verticalSpacing(20),
            Text('Copmplete your profile to get abounes',style: TextStyles.font12OrangeMedium,),
          ],
        ),
      ),
    );
  }
}
