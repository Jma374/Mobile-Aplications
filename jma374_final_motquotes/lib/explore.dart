import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_detail.dart';

class ExplorePage extends StatelessWidget {
  final List<Quote> sampleQuotes = const [
    Quote(
      quote:
          "The only limit to our realization of tomorrow is our doubts of today.",
      author: "Franklin D. Roosevelt",
      category: "Motivation",
    ),
    Quote(
      quote: "In the middle of every difficulty lies opportunity.",
      author: "Albert Einstein",
      category: "Inspiration",
    ),
    Quote(
      quote: "Happiness depends upon ourselves.",
      author: "Aristotle",
      category: "Philosophy",
    ),
  ];

  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sampleQuotes.length,
      itemBuilder: (ctx, i) {
        final q = sampleQuotes[i];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuoteDetailPage(quote: q),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(q.quote,
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text('- ${q.author}',
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.white70)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
