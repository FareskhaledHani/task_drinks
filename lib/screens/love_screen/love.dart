import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_test/core/theming/colors.dart';

import '../items_screen/controller/favorit_controller/fav_bloc.dart';
import '../items_screen/domain/entity/product_entity.dart';
import '../items_screen/widgets/product_item.dart';



class LoveScreen extends StatelessWidget {
  const LoveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.orange,
        centerTitle: true,
        title: const Text("Favorites"),
      ),
      body: BlocBuilder<FavoriteCubit, List<ProductEntity>>(
        builder: (context, favorites) {
          if (favorites.isEmpty) {
            return const Center(
              child: Text(
                "No favorite items yet!",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return ProductItem(productEntity: favorites[index]);
            },
          );
        },
      ),
    );
  }
}
