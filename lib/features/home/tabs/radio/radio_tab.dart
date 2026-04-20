import 'package:flutter/material.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/app_styles.dart';
import 'data/radio_mock_data.dart';
import 'model/radio_item.dart';
import 'widgets/radio_station_card.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int _playingRadioIndex = -1;
  int _playingReciterIndex = -1;

  void _togglePlay({required bool isRecitersTab, required int index}) {
    setState(() {
      if (isRecitersTab) {
        _playingReciterIndex = _playingReciterIndex == index ? -1 : index;
        return;
      }
      _playingRadioIndex = _playingRadioIndex == index ? -1 : index;
    });
  }

  void _playNext({required bool isRecitersTab, required int index, required int length}) {
    if (length == 0) return;
    setState(() {
      final nextIndex = (index + 1) % length;
      if (isRecitersTab) {
        _playingReciterIndex = nextIndex;
        return;
      }
      _playingRadioIndex = nextIndex;
    });
  }

  void _playPrevious({required bool isRecitersTab, required int index, required int length}) {
    if (length == 0) return;
    setState(() {
      final previousIndex = (index - 1 + length) % length;
      if (isRecitersTab) {
        _playingReciterIndex = previousIndex;
        return;
      }
      _playingRadioIndex = previousIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width * 0.04;

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.blackBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TabBar(
                labelColor: AppColors.black,
                unselectedLabelColor: AppColors.white,
                labelStyle: AppStyles.bold16Black,
                unselectedLabelStyle: AppStyles.bold16White,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                tabs: const [
                  Tab(text: 'Radio'),
                  Tab(text: 'Reciters'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              children: [
                _buildStationsList(
                  stations: RadioMockData.radioStations,
                  isRecitersTab: false,
                ),
                _buildStationsList(
                  stations: RadioMockData.reciters,
                  isRecitersTab: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStationsList({required List<RadioItem> stations, required bool isRecitersTab}) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 12),
      itemCount: stations.length,
      itemBuilder: (context, index) {
        final currentPlayingIndex = isRecitersTab ? _playingReciterIndex : _playingRadioIndex;
        final station = stations[index];

        return RadioStationCard(
          stationName: station.name,
          showOverlay: station.showOverlay,
          isPlaying: currentPlayingIndex == index,
          onPlayPause: () => _togglePlay(isRecitersTab: isRecitersTab, index: index),
          onNext: () => _playNext(isRecitersTab: isRecitersTab, index: index, length: stations.length),
          onPrevious: () => _playPrevious(isRecitersTab: isRecitersTab, index: index, length: stations.length),
        );
      },
    );
  }
}
