import 'package:flutter/material.dart';


import '../../../components/title_text.dart';
import '../../../models/Categories.dart';
import '../../../models/Product.dart';
import '../../../services/fetchCategories.dart';
import '../../../services/fetchProducts.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'recommond_products.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    // It enables scrolling
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultSize !* 2), //20
              child: Text(
                "Browse by Categories",
              ),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) {
                return snapshot.hasData && snapshot is List<Category>
                   ? Categories(categories: snapshot.data as List<Category>)
                  : Center(child: Image.asset("assets/ripple.gif")
                  );
              }
        
            ),
            Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: Text( "Recommands For You"),
            ),
            FutureBuilder(
              future: fetchProducts(),
                  builder: (context, snapshot) {
                return snapshot.hasData && snapshot is List<Product>
                   ? RecommandProducts(products: snapshot.data as List<Product>)
                  : Center(child: Image.asset("assets/ripple.gif")
                  );
              }
            ),
          ],
        ),
      ),
    );
  }
}
