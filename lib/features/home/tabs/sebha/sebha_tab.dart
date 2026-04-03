import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_app/core/app_assets.dart';
import 'package:islami_app/core/app_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
              style: AppStyles.bold36White,
            ),
          ),
        ),
        Center(
          child: Image.asset(AppAssets.sebha_head, width: 145, height: 86),
        ),
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: angle,
                child: Image.asset(
                  AppAssets.sebha_body,
                  width: 300,
                  height: 320,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    counter++;
                    angle += 15 * pi / 180;
                  });
                },
                child: Column(
                  children: [
                    Text('سبحان الله', style: AppStyles.bold36White),
                    SizedBox(height: 12),
                    Text(counter.toString(), style: AppStyles.bold36White),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
