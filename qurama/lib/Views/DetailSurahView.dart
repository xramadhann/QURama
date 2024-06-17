// ignore_for_file: file_names, use_super_parameters, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qurama/Models/ModelSurah.dart';

class DetailSurah extends StatefulWidget {
  final Map<String, dynamic> surah;

  const DetailSurah({Key? key, required this.surah}) : super(key: key);

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  late Future<List<dynamic>> _ayahData;
  final SurahService _surahService = SurahService();

  @override
  void initState() {
    super.initState();
    _ayahData = _surahService.getAyahData(widget.surah['nomor']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 500,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color.fromARGB(255, 0, 66, 88),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: Text(
                    widget.surah['nama_latin'],
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: Text(
                    widget.surah['nama'],
                    style: GoogleFonts.alexandria().copyWith(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: Text(
                    widget.surah['arti'],
                    style: GoogleFonts.alexandria().copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: Text(
                    '${widget.surah['jumlah_ayat']} Ayat',
                    style: GoogleFonts.alexandria().copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: _ayahData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  var ayahList = snapshot.data!;
                  return ListView.builder(
                    itemCount: ayahList.length,
                    itemBuilder: (context, index) {
                      var ayah = ayahList[index];
                      return ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: const Color.fromARGB(255, 0, 66, 88),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10, right: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${ayah['nomor']}',
                                          style:
                                              GoogleFonts.alexandria().copyWith(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.end,
                                          overflow: TextOverflow.visible,
                                        ),
                                        const SizedBox(
                                            width:
                                                10), // Jarak antara nomor ayat dan teks Arab
                                        Expanded(
                                          child: Text(
                                            '${ayah['ar']}',
                                            style: GoogleFonts.alexandria()
                                                .copyWith(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.end,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10, right: 10),
                                    child: Text(
                                      '${ayah['idn']}',
                                      style: GoogleFonts.alexandria().copyWith(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
