import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/app_assets.dart';
import 'package:islami_app/core/app_colors.dart' as app_colors;
import 'package:islami_app/core/app_routes.dart';
import 'package:islami_app/core/app_styles.dart';
import 'package:islami_app/features/home/tabs/hadeth/widgets/hadeth_item.dart';
import 'package:islami_app/model/hadeth.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  static const int _hadethFilesCount = 50;
  late Future<List<Hadeth>> _hadethFuture;

  @override
  void initState() {
    super.initState();
    _hadethFuture = _loadHadeths();
  }

  void _retryLoading() {
    setState(() {
      _hadethFuture = _loadHadeths();
    });
  }

  Future<List<Hadeth>> _loadHadeths() async {
    final hadethList = <Hadeth>[];
    for (int i = 1; i <= _hadethFilesCount; i++) {
      final path = 'assets/files/Hadeeth/Hadeeth/h$i.txt';
      try {
        final fileContent = await rootBundle.loadString(path);
        hadethList.add(_parseHadeth(fileContent));
      } catch (e) {
        debugPrint('Error loading hadith $i: $e');
      }
    }

    if (hadethList.isEmpty) {
      throw Exception('No hadith files could be loaded from assets.');
    }

    return hadethList;
  }

  Hadeth _parseHadeth(String fileContent) {
    final normalizedContent = fileContent.replaceFirst('\ufeff', '').trim();
    final lines = normalizedContent.split('\n').map((l) => l.trim()).toList();

    if (lines.isEmpty) {
      throw Exception('Invalid hadith file format.');
    }

    final title = lines[0];
    final content = lines.skip(1).join('\n').trim();
    return Hadeth(title: title, content: content);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<List<Hadeth>>(
            future: _hadethFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: app_colors.AppColors.primary),
                );
              }

              if (snapshot.hasError) {
                return _HadethErrorState(onRetry: _retryLoading);
              }

              final hadethList = snapshot.data ?? [];

              return CarouselSlider.builder(

                itemCount: hadethList.length,
                itemBuilder: (context, index, realIndex) {
                  final hadeth = hadethList[index];

                  return HadethItem(
                    title: hadeth.title,
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.hadethDetailsRouteName,
                        arguments: {
                          'hadeth': hadeth,
                          'index': index + 1,
                        },
                      );
                    },
                    content: hadeth.content,
                  );
                },
                options: CarouselOptions(


                  height: 618.h,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  enableInfiniteScroll: true,
                ),
              );
            },
          ),
        ),

      ],
    );
  }
}

class _HadethErrorState extends StatelessWidget {
  final VoidCallback onRetry;

  const _HadethErrorState({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Failed to load hadiths.',
            style: AppStyles.bold16White,
          ),
          TextButton(
            onPressed: onRetry,
            child: Text('Retry', style: AppStyles.bold16White.copyWith(color: app_colors.AppColors.primary)),
          ),
        ],
      ),
    );
  }
}
