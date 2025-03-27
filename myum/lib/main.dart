import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'eventspage.dart';
import 'um_athletics.dart'; // ← new Athletics page

void main() {
  runApp(const MyUm());
}

class MyUm extends StatelessWidget {
  const MyUm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyUM',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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

  // News Page Data
  final img = [
    "https://news.miami.edu/_assets/images-stories/2025/03/chelsea-kramer-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/03/jonathan-vilma-hero-790x527.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/02/mullings-family-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/02/tiktok-digital-dilemma-hero-940x529.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/02/oceanlife-hero-790x5271.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/01/moon-telescope-hero-365.jpg",
  ];

  final titles = [
    "Chelsea Kramer's entrepreneurial journey",
    "From pro bowler to broadcaster",
    "A Cane family invests in future generations",
    "The digital dilemma: To grow or not",
    "’A fertilizer for the sea’",
    "Telescoping from the moon",
  ];

  final summary = [
    "CEO of clothing brand Parke shares insights on sustainable fashion and organic marketing.",
    "Jonathan Vilma reflects on football, NFL, and broadcasting career insights.",
    "The Mullings family endows scholarship at Miami Herbert Business School.",
    "UM research explores Douyin's growth and digital competition.",
    "UM scientists study the impact of Saharan dust on ocean ecosystems.",
    "UM astrophysicist helps develop an X-ray telescope destined for lunar orbit.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyUM'),
        backgroundColor: Colors.orange,
      ),
      body: [
        const SingleChildScrollView(child: Center(child: Dashboard())),
        // News Page using Column
        SingleChildScrollView(
          child: Column(
            children: List.generate(img.length, (index) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          img[index],
                          width: 100,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titles[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.deepOrange,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              summary[index],
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        const SingleChildScrollView(child: EventsPage()),
        const SingleChildScrollView(child: UMAthleticsPage()),
      ][currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() => currentIndex = index);
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.list), label: 'News'),
          NavigationDestination(icon: Icon(Icons.event), label: 'Events'),
          NavigationDestination(icon: Icon(Icons.sports), label: 'Athletics'),
        ],
      ),
    );
  }
}
