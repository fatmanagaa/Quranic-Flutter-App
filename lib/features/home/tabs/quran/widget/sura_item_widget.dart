import 'package:flutter/material.dart';
import 'package:islami_app/core/app_assets.dart';
import 'package:islami_app/model/quran_resources.dart';

import '../../../../../core/app_styles.dart';


class SuraItemWidget extends StatelessWidget {
  final int index; //ask

  const SuraItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      spacing: width * 0.03,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.vector),
            Text('${index + 1}', style: AppStyles.bold16White),  //ask
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResources.englishQuranSuraList[index],
              style: AppStyles.bold20White,
            ),
            Text(
              '${QuranResources.AyaNumberList[index]} Verses',
              style: AppStyles.bold14White,
            ),
          ],
        ),
        Spacer(),
        Text(
          QuranResources.arabicQuranSuraList[index],
          style: AppStyles.bold20White,
        ),
      ],
    );
  }
}
