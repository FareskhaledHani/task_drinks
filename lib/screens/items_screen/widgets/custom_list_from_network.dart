
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_test/screens/items_screen/widgets/product_item.dart';

import '../controller/favorit_controller/fav_bloc.dart';
import '../controller/product_bloc.dart';

class CustomListOfDataFromNetWoek extends StatelessWidget {
  const CustomListOfDataFromNetWoek({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductSuccess) {
            return GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return BlocProvider(
                  create: (_) => FavoriteCubit(),
                  child: ProductItem(
                    productEntity: state.products[index],
                  ),
                );
              },
            );
          } else if (state is ProductFailure) {
            return Center(
              child: Text(
                state.errMassage,
                style: const TextStyle(
                    color: Colors.red, fontSize: 16),
              ),
            );
          } else {
            return const Center(
              child: Text(
                'No Data Available!',
                style: TextStyle(fontSize: 16),
              ),
            );
          }
        },
      ),
    );
  }
}

