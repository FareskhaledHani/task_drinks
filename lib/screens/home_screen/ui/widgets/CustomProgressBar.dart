
import 'package:flutter/material.dart';
import 'package:new_test/core/helper/spacing.dart';

import '../../../../core/theming/styles.dart';

class ProgressBar extends StatelessWidget {
  final double progress; // نسبة الإكمال (بين 0.0 و 1.0)

  const ProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your Profile : ${progress*100}% complete',style: TextStyles.font12DarkBlueRegular),
              Image.asset('assets/flag.png'),
            ],

          ),
        ),
        verticalSpacing(10),
        Container(
          height: 10.0, // ارتفاع شريط التقدم
          width: MediaQuery.of(context).size.width*0.7, // عرض الشريط ليملأ الشاشة
          decoration: BoxDecoration(
            color: Colors.grey, //
            borderRadius: BorderRadius.circular(10), // حواف دائرية
          ),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * progress, // عرض نسبة التقدم
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.lightGreen, Colors.lightBlueAccent], // ألوان التدرج
                  ),
                  borderRadius: BorderRadius.circular(10), // حواف دائرية
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
