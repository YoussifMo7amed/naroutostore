import 'package:intl/intl.dart';

extension StringFormate on String {
  String imageProductFormate() {
    return replaceAll(RegExp(r'^\["?|"\]?|"$'), '');
  }

  String toCapitalized() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
String convertLongString() {
    final words = this.split(' ');
    if (words.length > 2) {
      return words.sublist(0, 2).join(' ');
    } else {
      return this;
    }
  }
   String convertDataFormate() {
    final now = DateTime.now();

    return DateFormat('d MMM, y - h:mm a').format(now);
  }

}
