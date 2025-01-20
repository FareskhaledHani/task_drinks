
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomContainer extends StatelessWidget {
  const CustomBottomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage(
              'assets/BottomContainer.png',
            ),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
    );
  }
}
