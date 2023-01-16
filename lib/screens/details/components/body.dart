import 'package:flutter/material.dart';


import '../../../services/fetchCategories.dart';
import '../../../services/fetchProducts.dart';
import '../../../size_config.dart';
import '../../home/components/categories.dart';
import '../../home/components/recommond_products.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;

    return SingleChildScrollView(
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
    );
  }
}
