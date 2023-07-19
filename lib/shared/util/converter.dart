import 'package:cloud_firestore/cloud_firestore.dart';

class JsonConverterWrapper {
  /// Get date
  static String date(Map<dynamic, dynamic> json, Object value) {
    if (json[value] == null) {
      return '2022-02-04T19:51:39.671806Z';
    }
    return (json[value] as Timestamp).toDate().toString();
  }

  /// Get TimeStamp
  static Timestamp toJson(String value) {
    final date = DateTime.parse(value);
    return Timestamp.fromDate(date);
  }

  /// Get profile
// static Profile profile(Map<dynamic, dynamic> json, Object value) {
//   if (json.containsKey(value)) {
//     return Profile.fromJson(json[value] as Map<String, String>);
//   }
//   return Profile.initial();
// }
}
