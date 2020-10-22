import 'package:flutter/material.dart';
import 'package:llorona_app/blocs/product_bloc.dart';
import 'package:llorona_app/providers/category_provider.dart';
import 'package:llorona_app/utils/colors.dart';
import 'package:provider/provider.dart';

class MySearchbarWidget extends StatefulWidget {
  final TextEditingController controller;

  MySearchbarWidget({@required this.controller}) : assert(controller != null);

  @override
  _MySearchbarWidgetState createState() => _MySearchbarWidgetState();
}

class _MySearchbarWidgetState extends State<MySearchbarWidget> {
  CategoryProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<CategoryProvider>(context, listen: false);
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .08,
      width: size.width * .8,
      color: Colors.transparent,
      child: Center(
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  size.width * .08,
                ),
              ),
              borderSide: BorderSide(
                width: size.width * .005,
                color: purple,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: size.width * .1,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
              ),
              color: yellow,
              onPressed: () {
                widget.controller.clear();
                productBloc.fetchProducts(int.parse(_provider.category.id));
              },
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  size.width * .08,
                ),
              ),
              borderSide: BorderSide(
                width: size.width * .005,
                color: yellow.withOpacity(0.95),
              ),
            ),
          ),
          style: TextStyle(
            color: black,
          ),
          onChanged: (value) async {
            await productBloc.fetchProducts(int.parse(_provider.category.id));
            if (value.isNotEmpty) {
              productBloc.filterProducts(value.trim().toLowerCase());
            }
          },
        ),
      ),
    );
  }
}
