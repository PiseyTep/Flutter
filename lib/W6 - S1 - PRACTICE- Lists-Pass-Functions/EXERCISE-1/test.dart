import 'package:flutter/material.dart';

// Define the ProfileData model
class ProfileData {
  final String name;
  final String position;
  final String avatarUrl;
  final List<TileData> tiles;

  ProfileData({
    required this.name,
    required this.position,
    required this.avatarUrl,
    required this.tiles,
  });
}

// Define the TileData model
class TileData {
  final IconData icon;
  final String title;
  final String value;

  TileData({
    required this.icon,
    required this.title,
    required this.value,
  });
}

// Define the POVVeasnaProfile data
ProfileData POVVeasnaProfile = ProfileData(
  name: "POV Veasna",
  position: "Flutter Developer",
  avatarUrl: 'aassets/flutter.png',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+855 99 514 852"),
    TileData(icon: Icons.location_on, title: "Address", value: "Prek leap, Chroy changva, Phnom penh Cambodia"),
    TileData(icon: Icons.email, title: "Mail", value: "veasna.pov@student.cadt.edu.kh"),
    TileData(icon: Icons.school, title: "School", value: "Cambodia Academy of Digital Technology"),
    TileData(icon: Icons.computer, title: "Major", value: "Computer Science"),
  ],
);

// Main entry point
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(profileData: POVVeasnaProfile),
  ));
}

// Main Color used in the UI
const Color mainColor = Color(0xff5E9FCD);

// ProfileApp Widget
class ProfileApp extends StatelessWidget {
  final ProfileData profileData; // Accept ProfileData as a parameter

  const ProfileApp({Key? key, required this.profileData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withAlpha(100),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'CADT Student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(profileData.avatarUrl),
            ),
            const SizedBox(height: 20),
            Text(
              profileData.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: mainColor,
              ),
            ),
            Text(
              profileData.position,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            // Generate tiles dynamically using the tiles list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: profileData.tiles.length,
              itemBuilder: (context, index) {
                final tile = profileData.tiles[index];
                return ProfileTile(
                  icon: tile.icon,
                  title: tile.title,
                  data: tile.value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ProfileTile Widget
class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: mainColor),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}