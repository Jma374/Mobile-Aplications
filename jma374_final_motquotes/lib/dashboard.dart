import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'quote.dart';

const _apiKey = 'o/UbZW6xr8MNmMh+UjUjEw==qRP0pCSuXbX5MiIr';

class DashboardPage extends StatefulWidget {
  final void Function(Quote) onFavorite;
  final List<Quote> favorites;

  const DashboardPage({
    super.key,
    required this.onFavorite,
    required this.favorites,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  List<Quote> _quotes = [];
  bool _isLoading = true;
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() => _currentPage = _pageController.page ?? 0);
    });
    _fetchMultipleQuotes(10);
  }

  Future<void> _fetchMultipleQuotes(int count) async {
    final futures = List.generate(count, (_) {
      return http.get(
        Uri.parse('https://api.api-ninjas.com/v1/quotes'),
        headers: {'X-Api-Key': _apiKey},
      );
    });

    try {
      final responses = await Future.wait(futures);
      final tmp = <Quote>[];
      for (var res in responses) {
        if (res.statusCode == 200) {
          final list = jsonDecode(res.body) as List;
          tmp.add(Quote.fromJson(list.first));
        }
      }
      setState(() {
        _quotes = tmp;
        _isLoading = false;
      });
    } catch (_) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());
    if (_quotes.isEmpty) {
      return const Center(child: Text("No quotes available."));
    }

    return PageView.builder(
      controller: _pageController,
      itemCount: _quotes.length,
      itemBuilder: (ctx, i) {
        final q = _quotes[i];
        final delta = (_currentPage - i).abs();
        final scale = (1 - (delta * 0.1)).clamp(0.9, 1.0);
        final isFavorite = widget.favorites
            .any((f) => f.quote == q.quote && f.author == q.author);

        return Transform.scale(
          scale: scale,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(q.quote,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text('- ${q.author}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontStyle: FontStyle.italic,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (!isFavorite) widget.onFavorite(q);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
