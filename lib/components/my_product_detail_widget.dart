import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:llorona_app/models/product/product.dart';
import 'package:llorona_app/utils/colors.dart';
import 'package:flutter_html/flutter_html.dart';

class MyProductDetailWidget extends StatelessWidget {
  final Product product;

  MyProductDetailWidget({@required this.product}) : assert(product != null);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * .9,
      height: size.height * .55,
      margin: EdgeInsetsDirectional.only(
        top: size.height * .035,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: size.width * .9,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        width: size.width * .9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              this.product.name,
                              style: TextStyle(
                                color: black,
                                fontSize: 18,
                                fontFamily: 'Montserrat-SemiBold',
                                decoration: TextDecoration.none,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .015,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: size.width * .25,
                  height: size.height * .05,
                  decoration: BoxDecoration(
                    color: purple,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        size.width * .025,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      size.height * .001,
                    ),
                    child: Center(
                      child: Text(
                        '${this.product.price} €',
                        style: TextStyle(
                          color: white,
                          fontSize: 18,
                          fontFamily: 'Montserrat-Medium',
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .025,
              ),
              Container(
                width: size.width * .9,
                height: size.height * .3,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      size.width * .025,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      FadeInImage(
                        width: size.width * .9,
                        height: size.height * .3,
                        placeholder: AssetImage(
                          'assets/images/logo.png',
                        ),
                        image: NetworkImage(
                          this.product.image,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .015,
              ),
              Html(
                data: """${this.product.content}""",
                style: {
                  "strong": Style(
                    display: Display.BLOCK,
                    margin: EdgeInsets.symmetric(
                      vertical: size.height * .025,
                    ),
                  ),
                  "*": Style(
                    fontSize: FontSize(
                      15,
                    ),
                    fontFamily: "Montserrat-Regular",
                  ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
