import 'package:flutter/material.dart';
import 'package:islami_app/core/app_assets.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/app_styles.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:flutter/services.dart';


class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      backgroundColor: AppColors.blackBg,
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranSuraList[index],
          style: AppStyles.bold20Primary,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppAssets.cornerLeft),
                    Text(
                      QuranResources.arabicQuranSuraList[index],
                      style: AppStyles.bold24Primary,
                    ),
                    Image.asset(AppAssets.cornerRight),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: verses.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(
                        verses[index],
                        style: AppStyles.bold20Primary,
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
              Image.asset(AppAssets.mosque),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/suras/${index + 1}.txt',
    );
    List<String> lines = fileContent.split("\n");
    verses = lines;

    setState(() {});
  }
}
