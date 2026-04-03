import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/home/tabs/hadeth/widgets/hadeth_item.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(height: height * 0.66),
      items: List.generate(50, (index) => index + 1).map((index) {
        //.map change every index in list to widget as item accept list of widget only
        return HadethItem(index: index,);
      }).toList(),
    );
  }
}
