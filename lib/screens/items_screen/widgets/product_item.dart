import 'package:flutter/material.dart';

import '../domain/entity/product_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
        ),
        Image.network(productEntity.photo),
         Text(
          productEntity.name,
          style: const TextStyle(color: Color(0xff515F65)),
        ),
         Text(
          productEntity.desc,
          style: const TextStyle(color: Color(0xff515F65)),
        ),
         Text(
          "${productEntity.priceEntity} \u0024",
          style: const TextStyle(color: Color(0xff153E73)),
        )
      ],
    );
  }
}
