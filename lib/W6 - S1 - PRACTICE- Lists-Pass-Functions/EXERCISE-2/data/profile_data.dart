import 'package:flutter/material.dart';
import '../model/profile_tile_model.dart';

final ProfileData profileData = ProfileData(
    name: "Tep Pisey",
    position: "Student",
    avatarUrl: 'assets/w4-s2/images.jpeg',
    titles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+885 16 269 307"),
      TileData(
          icon: Icons.location_on,
          title: "Address",
          value: "Phnom Penh, Cambodia"),
      TileData(
          icon: Icons.email,
          title: "Mail",
          value: "pisey.tep@student.cadt.edu.kh"),
      TileData(icon: Icons.school, title: "Education", value: "Bachelor of CS"),
      TileData(
          icon: Icons.web, title: "Website", value: "www.Piseytep@gmail.com"),
    ]);
