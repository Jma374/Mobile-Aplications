import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "https://th.bing.com/th/id/OIP.meiPX5-6qIUWwSk7bnuORQHaEK?rs=1&pid=ImgDetMain",
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Upcoming Events",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Stay updated on upcoming events at the University of Miami.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            const ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.orange),
              title: Text("Event 1: UM Concert"),
              subtitle: Text("Date: March 30, 2025"),
            ),
            const ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.orange),
              title: Text("Event 2: Alumni Meetup"),
              subtitle: Text("Date: April 5, 2025"),
            ),
            const ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.orange),
              title: Text("Event 3: Science Fair"),
              subtitle: Text("Date: April 12, 2025"),
            ),
          ],
        ),
      ),
    );
  }
}
