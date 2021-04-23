import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: Text('Settings')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.lock_outline,
                        color: Colors.purple,
                      ),
                      title: Text("Chane Password"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.purple,
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Change Password")));
                      },
                    )
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.language_outlined,
                        color: Colors.purple,
                      ),
                      title: Text("Change Language"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.purple,
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Change Language")));
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_history,
                        color: Colors.purple,
                      ),
                      title: Text("Change Location"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.purple,
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Change Location")));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
