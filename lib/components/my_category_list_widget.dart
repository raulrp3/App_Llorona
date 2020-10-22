import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:llorona_app/blocs/category_bloc.dart';
import 'package:llorona_app/blocs/product_bloc.dart';
import 'package:llorona_app/providers/category_provider.dart';
import 'package:llorona_app/utils/colors.dart';
import 'package:provider/provider.dart';

class MyCategoryListWidget extends StatefulWidget {
  @override
  _MyCategoryListWidgetState createState() => _MyCategoryListWidgetState();
}

class _MyCategoryListWidgetState extends State<MyCategoryListWidget> {
  int _selectedIndex;
  CategoryProvider _provider;

  @override
  void initState() { 
    super.initState();
    _provider = Provider.of<CategoryProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .075,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryBloc.categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: size.width * .04,
            ),
            decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? yellow.withOpacity(0.95)
                  : Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  size.width * .05,
                ),
              ),
              border: Border.all(
                width: size.width * .001,
                color: _selectedIndex == index
                    ? Colors.transparent
                    : black.withOpacity(0.7),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                size.width * .03,
              ),
              child: Center(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text(
                    categoryBloc.categories[index].name,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: _selectedIndex == index
                          ? 'Montserrat-SemiBold'
                          : 'Montserrat-Regular',
                      color: _selectedIndex == index ? white : black,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = index;
                      productBloc.fetchProducts(int.parse(categoryBloc.categories[index].id));
                      _provider.category = categoryBloc.categories[index];
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
