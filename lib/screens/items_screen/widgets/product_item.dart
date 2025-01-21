import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_test/core/theming/colors.dart';
import 'package:new_test/core/theming/styles.dart';
import '../controller/favorit_controller/fav_bloc.dart';
import '../domain/entity/product_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: ColorsManager.white,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // أيقونة المفضلة
            BlocBuilder<FavoriteCubit, List<ProductEntity>>(
              builder: (context, favorites) {
                final isFavorite = favorites.contains(productEntity);
                return Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      context.read<FavoriteCubit>().toggleFavorite(productEntity);
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),

            // صورة المنتج
            Center(
              child: Image.network(
                productEntity.photo,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image, size: 80, color: Colors.grey);
                },
              ),
            ),
            // اسم المنتج
            SizedBox(
              width: 100,
              child: Text(
                productEntity.name,
                style: TextStyles.font12DarkBlueRegular,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // وصف المنتج
            SizedBox(
              width: 200,
              child: Text(
                productEntity.desc,
                style: TextStyles.font9GreyRegular,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // السعر
            Text(
              "${productEntity.priceEntity.toStringAsFixed(2)} \u0024",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff153E73),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
