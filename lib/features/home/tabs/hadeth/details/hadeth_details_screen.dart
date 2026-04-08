import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/app_assets.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/app_styles.dart';
import 'package:islami_app/model/hadeth.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hadeth = ModalRoute.of(context)?.settings.arguments as Hadeth?;

    if (hadeth == null) {
      return Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          ),
        ),
        body: Center(
          child: Text(
            'No hadith data found.',
            style: AppStyles.bold16White,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        ),
        title: Text(
          hadeth.title,
          style: AppStyles.bold20Primary,
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            AppAssets.hadethBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppAssets.cornerLeft, width: 60.w),
                      Image.asset(AppAssets.cornerRight, width: 60.w),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    hadeth.title,
                    style: AppStyles.bold24Black,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(height: 15.h),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Text(
                        hadeth.content,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: AppStyles.bold20White.copyWith(
                          color: AppColors.black,
                          height: 1.8,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Image.asset(
                    AppAssets.mosque,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
