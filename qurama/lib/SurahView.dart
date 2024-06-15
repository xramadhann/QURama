// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Surah extends StatefulWidget {
  const Surah({Key? key, required this.title, required int currentIndex})
      : super(key: key);

  final String title;

  @override
  State<Surah> createState() => _SurahState();
}

class _SurahState extends State<Surah> {
  late Future<List<dynamic>> _surahData;

  Future<List<dynamic>> getSurahData() async {
    var response = await http
        .get(Uri.parse('https://quran-api.santrikoding.com/api/surah'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List<dynamic>;
      return data;
    } else {
      throw Exception('Failed to load surah data');
    }
  }

  @override
  void initState() {
    super.initState();
    _surahData = getSurahData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<dynamic>>(
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
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: ListTile(
                      leading: Text('${surah['nomor']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20)),
                      title: Text('${surah['nama']} - ${surah['nama_latin']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20)),
                      subtitle: Text(
                        'Number of Ayahs: ${surah['jumlah_ayat']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context
                        //   // MaterialPageRoute(
                        //   //   builder: (context) =>
                        //   //       // SurahDetailsPage(surah: surah),
                        //   // ),
                        // );
                      },
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
