import 'package:flutter/material.dart';

void main() {
  runApp(const MyUm());
}

class MyUm extends StatelessWidget {
  const MyUm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyUM',
      home: const MyUmApp(),
    );
  }
}

class MyUmApp extends StatefulWidget {
  const MyUmApp({super.key});

  @override
  State<MyUmApp> createState() => _MyUmAppState();
}

class _MyUmAppState extends State<MyUmApp> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyUM'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: <Widget>[
          const Text('Home Page', style: TextStyle(fontSize: 24)),
          const Text('Campus Map', style: TextStyle(fontSize: 24)),
          const Text('Events', style: TextStyle(fontSize: 24)),
          const Text('Contact', style: TextStyle(fontSize: 24)),
        ][currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          NavigationDestination(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}
