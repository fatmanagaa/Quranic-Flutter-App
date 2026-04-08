import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/app_colors.dart';
import '../../../../../core/app_assets.dart';
import '../../../../../core/app_styles.dart';

class HadethItem extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onTap;

  const HadethItem({
    super.key,
    required this.title,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppAssets.hadeethCardBg,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  AppAssets.hadethMosque,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Image.asset(
                    AppAssets.hadethRightCorner,
                    width: 80.w,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Image.asset(
                    AppAssets.hadethLeftCorner,
                    width: 80.w,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppStyles.bold24Black,
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          content,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: AppStyles.bold16Black.copyWith(
                            height: 1.6,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 60.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}