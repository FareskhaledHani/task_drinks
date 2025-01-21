import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theming/colors.dart';
import '../model/catogry.dart';

class CustomListFromLocal extends StatelessWidget {
  const CustomListFromLocal({
    super.key,
    required this.categoryItems,
  });

  final List<CategoryItem> categoryItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryItems.length,
        itemBuilder: (context, index) {
          final item = categoryItems[index];
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.27, // 80% of screen width
            height: MediaQuery.of(context).size.height * 0.4, // 40% of screen height
            child: Card(
              elevation: 8,
              color: ColorsManager.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    item.imagePath,
                    fit: BoxFit.fill,
                  ),
                  verticalSpacing(20.h),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
