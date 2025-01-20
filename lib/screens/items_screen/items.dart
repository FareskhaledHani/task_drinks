import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_test/screens/items_screen/widgets/category_item.dart';
import 'package:new_test/screens/items_screen/widgets/product_item.dart';

import '../../core/helper/spacing.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import '../dialog_screen_bottom_tems/ui/custom_items_and_container_title.dart';
import '../bottom_navigation_bar.dart';
import 'controller/product_bloc.dart';

class ListOfItemsDialog extends StatelessWidget {
  final VoidCallback onClose;

  const ListOfItemsDialog({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 81.0.h),
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
            color: Colors.transparent, // خلفية شفافة
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white, // لون مع شفافية
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        const Icon(Icons.arrow_back_ios),
                        horizontalSpacing(50.w),
                        Text('Drinks 🍹',style: TextStyles.font30DarkMedium,),
                      ],),
                  verticalSpacing(20.h),
                  Text('Maybe you would like to search🥺',style: TextStyles.font15DarkBlueMedium,),
                  verticalSpacing(20.h),

                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const CategoryItem();
                          },
                        ),
                      ),
                      verticalSpacing(30.h),
                      Expanded(
                        child: BlocBuilder<ProductBloc, ProductState>(
                          builder: (context, state) {
                            if (state is ProductLoading) {
                              print(state);
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is ProductSuccess) {
                              print(state);
                              return ListView.builder(
                                itemCount: state.products.length,
                                itemBuilder: (context, index) {
                                  print(state);
                                  return ProductItem(
                                    productEntity: state.products[index],
                                  );
                                },
                              );
                            } else if (state is ProductFailure) {
                              print(state);
                              return Center(

                                child: Text(
                                  state.errMassage,
                                  style: const TextStyle(color: Colors.red, fontSize: 16),
                                ),
                              );
                            } else {
                              print(state);
                              return const Center(
                                child: Text(
                                  'No Data Available!',
                                  style: TextStyle(fontSize: 16),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }
}