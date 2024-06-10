import 'package:flutter/material.dart';
import 'CreateMood_Screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imgProfile =
      'https://www.its.ac.id/aktuaria/wp-content/uploads/sites/100/2018/03/user.png';
  dynamic myDisplayName = 'User';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(imgProfile),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Hello $myDisplayName, you are Superheroname!',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Moods: ........',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        iconSize: 35.0,
                        tooltip: 'Set Profile Name',
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          // Add navigation or action for Settings
                        },
                      ),
                      IconButton(
                        iconSize: 35.0,
                        tooltip: 'Create Moods',
                        icon: Icon(Icons.person_add),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateMoodsScreen()),
                          );
                        },
                      ),
                      IconButton(
                        iconSize: 35.0,
                        tooltip: 'Log Out',
                        icon: Icon(Icons.power_settings_new),
                        onPressed: () {
                          // Add navigation or action for Log Out
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
