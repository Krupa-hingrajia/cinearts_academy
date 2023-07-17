import 'package:flutter/material.dart';
import 'package:get/get.dart';

Size displaySize(BuildContext context){
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context){
  Get.height;
  return MediaQuery.of(context).size.height;
}

double displayWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}