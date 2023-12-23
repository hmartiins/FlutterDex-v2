import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PoLoading extends StatelessWidget {
  const PoLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        'assets/splash.json',
        height: MediaQuery.of(context).size.height * 1,
        animate: true,
      ),
    );
  }
}
