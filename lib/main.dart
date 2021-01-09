import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/provider/products_provider.dart';
import 'package:vievif/screens/product_page.dart';

import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        )
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
