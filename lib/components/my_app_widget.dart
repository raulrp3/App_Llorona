import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:llorona_app/pages/home_page_widget.dart';
import 'package:llorona_app/providers/category_provider.dart';
import 'package:llorona_app/utils/colors.dart';
import 'package:provider/provider.dart';

class MyAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryProvider(),
      child: MaterialApp(
        title: 'LA LLORONA RESTAURANTE',
        home: CustomSplash(
          imagePath: 'assets/images/logo_with_title.png',
          home: HomePageWidget(),
          animationEffect: 'zoom-in',
          duration: 2000,
          type: CustomSplashType.StaticDuration,
          backGroundColor: purple,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
