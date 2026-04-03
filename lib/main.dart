import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/app_routes.dart';
import 'package:islami_app/core/app_theme.dart';
import 'package:islami_app/core/cache_helper.dart';
import 'package:islami_app/features/home/home_screen.dart';
import 'package:islami_app/features/home/tabs/quran/details/sura_details_screen.dart';

import 'features/introduction/intro_screen.dart';
import 'features/splash/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroScreen(),
        initialRoute:AppRoutes.splashRouteName,
        routes: {
          AppRoutes.splashRouteName: (context) => SplashScreen(),
          AppRoutes.introRouteName: (context) => IntroScreen(),
          AppRoutes.homeRouteName: (context) => HomeScreen(),
          AppRoutes.suraDetailsRouteName: (context) => SuraDetailsScreen(),
        },
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
