// ignore_for_file: file_names, unnecessary_const, unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qurama/Models/ModelNews.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required int currentIndex});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<dynamic>> _newsData;
  final NewsService _newsService = NewsService();

  @override
  void initState() {
    super.initState();
    _newsData = _newsService.getNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 66, 88),
      body: Stack(
        children: [
          const Positioned(
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text("Assalamuallaikum",
                    style: TextStyle(fontSize: 25, color: Colors.white)),
                Text("Jakarta, Indonesia",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
              ],
            ),
          ),
          const Positioned(
            top: 110,
            left: 0,
            right: 0,
            bottom: 400,
            child: Column(
              children: [
                Text(
                  "19:20",
                  style: TextStyle(fontSize: 70, color: Colors.white),
                ),
                Text(
                  "Selasa, 2 Juni 2024",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            top: 270,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: const Column(
                    children: [
                      Text(
                        "fajr",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "04:20",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: const Column(
                    children: [
                      Text(
                        "dzuhur",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "11:59",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: const Column(
                    children: [
                      Text(
                        "asr",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "15:25",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: const Column(
                    children: [
                      Text(
                        "maghrib",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "17:58",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: const Column(
                    children: [
                      Text(
                        "isya",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "19:16",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: 200,
                  height: 400,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                top: 390,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  width: 200,
                  height: 350,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: FutureBuilder<List<dynamic>>(
                    future: _newsData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        var newsList = snapshot.data!;
                        return Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              var news = newsList[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailSurah(news: news),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 320,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: const Color.fromARGB(255, 0, 66, 88),
                                  ),
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Padding(padding: EdgeInsets.all(5)),
                                      if (news['urlToImage'] != null)
                                        Image.network(
                                          news['urlToImage'],
                                          height: 200,
                                          width: 350,
                                          fit: BoxFit.cover,
                                        )
                                      else
                                        Image.asset(
                                          'assets/images/brokeimages.png',
                                          height: 200,
                                          width: 350,
                                          fit: BoxFit.cover,
                                        ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 20,
                                              left: 15,
                                              right: 10),
                                          child: Text(
                                            news['title'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
