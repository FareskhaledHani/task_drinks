
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class CustomFlagWithNumberContainer extends StatelessWidget {
  const CustomFlagWithNumberContainer({
    super.key, required this.image, required this.nameFlag,
  });
  final String image;
  final String nameFlag;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(image),
      Text(nameFlag,style: TextStyles.font9GreyRegular,)
    ],);
  }
}