import 'package:faisal_alanazi_proj2/constants/app_colors.dart';
import 'package:faisal_alanazi_proj2/constants/app_fonts.dart';
import 'package:faisal_alanazi_proj2/screens/splash_screen/widgets/image_widget.dart';
import 'package:flutter/material.dart';

import '../root_screen/root_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  void excuteNaigation() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => RootScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSplash,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: SplashImage(),
          ),

          Container(
            color: Colors.black.withValues(alpha: 0.35),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('PlayZone', style: AppFonts.title),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () => excuteNaigation(),
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        color: AppColors.accent,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


