import 'package:flutter_navigation_2/models/BaseModel.dart';

class ItemModel extends BaseModel {
  final String title;
  final String caption;

  const ItemModel({required this.title, required this.caption});

  ItemModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        caption = json['caption'];
}
