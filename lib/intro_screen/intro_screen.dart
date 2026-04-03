import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/app_styles.dart';
import 'package:islami_app/home/home_screen.dart';


class IntroScreen extends StatelessWidget {
  static const String routeName = 'intro';

  IntroScreen({super.key});

  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      titleWidget: Text('Welcome To Islami', style: AppStyles.titleStyle),
      body: "",
      image: Image.asset("assets/images/intro0.png"),
    ),

    PageViewModel(
      titleWidget: Text('Welcome To Islami', style: AppStyles.titleStyle),
      bodyWidget: Text(
        'Read, and your Lord is the Most Generous',
        style: AppStyles.bodyStyle,
        textAlign: TextAlign.center,
      ),
      image: Image.asset('assets/images/intro1.png'),
    ),
    PageViewModel(
      titleWidget: Text('Reading the Quran', style: AppStyles.titleStyle),

      bodyWidget: Text(
        ' "Praise the name of your Lord, the Most High"',
        style: AppStyles.bodyStyle,
        textAlign: TextAlign.center,
      ),
      image: Image.asset('assets/images/intro2.png'),
    ),
    PageViewModel(
      titleWidget: Text('Bearish', style: AppStyles.titleStyle),
      bodyWidget: Text(
        "You can listen to the Holy Quran Radio through the application for free and easily",
        style: AppStyles.bodyStyle,
        textAlign: TextAlign.center,
      ),

      image: Image.asset('assets/images/intro3.png'),
    ),
    PageViewModel(


      titleWidget: Text('Holy Quran Radio', style: AppStyles.titleStyle),
      bodyWidget: Text(
        "We Are Very Excited To Have You In Our Community",
        style: AppStyles.bodyStyle,
        textAlign: TextAlign.center,
      ),
      image: Image.asset('assets/images/intro4.png'),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: AppColors.primary,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),

      globalHeader: Image.asset('assets/images/islami_top.png'),
      bodyPadding: EdgeInsets.only(top: 266),
      pages: listPagesViewModel,
      globalBackgroundColor: AppColors.black,
      showSkipButton: true,
      skip: Text('skip', style: AppStyles.bodyStyle),
      onSkip: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      showNextButton: true,
      next: Text('Next', style: AppStyles.bodyStyle),

      showBackButton: true,
      back: Text('Back', style: AppStyles.bodyStyle),
      showDoneButton: true,
      done: Text("Done", style: AppStyles.bodyStyle),
      onDone: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
    );
  }
}
