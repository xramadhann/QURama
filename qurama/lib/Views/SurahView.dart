// surah.dart
// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qurama/Models/ModelSurah.dart';

class Surah extends StatefulWidget {
  const Surah({super.key, required this.title, required int currentIndex});

  final String title;

  @override
  State<Surah> createState() => _SurahState();
}

class _SurahState extends State<Surah> {
  late Future<List<dynamic>> _surahData;
  final SurahService _surahService = SurahService();

  @override
  void initState() {
    super.initState();
    _surahData = _surahService.getSurahData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 66, 88),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 90),
              child: const Text(
                "Surah",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 55, left: 20, right: 20),
              child: SearchBar(
                hintText: "Search",
                // onChanged: _controller.searchMuseum,
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 15),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                leading: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: _surahData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    var surahList = snapshot.data!;
                    return Container(
                      margin: const EdgeInsets.only(top: 20),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(
                          top: 10, left: 5, right: 5, bottom: 10),
                      child: ListView.builder(
                        itemCount: surahList.length,
                        itemBuilder: (context, index) {
                          var surah = surahList[index];
                          return Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: const Color.fromARGB(255, 0, 66, 88),
                            ),
                            margin: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: ListTile(
                              leading: Text('${surah['nomor']}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20)),
                              title: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  '${surah['nama']} ',
                                  style: GoogleFonts.alexandria().copyWith(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  '${surah['nama_latin']} - ${surah['jumlah_ayat']} Ayat',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              onTap: () {},
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
