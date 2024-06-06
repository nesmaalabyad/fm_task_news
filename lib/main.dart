import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'ui/pages/home_page.dart';
import 'locator.dart';
import 'bloc/news_bloc.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Optionally set default text theme
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
      ),
      home: BlocProvider(
        create: (context) => getIt<NewsBloc>()..add(FetchNews()),
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
