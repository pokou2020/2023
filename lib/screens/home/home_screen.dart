import 'package:flutter/material.dart';
import 'package:projet2023/constants.dart';


import 'package:projet2023/screens/details/components/body.dart';

import '../../services/fetchCategories.dart';
import '../../services/fetchProducts.dart';
import '../../size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     double? defaultSize = SizeConfig.defaultSize;
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body:SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultSize! * 2), 
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
              padding: EdgeInsets.all(defaultSize * 2), 
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
    ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu,
         
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.scanner,
          
          ),
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
