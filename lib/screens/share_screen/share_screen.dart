import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_test/core/theming/colors.dart';
import 'package:new_test/screens/share_screen/widgets/custom_dotet_widget.dart';

import '../../core/helper/spacing.dart';
import '../../core/theming/styles.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({
    super.key,
  });

  final String textTopCopy = "This is the text to copy!";

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
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff45108A), // اللون الأول
                  Color(0xff45108A), // اللون الأول
                  Color(0xff3D065F), // اللون الأول
                  Color(0xff472EBC), // اللون الأول
                  Color(0x0ff0054d), // اللون الأول
                ],
                begin: Alignment.topCenter, // بداية التدرج
                end: Alignment.bottomCenter, // نهاية التدرج
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  verticalSpacing(230.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Text(
                      'Share with 10 friends And get bonus',
                      style: TextStyles.font21WhiteRegular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalSpacing(20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Text(
                      'Help us to continue growing, share the application with Your friends and receive up to 20% discount on House products 😍😍',
                      style: TextStyles.font12WhiteBlueRegular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalSpacing(20),
                  CustomPaint(
                    painter: DottedRectanglePainter(),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 30.w),
                      decoration: BoxDecoration(
                        color: ColorsManager.bluedac,
                          borderRadius: BorderRadius.circular(30)),
                      height: 74.h,
                      width: 325.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your invitation code',
                            style: TextStyles.font9WhiteRegular,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'FLUTTER2021',
                                style: TextStyles.font26WhiteBold,
                              ),
                              Container(
                                height: 40.h,
                                color: Colors.white,
                                width: 2,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.copy,
                                  size: 20,
                                  color: ColorsManager.white,
                                ),
                                // أيقونة النسخ
                                onPressed: () {
                                  // نسخ النص إلى الحافظة
                                  Clipboard.setData(
                                          ClipboardData(text: textTopCopy))
                                      .then((_) {
                                    // إظهار رسالة منبثقة عند النسخ بنجاح
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Copied to clipboard!")),
                                    );
                                  });
                                },
                              ),
                              SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: Text('COPY CODE',style: TextStyles.font9WhiteRegular,))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  verticalSpacing(50.h),
                  ElevatedButton(
                    onPressed: () {
                      // الإجراء عند الضغط
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero, // إزالة الحشو الافتراضي
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90), // حواف دائرية
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [ColorsManager.orangedac, ColorsManager.orange], // ألوان التدرج
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        ),
                        borderRadius: BorderRadius.circular(29), // نفس الحواف
                      ),
                      child: Container(
                        alignment: Alignment.center, // محاذاة النص إلى المنتصف
                        height: 50.h, // ارتفاع الزر
                        width: 250.w, // عرض الزر
                        child: const Text(
                          'Share',
                          style: TextStyle(
                            color: Colors.white, // لون النص
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
        //top Container
        Positioned(
            top: MediaQuery.of(context).size.height * 0.02,
            left: MediaQuery.of(context).size.width * 0.13,
            right: MediaQuery.of(context).size.width * 0.13,
            child: const Image(image: AssetImage('assets/air.png'))),
      ],
    );
  }
}

