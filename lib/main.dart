import 'package:aware_cryptocurrency/dependency_injection.dart';
import 'package:aware_cryptocurrency/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  Injector.configure(Flavor.PROD);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blue,
      primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[100] : null),
      home: new HomePage(),
    );
  }
}

