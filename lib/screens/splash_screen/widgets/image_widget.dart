import 'package:flutter/material.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
    
      color: Colors.black,
    
      child: Image.asset(
        'assets/images/splashImage.png',
        fit: BoxFit.contain,
      ),
    );
  }
}