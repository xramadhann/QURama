// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class dzikir extends StatefulWidget {
  const dzikir({super.key});

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
              margin: const EdgeInsets.only(top: 100),
              child: const Text(
                "dzikir",
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 0, 66, 88),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 20,
              child: Text(_counter.toString()),
            ),
            const SizedBox(height: 70),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _decrementCounter();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 15, left: 55),
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
                    child: const Text("Reset"),
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
