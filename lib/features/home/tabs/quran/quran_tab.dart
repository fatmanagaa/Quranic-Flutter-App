import 'dart:core';

import 'package:flutter/material.dart';
import 'package:islami_app/core/app_assets.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/app_routes.dart';
import 'package:islami_app/core/app_styles.dart';
import 'package:islami_app/core/cache_helper.dart';
import 'package:islami_app/features/home/tabs/quran/widget/most_recently_section.dart';
import 'package:islami_app/features/home/tabs/quran/widget/sura_item_widget.dart';
import 'package:islami_app/provider/most_recently_provider.dart';
import 'package:provider/provider.dart';

import '../../../../model/quran_resources.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  late final List<int> filterList = List.generate(114, (index) => index);
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    // Load recent surahs when the tab initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MostRecentlyProvider>().loadRecentSurahs();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<int> getFilteredList(String searchQuery) {
    if (searchQuery.isEmpty) {
      return List.generate(114, (index) => index);
    }
    
    return List.generate(114, (index) => index).where((index) {
      final englishName = QuranResources.englishQuranSuraList[index].toLowerCase();
      final arabicName = QuranResources.arabicQuranSuraList[index];
      final query = searchQuery.toLowerCase();
      
      return englishName.contains(query) || arabicName.contains(searchQuery);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = getFilteredList(searchController.text);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.02),
          TextField(
            controller: searchController,
            style: AppStyles.bold16White,
            cursorColor: AppColors.primary,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16White,
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              prefixIcon: Image.asset(AppAssets.quranSearch),
            ),
          ),
          // Most Recently section using Provider
          const MostRecentlySection(),
          Text('suras List', style: AppStyles.bold16White),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    // Save recent surah and update provider
                    await context
                        .read<MostRecentlyProvider>()
                        .addRecentSurah(filteredList[index]);

                    if (mounted) {
                      Navigator.of(context).pushNamed(
                        AppRoutes.suraDetailsRouteName,
                        arguments: filteredList[index],
                      );
                    }
                  },
                  child: SuraItemWidget(index: filteredList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Divider(color: AppColors.white, thickness: 2),
                );
              },
              itemCount: filteredList.length,
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
