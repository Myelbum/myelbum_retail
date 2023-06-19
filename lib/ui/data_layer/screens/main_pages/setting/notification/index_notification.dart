import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _switchValue = false;
  bool _switchVibrateValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        backgroundColor: Palette.appThemeColor,
        elevation: 0.0,
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: const Text("Sound"),
              trailing: CupertinoSwitch(
                value: _switchValue,
                activeColor: Palette.appThemeColor,
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
            ),
            const ListTile(
              title: Text("Tone"),
              subtitle: Text("Default (Xenon)"),
            ),
            ListTile(
              title: const Text("Vibrate"),
              trailing: CupertinoSwitch(
                value: _switchVibrateValue,
                activeColor: Palette.appThemeColor,
                onChanged: (value) {
                  setState(() {
                    _switchVibrateValue = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
