import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:llorona_app/components/my_searchbar_widget.dart';
import 'package:llorona_app/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBarWidget extends StatefulWidget {
  @override
  _MyAppBarWidgetState createState() => _MyAppBarWidgetState();
}

class _MyAppBarWidgetState extends State<MyAppBarWidget> {
  final TextEditingController _controller = TextEditingController();
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Container(
          height: size.height * .225,
          child: Column(
            children: <Widget>[
              Container(
                height: size.height * .1,
                child: Padding(
                  padding: EdgeInsets.all(
                    size.width * .025,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                          width: size.width * .08,
                          color: Colors.transparent,
                        ),
                        onPressed: () {},
                      ),
                      Image(
                        image: AssetImage(
                          'assets/images/logo.png',
                        ),
                        width: size.width * .18,
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                          width: size.width * .07,
                          height: size.width * .07,
                          color: white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isSearching = !_isSearching;
                            _controller.clear();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              AnimatedOpacity(
                opacity: _isSearching ? 1.0 : 0.0,
                duration: Duration(milliseconds: 250),
                child: Material(
                  color: Colors.transparent,
                  child: MySearchbarWidget(
                    controller: _controller,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
