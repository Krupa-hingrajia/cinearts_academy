// To parse this JSON data, do
//
//     final matchesData = matchesDataFromJson(jsonString);

import 'dart:convert';

StudentData matchesDataFromJson(String str) => StudentData.fromJson(json.decode(str));

String studentDataToJson(StudentData data) => json.encode(data.toJson());

class StudentData {
  String? studentName;
  int? studentId;
  String? cardExpDate;
  String? studentCourse;

  StudentData({
    this.studentName,
    this.studentId,
    this.cardExpDate,
    this.studentCourse,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
    studentName: json["studentName"],
    studentId: json["studentID"],
    cardExpDate: json["cardExpDate"],
    studentCourse: json["studentCourse"],
  );

  Map<String, dynamic> toJson() => {
    "studentName": studentName,
    "studentID": studentId,
    "cardExpDate": cardExpDate,
    "studentCourse": studentCourse,
  };
}
