import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/app_assets.dart';
import '../../../../../core/app_colors.dart';
import '../../../../../core/app_styles.dart';
import '../../../../../model/hadeth.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Hadeth hadeth = args['hadeth'];
    final int index = args['index'];

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Hadith $index', style: AppStyles.bold20Primary),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),

              child: Image.asset(AppAssets.cornerRight, width: 100.w),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset(AppAssets.cornerLeft, width: 100.w),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AppAssets.hadethMosque,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Text(
                  hadeth.title,
                  style: AppStyles.bold24Primary,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Text(
                      hadeth.content,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: AppStyles.bold20Primary.copyWith(height: 1.6),
                    ),
                  ),
                ),
                SizedBox(height: 120.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
