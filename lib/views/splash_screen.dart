import 'package:flutter/material.dart';
import 'dart:async'; // Import this for the Timer

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    Timer(const Duration(seconds: 2), () {
      
      Navigator.pushReplacementNamed(context, '/product_listing');
    });

    return Scaffold(
      body: Center(
        child: Image.network("https://s3-ap-southeast-1.amazonaws.com/tv-prod/member/photo/6832237-medium190ap.jpg")
      ),
    );
  }
}
