import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:llorona_app/blocs/category_bloc.dart';
import 'package:llorona_app/components/my_app_widget.dart';
import 'package:llorona_app/services/init.dart';

void main() {
  runApp(MyAppWidget());

  initServices();

  categoryBloc.fetchCategories();
}
