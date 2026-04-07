import 'dart:core';

import 'package:flutter/material.dart';
import 'package:islami_app/core/app_assets.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/app_routes.dart';
import 'package:islami_app/core/app_styles.dart';
import 'package:islami_app/core/cache_helper.dart';
import 'package:islami_app/features/home/tabs/quran/widget/sura_item_widget.dart';

import '../../../../model/quran_resources.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    List<int>? displayMostRecent = CacheHelper.getStringList('items');
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: height * 0.02),
          TextField(
            style: AppStyles.bold16White,
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16White,

              enabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),

              prefixIcon: Image.asset(AppAssets.quranSearch),
            ),
          ),
          Text('Most Recently ', style: AppStyles.bold16White),
          if (displayMostRecent!.isNotEmpty) ...[
            SizedBox(
              height: height * 0.16,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      spacing: width * 0.04,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              QuranResources.englishQuranSuraList[index],
                              style: AppStyles.bold24Black,
                            ),
                            Text(
                              QuranResources.arabicQuranSuraList[index],
                              style: AppStyles.bold24Black,
                            ),
                            Text(
                              '${QuranResources.AyaNumberList[index]} Verses',
                              style: AppStyles.bold14Black,
                            ),
                          ],
                        ),
                        Image.asset(AppAssets.mostRecently),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: width * 0.04);
                },
                itemCount: displayMostRecent.length,
              ),
            ),
          ],

          Text('suras List', style: AppStyles.bold16White),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    await CacheHelper.saveList(index);
                    setState(() {});

                    Navigator.of(context).pushNamed(
                      AppRoutes.suraDetailsRouteName,
                      arguments: index,
                    );
                  },
                  child: SuraItemWidget(index: index),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Divider(color: AppColors.white, thickness: 2),
                );
              },
              itemCount: 114,
            ),
          ),
        ],
      ),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColors.primary, width: 2),
  );
}
