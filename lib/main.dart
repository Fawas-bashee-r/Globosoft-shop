import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/product_controller.dart';
import 'views/splash_screen.dart';
import 'views/product_listing.dart';
import 'views/product_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Globosoft Shop',
        theme: ThemeData(primarySwatch: Colors.red),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/product_listing': (context) => const ProductListing(),
          '/product_detail': (context) => ProductDetail(),
        },
      ),
    );
  }
}
