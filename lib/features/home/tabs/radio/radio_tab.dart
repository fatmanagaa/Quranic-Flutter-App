import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Column(
      children: [
          TabBar(tabs: [
            Tab(text: 'Radio'),
            Tab(text: 'Reciters',

            ),])

      ],
    ));
  }
}
