import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'items_screen/controller/product_bloc.dart';
import 'items_screen/widgets/category_item.dart';
import 'items_screen/widgets/product_item.dart';

class DrinksScreen extends StatelessWidget {
  const DrinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // إرسال الحدث لجلب البيانات

    context.read<ProductBloc>().add(GetProductsEvent());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/flair.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 8),
            const Text(
              'Drinks',
              style: TextStyle(color: Color(0xff022136)),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Text('Maybe you would like to search🥺'),
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
          const SizedBox(height: 16),
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
      ),
    );
  }
}

