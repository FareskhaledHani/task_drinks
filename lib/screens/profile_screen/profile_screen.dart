import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helper/spacing.dart';
import '../../core/theming/styles.dart';
import '../home_screen/ui/widgets/custom_buttom_container_and_photo.dart';
import '../home_screen/ui/widgets/custom_container_item_and_points.dart';
import '../home_screen/ui/widgets/custom_container_with_color_And_percient.dart';
import '../home_screen/ui/widgets/custom_container_with_dollar_and_icon.dart';
import '../home_screen/ui/widgets/custom_dolar_icon_container.dart';
import '../home_screen/ui/widgets/custom_top_container_buy_and_win.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الخلفية الشفافة
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpacing(50.h),
                const CustomContainerWithProfileAndPercent(),
                verticalSpacing(10),
                const CustomContainerWithDollarAndPoints(),
                verticalSpacing(10),
                Row(
                  children: [
                    horizontalSpacing(15.w),
                    Text(
                      'Redeem Your Points',
                      style: TextStyles.font21DarkBold,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                verticalSpacing(10.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomContainerItemsAndPoints(nameItems: 'Lomo en piña', numberPoints: 1500, image: 'assets/one.png', backGroundColor: Color(0xffF4C264),),
                    CustomContainerItemsAndPoints(nameItems: 'Pechuga a la plancha', numberPoints: 1300, image: 'assets/tomatoAnd.png', backGroundColor: Color(0xff48419F),),
                    CustomContainerItemsAndPoints(nameItems: 'Toronja en rocas', numberPoints: 700, image: 'assets/cup.png',backGroundColor: Color(0xffF5835E),),

                  ],
                ),
              ],
            ),
          ),
        ),
        //top Container
        Positioned(
          top: MediaQuery.of(context).size.height * 0.06,
          left: MediaQuery.of(context).size.width * 0.13,
          right: MediaQuery.of(context).size.width * 0.13,
          child: const CustomTopContainer(),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.006,
          left: MediaQuery.of(context).size.width * 0.11,
          //  right: MediaQuery.of(context).size.width * 7,
          child: CustomDolarIconContainer(
            height: 80.h,
            width: 50.w,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.12,
          left: MediaQuery.of(context).size.width * 0.2,
          //  right: MediaQuery.of(context).size.width * 7,
          child: CustomDolarIconContainer(
            height: 30.h,
            width: 20.w,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.06,
          // left: MediaQuery.of(context).size.width * 0.6,
          right: MediaQuery.of(context).size.width * 0.16,
          child: CustomDolarIconContainer(
            height: 40.h,
            width: 20.w,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          child: const CustomBottomContainer(),
        ),
      ],
    );
  }
}

