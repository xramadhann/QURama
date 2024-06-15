// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:qurama/Models/ModelSurah.dart';

class DetailSurah extends StatefulWidget {
  const DetailSurah({super.key, required surah});

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  late Future<List<dynamic>> _surahData;
  final SurahService _surahService = SurahService();

  @override
  void initState() {
    super.initState();
    _surahData = _surahService.getSurahData();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
