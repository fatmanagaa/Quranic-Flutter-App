import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:islami_app/model/recent_surah.dart';

class CacheHelper {
  static const String _recentSurahsKey = 'recent_surahs';
  static const int _maxRecentSurahs = 10;
  static late SharedPreferencesWithCache prefs;

  static Future<void> init() async {
    prefs = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );
  }

  static Future<void> setBool(bool flag) async {
    return await prefs.setBool('introduction screen', flag);
  }

  static bool? getBool(String key) {
    return prefs.getBool(key);
  }

  static Future<void> saveRecentSurah(int surahIndex) async {
    final recentSurahs = getRecentSurahs();
    final newSurah = RecentSurah.fromIndex(surahIndex);

    recentSurahs.removeWhere((surah) => surah.surahIndex == surahIndex);
    recentSurahs.insert(0, newSurah);

    if (recentSurahs.length > _maxRecentSurahs) {
      recentSurahs.removeRange(_maxRecentSurahs, recentSurahs.length);
    }

    final data = recentSurahs.map((surah) => jsonEncode(surah.toJson())).toList();
    await prefs.setStringList(_recentSurahsKey, data);
  }

  static List<RecentSurah> getRecentSurahs() {
    final data = prefs.getStringList(_recentSurahsKey) ?? [];

    return data
        .map((item) {
          try {
            final json = jsonDecode(item);
            if (json is Map<String, dynamic>) {
              return RecentSurah.fromJson(json);
            }
          } catch (_) {
          }
          return null;
        })
        .whereType<RecentSurah>()
        .toList();
  }
}
