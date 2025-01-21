import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_test/core/theming/colors.dart';
import 'package:new_test/core/theming/styles.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsManager.mainBlue,
        title: Text('Location Screen'),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('SOOOOOOOOOOON',style:TextStyles.font18DarkBlueSemiBold,),)
        ],
      ),
    );
  }
}
