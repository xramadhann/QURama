// ignore_for_file: file_names, camel_case_types, use_super_parameters

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ModelDzikir.dart';

class dzikir extends StatefulWidget {
  final int currentIndex;

  const dzikir({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<dzikir> createState() => _dzikirState();
}

class _dzikirState extends State<dzikir> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Text(
                "dzikir",
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                itemCount: allDataDzikir.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    padding: EdgeInsets.all(20),
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 0, 66, 88),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          allDataDzikir[index].arab,
                          style: GoogleFonts.alexandria().copyWith(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          allDataDzikir[index].latin,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          allDataDzikir[index].arti,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 50,
              child: Text(
                _counter.toString(),
                style: const TextStyle(fontSize: 40),
              ),
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _decrementCounter();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, left: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 20,
                            offset: const Offset(0, 2),
                          ),
                        ]),
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    width: 150,
                    child: const Text("Reset", style: TextStyle(fontSize: 20)),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    _incrementCounter();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 20,
                            offset: const Offset(0, 2),
                          ),
                        ]),
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: 150,
                    width: 150,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
