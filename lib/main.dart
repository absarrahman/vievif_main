import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/provider/cart_provider.dart';
import 'package:vievif/provider/payment_provider.dart';
import 'package:vievif/provider/products_provider.dart';
import 'package:vievif/provider/user_provider.dart';
import 'package:vievif/provider/wishlist_provider.dart';
import 'package:vievif/screens/splash_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => WishListProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PaymentProvider(),
        ),
      ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
