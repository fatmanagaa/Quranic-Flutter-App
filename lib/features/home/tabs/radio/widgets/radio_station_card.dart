import 'package:flutter/material.dart';
import 'package:islami_app/core/app_assets.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/app_styles.dart';

class RadioStationCard extends StatelessWidget {
  final String stationName;
  final bool isPlaying;
  final bool showOverlay;
  final VoidCallback onPlayPause;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const RadioStationCard({
    super.key,
    required this.stationName,
    required this.isPlaying,
    required this.onPlayPause,
    required this.onNext,
    required this.onPrevious,
    this.showOverlay = true,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color(0x30000000),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: SizedBox(
            height: 140,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: AppColors.primary,
                    child: Image.asset(
                      AppAssets.radioPartBg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (showOverlay)
                  Positioned.fill(
                    child: Container(color: const Color(0x1A000000)),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        stationName,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.bold24Black.copyWith(fontSize: 32 * 0.56),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: onPrevious,
                            iconSize: 30,
                            color: AppColors.black,
                            icon: const Icon(Icons.skip_previous_rounded),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 52,
                            height: 52,
                            decoration: const BoxDecoration(
                              color: AppColors.blackBg,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: onPlayPause,
                              color: AppColors.primary,
                              iconSize: 30,
                              icon: Icon(
                                isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: onNext,
                            iconSize: 30,
                            color: AppColors.black,
                            icon: const Icon(Icons.skip_next_rounded),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
