import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/app_routes.dart';
import 'package:islami_app/core/app_theme.dart';
import 'package:islami_app/core/cache_helper.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/home/tabs/quran/details/sura_details_screen.dart';
import 'package:islami_app/intro_screen/intro_screen.dart';


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
        initialRoute: IntroScreen.routeName,
        routes: {
          IntroScreen.routeName: (context) => IntroScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          AppRoutes.suraDetailsRouteName: (context) => SuraDetailsScreen(),
        },
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
