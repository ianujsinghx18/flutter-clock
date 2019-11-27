import 'package:intl/intl.dart' show DateFormat;

class BinaryTime {
  List<String> binaryIntegers;
  String day;

  BinaryTime() {
    DateTime now = DateTime.now();
    day = DateFormat.yMMMMd().format(now).toString();
    String hhmmss = DateFormat("Hms").format(now).replaceAll(':', '');

    binaryIntegers = hhmmss
        .split('')
        .map((str) => int.parse(str).toRadixString(2).padLeft(4, '0'))
        .toList();
  }

  get hourTens => binaryIntegers[0];
  get hourOnes => binaryIntegers[1];
  get minuteTens => binaryIntegers[2];
  get minuteOnes => binaryIntegers[3];
  get secondTens => binaryIntegers[4];
  get secondOnes => binaryIntegers[5];
}
