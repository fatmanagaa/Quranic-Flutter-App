import 'package:islami_app/core/app_assets.dart';
import 'package:islami_app/model/quran_resources.dart';

class RecentSurah {
  final int surahIndex;
  final String englishName;
  final String arabicName;
  final String versesCount;
  final String imagePath;

  const RecentSurah({
    required this.surahIndex,
    required this.englishName,
    required this.arabicName,
    required this.versesCount,
    required this.imagePath,
  });

  factory RecentSurah.fromIndex(int surahIndex) {
    return RecentSurah(
      surahIndex: surahIndex,
      englishName: QuranResources.englishQuranSuraList[surahIndex],
      arabicName: QuranResources.arabicQuranSuraList[surahIndex],
      versesCount: QuranResources.AyaNumberList[surahIndex],
      imagePath: AppAssets.mostRecently,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'surahIndex': surahIndex,
      'englishName': englishName,
      'arabicName': arabicName,
      'versesCount': versesCount,
      'imagePath': imagePath,
    };
  }

  factory RecentSurah.fromJson(Map<String, dynamic> json) {
    return RecentSurah(
      surahIndex: json['surahIndex'] as int,
      englishName: json['englishName'] as String,
      arabicName: json['arabicName'] as String,
      versesCount: json['versesCount'] as String,
      imagePath: json['imagePath'] as String,
    );
  }
}


