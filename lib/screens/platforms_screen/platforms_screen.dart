import 'package:faisal_alanazi_proj2/constants/app_colors.dart';
import 'package:faisal_alanazi_proj2/constants/app_fonts.dart';
import 'package:faisal_alanazi_proj2/screens/platforms_screen/widgets/platform_card.dart';
import 'package:flutter/material.dart';

import '../../constants/game_filters.dart';


class PlatformsScreen extends StatelessWidget {
  const PlatformsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text('Platforms', style: AppFonts.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pick where you play', style: AppFonts.subtitle),
              const SizedBox(height: 16),
              Center(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: gamePlatforms.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.4,
                  ),
                  itemBuilder: (context, index) {
                    final platform = gamePlatforms[index];
                    final label = platform['label']!;
                    final apiValue = platform['apiValue']!;
                    final icon = apiValue == 'pc'
                        ? Icons.desktop_windows_rounded
                        : Icons.public;

                    return PlatformCard(apiValue: apiValue, label: label, icon: icon);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


