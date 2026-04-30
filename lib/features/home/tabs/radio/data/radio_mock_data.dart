import '../model/radio_item.dart';

class RadioMockData {
  static const List<RadioItem> radioStations = [
    RadioItem(name: 'Radio Ibrahim Al-Akdar'),
    RadioItem(name: 'Radio Al-Qaria Yassen', showOverlay: false),
    RadioItem(name: 'Radio Ahmed Al-Trabulsi'),
    RadioItem(name: 'Radio Addokali Mohammad Alalim'),
  ];

  static const List<RadioItem> reciters = [
    RadioItem(name: 'Reciter Abdul Basit'),
    RadioItem(name: 'Reciter Mishary Alafasy'),
    RadioItem(name: 'Reciter Maher Al-Muaiqly', showOverlay: false),
    RadioItem(name: 'Reciter Saad Al-Ghamdi'),
  ];
}
