import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Homescreen extends StatelessWidget {
  List<Map> apps = [
    {"icon": Icons.settings, "name": "settings", "color": Colors.grey},
    {"icon": Icons.camera, "name": "camera", "color": Colors.grey},
    {"icon": Icons.android, "name": "android", "color": Colors.grey},
    {"icon": Icons.calculate, "name": "calculator", "color": Colors.grey},
    {"icon": Icons.lock_clock, "name": "clock", "color": Colors.red},
    {"icon": Icons.video_call, "name": "call", "color": Colors.red},
    {
      "icon": Icons.drive_file_rename_outline_sharp,
      "name": "drive",
      "color": Colors.red
    },
    {"icon": Icons.music_note, "name": "music", "color": Colors.red},
    {"icon": Icons.gamepad, "name": "game", "color": Colors.purpleAccent},
    {
      "icon": Icons.browse_gallery,
      "name": "gallery",
      "color": Colors.purpleAccent
    },
    {"icon": Icons.toll_outlined, "name": "toll", "color": Colors.purpleAccent},
    {
      "icon": Icons.memory_rounded,
      "name": "memory",
      "color": Colors.purpleAccent
    },
    {"icon": Icons.app_blocking, "name": "block", "color": Colors.brown},
    {"icon": Icons.duo, "name": "duo", "color": Colors.brown},
    {"icon": Icons.settings, "name": "settings", "color": Colors.grey},
    {"icon": Icons.camera, "name": "camera", "color": Colors.grey},
    {"icon": Icons.android, "name": "android", "color": Colors.grey},
    {"icon": Icons.calculate, "name": "calculator", "color": Colors.grey},
    {"icon": Icons.lock_clock, "name": "clock", "color": Colors.red},
    {"icon": Icons.video_call, "name": "call", "color": Colors.red},
    {
      "icon": Icons.drive_file_rename_outline_sharp,
      "name": "drive",
      "color": Colors.red
    },
    {"icon": Icons.music_note, "name": "music", "color": Colors.red},
    {"icon": Icons.gamepad, "name": "game", "color": Colors.purpleAccent},
    {
      "icon": Icons.browse_gallery,
      "name": "gallery",
      "color": Colors.purpleAccent
    },
    {"icon": Icons.toll_outlined, "name": "toll", "color": Colors.purpleAccent},
    {
      "icon": Icons.memory_rounded,
      "name": "memory",
      "color": Colors.purpleAccent
    },
    {"icon": Icons.app_blocking, "name": "block", "color": Colors.brown},
    {"icon": Icons.duo, "name": "duo", "color": Colors.brown},
  ];
  @override
  Widget build(Object context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Home Screen',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
          ),
          itemCount: apps.length,
          itemBuilder: (context, index) {
            final app = apps[index];
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(color: app["color"]),
                    child: Icon(app['icon']),
                  ),
                ),
                Text(app['name'])
              ],
            );
          },
        ));
  }
}
