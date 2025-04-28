import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'favorites.dart';
import 'account.dart';
import 'quote.dart';
import 'explore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Quote> _favorites = [];

  void _addFavorite(Quote q) {
    if (!_favorites.any((f) => f.quote == q.quote && f.author == q.author)) {
      setState(() => _favorites.add(q));
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      DashboardPage(onFavorite: _addFavorite, favorites: _favorites),
      FavoritesPage(favorites: _favorites),
      const ExplorePage(),
      const AccountPage(),
    ];

    return MaterialApp(
      title: 'Motivational Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 105, 44, 212),
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: pages[_currentIndex],
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          indicatorColor: Color(0xFF2575FC),
          selectedIndex: _currentIndex,
          onDestinationSelected: (i) => setState(() => _currentIndex = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.favorite), label: 'Saved'),
            NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Account'),
          ],
        ),
      ),
    );
  }
}
