import '../../ui/common/data.dart';

bool isBlankString(String? s, [bool withNullReplacementCheck = false]) =>
    withNullReplacementCheck
        ? (s == null ||
            s.toString().trim().isEmpty ||
            s.toLowerCase().trim() == 'null' ||
            s.toLowerCase().trim() == AppData.nullReplacement.toLowerCase())
        : (s == null ||
            s.toString().trim().isEmpty ||
            s.toLowerCase().trim() == 'null');

bool isEmpty(dynamic value) {
  if (value == null) {
    return true;
  }
  if (value is String) {
    return isBlankString(value);
  }
  if (value is Iterable || value is Map) {
    return value.isEmpty as bool;
  }
  return true;
}

String getInitial({required String? name}) {
  if (!isBlankString(name)) {
    var nameArray = name!.split(" ");
    return nameArray.length > 1
        ? '${nameArray[0].substring(0, 1).toUpperCase()} ${nameArray[1].substring(0, 1).toUpperCase()}'
        : nameArray[0].substring(0, 1).toUpperCase();
  } else {
    return '';
  }
}
