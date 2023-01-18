import 'package:flutter/material.dart';

import 'package:projet2023/constants.dart';
import 'package:projet2023/models/Product.dart';
import 'package:projet2023/screens/home/components/body.dart';

import '../../size_config.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black,),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.scanner, color: Colors.black,),
          onPressed: () {},
        ),
        Center(
          child: Text(
            "Scan",
            style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}
