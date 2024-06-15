// ignore_for_file: file_names, use_super_parameters

import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text('${widget.surah['nama']} - ${widget.surah['nama_latin']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Number of Ayahs: ${widget.surah['jumlah_ayat']}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Place of Revelation: ${widget.surah['tempat_turun']}',
            ),
            const SizedBox(height: 8.0),
            Text(
              'Meaning: ${widget.surah['arti']}',
            ),
            const SizedBox(height: 8.0),
            Text(
              'Description: ${widget.surah['deskripsi']}',
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Ayat:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
                          title: Text(
                            '${ayah['idn']}',
                            textAlign: TextAlign.justify,
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
      ),
    );
  }
}
