import 'package:flutter/material.dart';
import 'package:sample/data/data.dart';
import 'package:sample/screens/screens.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  final List<Widget> _screens = [
    MyHomeBody(person: Person()), // Chats screen
    const MyStarBody(), // Highlights screen
    MyListNameBody(person: Person()), // People screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 8,
        selectedItemColor: const Color.fromARGB(255, 0, 102, 255),
        unselectedItemColor: const Color.fromARGB(255, 137, 137, 137),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bolt),
            label: 'Highlights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'People',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
          // Close drawer if open
          Navigator.pop(context);
        },
      ),
      appBar: AppBar(
        title: Text(
          _screens[currentIndex] is MyHomeBody
              ? 'Chats'
              : _screens[currentIndex] is MyStarBody
                  ? 'Highlights'
                  : 'People',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      drawer: DrawerWidget(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
          Navigator.pop(context); // Close drawer after navigation
        },
      ),
      body: _screens[currentIndex],
    );
  }
}

class DrawerWidget extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const DrawerWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
                size: 30.0,
              ),
              title: Text(
                'Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.chat, size: 40.0, color: Colors.black),
            title: const Text('Chats'),
            onTap: () {
              onTap(0);
            },
          ),
          ListTile(
            leading: Icon(Icons.bolt, size: 40.0),
            title: const Text('Highlights'),
            onTap: () {
              onTap(1);
            },
          ),
          ListTile(
            leading: Icon(Icons.group, size: 40.0),
            title: const Text('People'),
            onTap: () {
              onTap(2);
            },
          ),
        ],
      ),
    );
  }
}
