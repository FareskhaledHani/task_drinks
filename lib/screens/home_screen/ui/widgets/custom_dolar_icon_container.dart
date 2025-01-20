import 'package:flutter/cupertino.dart';

class CustomDolarIconContainer extends StatelessWidget {
  const CustomDolarIconContainer({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/dolarIcon.png'),
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
