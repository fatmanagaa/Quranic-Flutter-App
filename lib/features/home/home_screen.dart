import 'package:flutter/material.dart';
import 'package:islami_app/core/app_assets.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/app_styles.dart';
import 'package:islami_app/features/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/features/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/features/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/features/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/features/home/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabsList = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];

  //todo:for listing the background images
  //   Map<int,String>imageList{
  //     0:AppAssets.quranBg,
  //   1:AppAss,
  //   0:AppAssets.quranBg,
  //   0:AppAssets.quranBg,
  //   0:AppAssets.quranBg,
  // };

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    String getBackgroundImage() {
      switch (selectedIndex) {
        case 0:
          return AppAssets.quranBg;
        case 1:
          return AppAssets.hadethBg;
        case 2:
          return AppAssets.sebhaBg;
        case 3:
          return AppAssets.radioBg;
        case 4:
          return AppAssets.timeBg;
        default:
          return AppAssets.quranBg;
      }
    }

    return Stack(
      children: [
        Image.asset(
          getBackgroundImage(),
          //backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(canvasColor: AppColors.primary),
              //todo:to style bottom navigation bar
              child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },

                //todo:another way to style bottom navigation bar
                //selectedItemColor: AppColors.white,
                //unselectedItemColor: AppColors.black,
                //backgroundColor: AppColors.primary,
                //type: BottomNavigationBarType.fixed,
                items: [
                  buildBottomNavBar(
                    iconName: AppAssets.iconQuran,
                    label: 'quran',
                    index: 0,
                  ),
                  buildBottomNavBar(
                    iconName: AppAssets.iconHadeth,
                    label: 'Hadeth',
                    index: 1,
                  ),
                  buildBottomNavBar(
                    iconName: AppAssets.iconSebha,
                    label: 'sebha',
                    index: 2,
                  ),
                  buildBottomNavBar(
                    iconName: AppAssets.iconRadio,
                    label: 'Radio',
                    index: 3,
                  ),
                  buildBottomNavBar(
                    iconName: AppAssets.iconTime,
                    label: 'Time',
                    index: 4,
                  ),
                ],

                // BottomNavigationBarItem(
                //   icon: ImageIcon(AssetImage(AppAssets.iconQuran)),
                //   label: 'quran',
                // ),
                // BottomNavigationBarItem(
                //   icon: ImageIcon(AssetImage(AppAssets.iconHadeth)),
                //   label: 'Hadeth',
                // ),
                // BottomNavigationBarItem(
                //   icon: ImageIcon(AssetImage(AppAssets.iconSebha)),
                //   label: 'Sebha',
                // ),
                // BottomNavigationBarItem(
                //   icon: ImageIcon(AssetImage(AppAssets.iconRadio)),
                //   label: 'Radio',
                // ),
                // BottomNavigationBarItem(
                //   icon: ImageIcon(AssetImage(AppAssets.iconTime)),
                //   label: 'Time',
                // ),
              ),
            ),
            body: Column(
              children: [
                Image.asset(AppAssets.logo),

                Expanded(child: tabsList[selectedIndex]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavBar({
    required String iconName,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              width: 59,
              height: 34,

              decoration: BoxDecoration(
                color: AppColors.blackBg,
                borderRadius: BorderRadius.circular(66),
              ),
              child: ImageIcon(AssetImage(iconName)),
            )
          : ImageIcon(AssetImage(iconName)),
      label: label,
    );
  }
}
