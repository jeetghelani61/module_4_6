import 'package:flutter/material.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Drawer App',
      home: HomeScreen(),
    );
  }
}

// ---------------- HOME SCREEN ----------------
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          "Home Screen",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}

// ---------------- PROFILE SCREEN ----------------
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}

// ---------------- SETTINGS SCREEN ----------------
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          "Settings Screen",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}

// ---------------- DRAWER WIDGET ----------------
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text(
                "My App",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
