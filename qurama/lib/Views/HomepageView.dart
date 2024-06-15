// ignore_for_file: file_names, unnecessary_const

import 'package:flutter/material.dart';
import 'package:qurama/Models/ModelDzikir.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required int currentIndex});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
                  margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  width: 200,
                  height: 350,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 15),
                        width: 10,
                        height: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: const Color.fromARGB(255, 0, 66, 88),
                        ),
                        padding: const EdgeInsets.only(
                          left: 30,
                        ),
                        child: Row(
                          children: [
                            Text(
                              allDataDzikir[index].latin,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 200),
                              child: SizedBox(
                                height: 70,
                                width: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {},
                                  child: null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 380,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.only(left: 50, top: 10, right: 50),
                  width: 10,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: SearchBar(
                    hintText: "Search",
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 15),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    leading: const Icon(Icons.search),
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
