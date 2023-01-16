import 'package:flutter/material.dart';
import 'package:projet2023/constants.dart';
import '../../models/Product.dart';
import '../../services/fetchCategories.dart';
import '../../services/fetchProducts.dart';
import '../../size_config.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({required Key key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(context),
      body:SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultSize! * 2), //20
              child: Text(
                "Browse by Categories",
              ),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Container()
                  : Center(child: Image.asset("assets/ripple.gif")),
            ),
            Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: Text( "Recommands For You"),
            ),
      
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container();
                } else {
                  return Center(child: Image.asset('assets/ripple.gif'));
                }
              },
            ),
          ],
        ),
      ),
    )
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
