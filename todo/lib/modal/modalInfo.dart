import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'modalInfo.g.dart';

@HiveType(typeId: 1)
class ModalInfo {
  @HiveField(0)
  String titleText;
  @HiveField(1)
  String content;
  @HiveField(2)
  DateTime datetimeInfo;


  ModalInfo({this.titleText,this.content,this.datetimeInfo});
}
