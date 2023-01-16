import 'package:flutter/material.dart';
import 'package:projet2023/constants.dart';
import '../../models/Product.dart';
import '../../size_config.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
// Thats means we have to  pass it
  const DetailsScreen({required Key key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(context),
     // body: Body(product: product,),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_sharp),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon:Icon(Icons.badge),
          onPressed: () {},
        ),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}
