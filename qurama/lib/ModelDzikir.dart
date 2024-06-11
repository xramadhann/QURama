// ignore_for_file: file_names

class DataDzikir {
  final String arab;
  final String latin;
  final String arti;

  const DataDzikir({
    required this.arab,
    required this.latin,
    required this.arti,
  });
}

const allDataDzikir = [
  DataDzikir(
    arab: "ٱللَّٰهُ أَكْبَرُ",
    latin: "allahu 'akbar",
    arti: "Allah Maha Besar",
  ),
  DataDzikir(
    arab: "سُبْحَانَ ٱللَّٰهِ",
    latin: "subhan allah",
    arti: "Maha suci Allah",
  ),
  DataDzikir(
    arab: "ٱلْحَمْدُ لِلَّٰهِ",
    latin: "alhamdlilah",
    arti: "Segala puji bagi Allah",
  ),
  DataDzikir(
    arab:
        "سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ وَلاَ إِلَهَ إِلاَّ اللَّهُ وَاللَّهُ أَكْبَرُ",
    latin: "subhan allah walhamd lilah wala 'iilah 'iilaa allah wallah 'akbar",
    arti:
        "Maha Suci Allah, puji bagi Allah, tidak ada Tuhan selain Allah, dan Allah Maha Besar",
  ),
  DataDzikir(
    arab: "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ سُبْحَانَ اللَّه الْعَظِيم",
    latin: "subhan allah wabihamdih subhan allah aleazim",
    arti: "Maha Suci Allah dan Segala puji hanya bagi-Nya",
  ),
];
