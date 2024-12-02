import 'package:flutter/cupertino.dart';

class ProfileData {
  final String name;
  final String position;
  final String avatarUrl;
  final List<TileData> titles;

  ProfileData(
      {required this.name, 
      required this.position,
      required this.titles, 
      required this.avatarUrl});
}

class TileData {
  final IconData icon;
  final String title;
  final String value;

  TileData(
      {required this.icon,
      required this.title,
      required this.value});  
}
