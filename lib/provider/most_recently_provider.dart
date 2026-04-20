import 'package:flutter/material.dart';
import 'package:islami_app/core/cache_helper.dart';
import 'package:islami_app/model/recent_surah.dart';

class MostRecentlyProvider extends ChangeNotifier {
  List<RecentSurah> _recentSurahs = [];

  List<RecentSurah> get recentSurahs => _recentSurahs;

  /// Initialize by loading recent surahs from cache
  Future<void> loadRecentSurahs() async {
    _recentSurahs = CacheHelper.getRecentSurahs();
    notifyListeners();
  }

  /// Add a new surah to the recent list
  /// - Removes duplicate if surah was opened before
  /// - Adds it to the top (newest)
  /// - Limits to max 10 items
  /// - Saves to cache
  Future<void> addRecentSurah(int surahIndex) async {
    await CacheHelper.saveRecentSurah(surahIndex);
    await loadRecentSurahs();
  }

  /// Clear all recent surahs
  Future<void> clearRecentSurahs() async {
    _recentSurahs = [];
    notifyListeners();
  }
}