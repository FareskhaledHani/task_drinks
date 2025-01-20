import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/service_locator.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../items_screen/controller/product_bloc.dart';
import '../../items_screen/items.dart';
import 'custom_items_and_container_title.dart';

class BottomDialog extends StatelessWidget {
  final VoidCallback onClose;

  const BottomDialog({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Colors.transparent, // خلفية شفافة
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // تأثير التمويه
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // لون مع شفافية
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Menu ',
                      style: TextStyles.font30DarkMedium,
                    ),
                    verticalSpacing(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomItemNameAndPhoto(
                          title: 'Drink',
                          backGround: 'assets/cocktail.png',
                          backGroundColor: ColorsManager.orangedac,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return BlocProvider(
                                    create: (context) => ProductBloc(getIt())
                                      ..add(GetProductsEvent()),
                                    child: ListOfItemsDialog(
                                      onClose: () {},
                                    ),
                                  );
                                });
                          },
                        ),
                        CustomItemNameAndPhoto(
                          title: 'Coffe',
                          backGround: 'assets/coffee-cup.png',
                          backGroundColor: ColorsManager.white,
                          onTap: () {},
                        ),
                        CustomItemNameAndPhoto(
                          title: 'FGGS',
                          backGround: 'assets/breakfast.png',
                          backGroundColor: ColorsManager.white,
                          onTap: () {},
                        ),
                      ],
                    ),
                    verticalSpacing(30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomItemNameAndPhoto(
                          title: 'MEATS',
                          backGround: 'assets/meat.png',
                          backGroundColor: ColorsManager.white,
                          onTap: () {},
                        ),
                        CustomItemNameAndPhoto(
                          title: 'SALADS',
                          backGround: 'assets/outline.png',
                          backGroundColor: ColorsManager.white,
                          onTap: () {},
                        ),
                        CustomItemNameAndPhoto(
                          title: 'SOUPS',
                          backGround: 'assets/soup.png',
                          backGroundColor: ColorsManager.white,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
