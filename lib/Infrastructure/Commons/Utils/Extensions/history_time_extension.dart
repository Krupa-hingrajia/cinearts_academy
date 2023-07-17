// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

String historyWatchAgoCustom(snapshot, {int? index}) {// <-- Custom method Time Show  (Display Example  ==> 'Today 7:00 PM')     // WhatsApp Time Show Status Shimila

 return index == 0
     ?
 DateTime.now().difference(DateTime.parse(snapshot[0]['time'])).inHours <= int.parse(DateTime.now().hour.toString())
     ?
 "Latest Notifications"
     :
 DateTime.now().difference(DateTime.parse(snapshot[index]['time'])).inDays < 2
     ?
 "Yesterday"
     :
 DateTime.now().difference(DateTime.parse(snapshot[index]['time'])).inDays <= 7
     ?
 DateFormat.E().format(DateTime.parse(snapshot[index]['time']))
     :
 DateTime.now().difference(DateTime.parse(snapshot[index]['time'])).inDays < 30
     ?
 DateFormat.MMMd().format(DateTime.parse(snapshot[index]['time']))
     :
 DateTime.now().difference(DateTime.parse(snapshot[index]['time'])).inDays > 30
     ?
 DateFormat.yMMM().format(DateTime.parse(snapshot[index]['time']))
     :
 DateFormat.E().format(DateTime.parse(snapshot[index]['time']))
     :
//index 0
 DateFormat.yMd().format(DateTime.parse(snapshot[index!-1]['time']))
     ==
     DateFormat.yMd().format(DateTime.parse(snapshot[index]['time']))
     ?
 "Latest Notifications"
     :
 DateTime.now().difference(DateTime.parse(snapshot[index]['time'])).inDays < 2
     ?
 "Yesterday"
     :
 DateTime.now().difference(DateTime.parse(snapshot[index]['time'])).inDays <= 7
     ?
 DateFormat.yMd().format(DateTime.parse(snapshot[index - 1]['time']))
     ==
     DateFormat.yMd().format(DateTime.parse(snapshot[index]['time']))
     ?
 ""
     :
 DateFormat.E().format(DateTime.parse(snapshot[index]['time'])) //week
     :
 DateTime.now().difference(DateTime.parse(snapshot[index]['time'])).inDays < 30
     ?
 DateFormat.MMMd().format(DateTime.parse(snapshot[index - 1]['time'])) ==
     DateFormat.MMMd().format(DateTime.parse(snapshot[index]['time']))
     ? ""
     :
 DateFormat.MMMd().format(DateTime.parse(snapshot[index]['time']))
     : //month
 DateTime.now().difference(DateTime.parse(snapshot[index]['time'])).inDays > 30
     ?
 DateFormat.yMMM().format(DateTime.parse(snapshot[index - 1]['time'])) ==
     DateFormat.yMMM().format(DateTime.parse(snapshot[index]['time']))
     ? ""
     :
 DateFormat.yMMMMd('en_US').format(DateTime.parse(snapshot[index]['time']))
     : "";
}


String historyTimeAgoCustom({required DateTime d}) {
 Duration diff = DateTime.now().difference(d);
 if (diff.inHours > 24) {
  return "${diff.inDays} ${diff.inDays == 1 ? "Day" : "Days"} ago";
 }
 if (diff.inHours > 0) {
  return "${diff.inHours} ${diff.inHours == 1 ? "Hour" : "Hours"} ago";
 }
 if (diff.inMinutes > 0) {
  return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
 }
 return "just now";
}


