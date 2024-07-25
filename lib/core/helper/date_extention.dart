import 'package:intl/intl.dart';

extension DateExtention on DateTime {
  String get formattedDate => DateFormat('dd/MM/yyyy').format(this);
}
