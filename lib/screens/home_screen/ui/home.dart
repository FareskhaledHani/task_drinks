import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_test/screens/home_screen/ui/widgets/curved_painter.dart';
import 'package:new_test/screens/home_screen/ui/widgets/custom_main_container_and_title_and_percent.dart';
import 'package:new_test/screens/home_screen/ui/widgets/profile_and_share_widget.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الجزء الأبيض السفلي
          Positioned.fill(
            child: Container(
              color: Colors.white,
            ),
          ),

          Positioned.fill(
            child: CustomPaint(
              painter: CurvedPainter(),
            ),
          ),
          // محتوى الشاشة
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProfileAndShare(),
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            verticalSpacing(20),
                            Text(
                              "Hello,Fares",
                              style: TextStyles.font27WhiteMedium,
                            ),
                            verticalSpacing(20),
                            const Divider(
                              thickness: 5,
                              endIndent: 330,
                              color: Colors.orange,
                            ),
                            verticalSpacing(40),
                            Text(
                              'Earn points with your purchases',
                              style: TextStyles.font16WhiteMedium,
                            ),
                            verticalSpacing(50),
                            Row(
                              children: [
                                SizedBox(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 10,
                                        color: Colors.orangeAccent,
                                      ),
                                      horizontalSpacing(5),
                                      Text(
                                        'of the day',
                                        style: TextStyles.font14WhiteRegular,
                                      )
                                    ],
                                  ),
                                ),
                                horizontalSpacing(30),
                                Text(
                                  'Meals',
                                  style: TextStyles.font14WhiteRegular,
                                ),
                                horizontalSpacing(30),
                                Text(
                                  'breakfasts',
                                  style: TextStyles.font14WhiteRegular,
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            verticalSpacing(30),
                            Transform.translate(
                              offset: const Offset(0, -10),
                              // لتقريب الصورة الثانية إلى الأعلى
                              child: const ClipRect(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  // المحاذاة إلى اليمين
                                  widthFactor: 0.7,
                                  // تحديد عرض الصورة المعروضة
                                  child: Image(
                                    height: 100,
                                    width: 120,
                                    image: AssetImage('assets/higher.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -70),
                              // لتقريب الصورة الثانية إلى الأعلى
                              child: const ClipRect(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  // المحاذاة إلى اليمين
                                  widthFactor: 0.7,
                                  // تحديد عرض الصورة المعروضة
                                  child: Image(
                                    height: 120,
                                    width: 120,
                                    image: AssetImage('assets/treee.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const Align(),
                          ],
                        ),
                      ],
                    ),
                    verticalSpacing(30),
                    Row(
                      children: [
                        Container(
                          height: 250.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.orangeAccent, width: 2),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '* Restrictions apply *',
                                      style: TextStyles.font9WhiteBold,
                                    ),
                                    const Image(
                                        image: AssetImage('assets/emo.png'))
                                  ],
                                ),
                                const Center(
                                    child: Image(
                                        image:
                                            AssetImage('assets/break1.png'))),
                                verticalSpacing(5),
                                Text(
                                  'In meow everything is better',
                                  style: TextStyles.font9GreyRegular,
                                ),
                                Text(
                                  '20% Discount',
                                  style: TextStyles.font21BlackRegular,
                                ),
                                Text(
                                  'In salads and salmon',
                                  style: TextStyles.font13DarkBlueMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        horizontalSpacing(10),
                        Column(
                          children: [
                            const CustomMainContainerAndTiteAndPercent(image:'assets/PngItem.png', title: 'Tenderloin pineapple', percent: '125.00', backGroundColor: ColorsManager.watermillon,),
                            verticalSpacing(10),
                            const CustomMainContainerAndTiteAndPercent(image:'assets/pngkey.png', title: 'Grilled chicken breast', percent: '125.00', backGroundColor: Colors.orange,),

                          ],
                        )
                      ],
                    ),
                    verticalSpacing(10),
                    Text('Best Meals', style: TextStyles.font21DarkBold),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorsManager.bluedac),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Enjoy delicious chicken For your family',
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

