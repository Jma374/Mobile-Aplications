import 'package:flutter/material.dart';

class UMAthleticsPage extends StatelessWidget {
  const UMAthleticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final athleticsImg = [
      "https://miamihurricanes.com/imgproxy/0E1VR59WiljoZr5RabrOm6qiNAo1lc2X_skEvdWBS7M/fit/1000/1000/ce/0/aHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29tL2h1cnJpY2FuZXNwb3J0cy1jb20vMjAyNS8wMy9iYTZhZTVhZS1yYW1fMzA4Ny5qcGc.jpg",
      "https://miamihurricanes.com/imgproxy/HuYQqlHhaNSDMEws761dIEFAm98nir5NI3BQojLCVw8/fit/2500/2500/ce/0/aHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29tL2h1cnJpY2FuZXNwb3J0cy1jb20vMjAyNS8wMy84MmZiNjBjZi1iYXNlYmFsbF9zcF8yNTAzMjEtMjYuanBn.jpg",
      "https://miamihurricanes.com/imgproxy/xjEKa5FVb-IFB6Ka3V5GR8Fq28ENOvzNDpA-bUtYYZI/fit/2500/2500/ce/0/aHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29tL2h1cnJpY2FuZXNwb3J0cy1jb20vMjAyNS8wMS8yMmU3YmU4Ny1ybV8wNjMzLmpwZw.jpg",
    ];

    final athleticsTitles = [
      "Hurricanes Football: Dominant Season",
      "Canes Baseball: Climbing the Rankings",
      "Women's Basketball: Historic Wins",
    ];

    final athleticsSummary = [
      "UM football showcases resilience with an impressive run towards the championships, highlighting standout players and memorable moments.",
      "Miami Baseball climbs national rankings following key victories and exceptional performances on the diamond.",
      "Women's Basketball at UM secures a historic season, breaking records and achieving new milestones.",
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: List.generate(athleticsImg.length, (index) {
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      athleticsImg[index],
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
                          athleticsTitles[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.deepOrange,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          athleticsSummary[index],
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
    );
  }
}
