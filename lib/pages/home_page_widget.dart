import 'package:flutter/material.dart';
import 'package:llorona_app/components/bezier_container.dart';
import 'package:llorona_app/components/my_appbar_widget.dart';
import 'package:llorona_app/components/my_category_list_widget.dart';
import 'package:llorona_app/components/my_product_list_widget.dart';
import 'package:llorona_app/utils/colors.dart';
import 'dart:math';

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        color: white,
        height: size.height,
        width: size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: size.height * .55,
              left: size.width * .35,
              child: BezierContainer(
                angle: -pi / 3.5,
                color: purple,
              ),
            ),
            Positioned(
              top: size.height * .6,
              right: size.width * .25,
              child: BezierContainer(
                angle: 90,
                color: yellow,
              ),
            ),
            Container(
              width: size.width,
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  MyAppBarWidget(),
                  SizedBox(
                    height: size.height * .025,
                  ),
                  MyCategoryListWidget(),
                  SizedBox(
                    height: size.height * .035,
                  ),
                  MyProductListWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
