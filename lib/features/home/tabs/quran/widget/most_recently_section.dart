import 'package:flutter/material.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/app_routes.dart';
import 'package:islami_app/core/app_styles.dart';
import 'package:islami_app/core/cache_helper.dart';
import 'package:islami_app/provider/most_recently_provider.dart';
import 'package:provider/provider.dart';

class MostRecentlySection extends StatelessWidget {
  const MostRecentlySection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Consumer<MostRecentlyProvider>(
      builder: (context, provider, child) {
        final displayMostRecent = provider.recentSurahs;

        if (displayMostRecent.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Most Recently', style: AppStyles.bold16White),
            SizedBox(
              height: height * 0.16,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final recentSurah = displayMostRecent[index];

                  return InkWell(
                    onTap: () async {
                      // Save again to move to top of list
                      await CacheHelper.saveRecentSurah(recentSurah.surahIndex);
                      if (context.mounted) {
                        await context
                            .read<MostRecentlyProvider>()
                            .loadRecentSurahs();
                        Navigator.of(context).pushNamed(
                          AppRoutes.suraDetailsRouteName,
                          arguments: recentSurah.surahIndex,
                        );
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.02),
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
                                recentSurah.englishName,
                                style: AppStyles.bold24Black,
                              ),
                              Text(
                                recentSurah.arabicName,
                                style: AppStyles.bold24Black,
                              ),
                              Text(
                                '${recentSurah.versesCount} Verses',
                                style: AppStyles.bold14Black,
                              ),
                            ],
                          ),
                          Image.asset(recentSurah.imagePath),
                        ],
                      ),
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
        );
      },
    );
  }
}

