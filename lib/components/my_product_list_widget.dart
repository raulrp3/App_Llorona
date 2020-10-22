import 'package:flutter/material.dart';
import 'package:llorona_app/blocs/product_bloc.dart';
import 'package:llorona_app/components/my_product_detail_widget.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:llorona_app/models/product/product.dart';
import 'package:llorona_app/utils/colors.dart';

class MyProductListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .6,
      child: StreamBuilder<List<Product>>(
        stream: productBloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Product> _products = snapshot.data;
            return ListView.builder(
              itemCount: productBloc.products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    height: size.height * .2,
                    margin: EdgeInsets.all(
                      size.width * .025,
                    ),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          size.width * .025,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: black.withOpacity(0.25),
                          offset: Offset(1, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: size.width * .4,
                          height: size.height * .2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                size.width * .025,
                              ),
                              topLeft: Radius.circular(
                                size.width * .025,
                              ),
                            ),
                            child: Stack(
                              children: <Widget>[
                                FadeInImage(
                                  height: size.height * .2,
                                  width: size.width * .4,
                                  image: _products[index].image == null
                                      ? AssetImage(
                                          'assets/images/logo.png',
                                        )
                                      : NetworkImage(
                                          _products[index].image,
                                        ),
                                  placeholder: AssetImage(
                                    'assets/images/logo.png',
                                  ),
                                  fit: _products[index].image == null
                                      ? BoxFit.scaleDown
                                      : BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Flexible(
                          child: Container(
                            width: size.width * .4,
                            margin: EdgeInsets.symmetric(
                              vertical: size.width * .05,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _products[index].name,
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 15,
                                    fontFamily: 'Montserrat-Medium',
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: size.width * .05,
                            right: size.width * .05,
                            top: size.height * .1,
                          ),
                          child: Text(
                            "${_products[index].price} €",
                            style: TextStyle(
                              color: black,
                              fontSize: 13,
                              fontFamily: 'Montserrat-Medium',
                              decoration: TextDecoration.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () => slideDialog.showSlideDialog(
                    context: context,
                    backgroundColor: white,
                    pillColor: Colors.transparent,
                    child: MyProductDetailWidget(
                      product: productBloc.products[index],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                '¡DEBES SELECCIONAR UNA CATEGORÍA!',
                style: TextStyle(
                  fontFamily: 'Montserrat-Medium',
                  fontSize: 16,
                  color: black,
                  decoration: TextDecoration.none,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
