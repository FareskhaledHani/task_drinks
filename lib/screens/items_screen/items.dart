import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_test/core/theming/colors.dart';
import 'package:new_test/screens/items_screen/widgets/custom_list_from_local.dart';
import 'package:new_test/screens/items_screen/widgets/custom_list_from_network.dart';
import '../../core/helper/spacing.dart';
import '../../core/theming/styles.dart';

import 'model/catogry.dart';


class ListOfItemsDialog extends StatefulWidget {
  final VoidCallback onClose;

  ListOfItemsDialog({super.key, required this.onClose});

  @override
  _ListOfItemsDialogState createState() => _ListOfItemsDialogState();
}

class _ListOfItemsDialogState extends State<ListOfItemsDialog> {
  List<CategoryItem> categoryItems = [
    const CategoryItem(title: "Pizzas", imagePath: "assets/029-burger.png"),
    const CategoryItem(title: "Burger", imagePath: "assets/013-sandwich.png"),
    const CategoryItem(title: "Sandwich", imagePath: "assets/010-breakfast.png"),
    const CategoryItem(title: "Desayuno", imagePath: "assets/007-pizza.png"),
    const CategoryItem(title: "Pizzas", imagePath: "assets/029-burger.png"),
    const CategoryItem(title: "Burger", imagePath: "assets/013-sandwich.png"),
  ];

  List<CategoryItem> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 81.0.h),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.transparent,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    Row(
                      children: [
                       IconButton(onPressed: (){
                         Navigator.of(context).pop();
                       }, icon:
                       const Icon(Icons.arrow_back_ios)),
                        horizontalSpacing(20.w),
                        Text(
                          'Drinks 🍹',
                          style: TextStyles.font30DarkMedium,
                        ),
                      ],
                    ),
                    verticalSpacing(20.h),
                    Text(
                      'Maybe you would like to search🥺',
                      style: TextStyles.font15DarkBlueMedium,
                    ),
                    verticalSpacing(20.h),

                    // Categories ListView
                    CustomListFromLocal(categoryItems: categoryItems),
                    verticalSpacing(30.h),

                    // Products ListView
                    const CustomListOfDataFromNetWoek(),

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

