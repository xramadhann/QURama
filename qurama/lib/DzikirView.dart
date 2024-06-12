// ignore_for_file: file_names, camel_case_types, use_super_parameters, unnecessary_const, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'ModelDzikir.dart';

class dzikir extends StatefulWidget {
  final int currentIndex;

  const dzikir({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<dzikir> createState() => _dzikirState();
}

class _dzikirState extends State<dzikir> {
  int _counter = 0;
  final PageController _pageController = PageController();

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter > 999) {
        _counter = 0;
      }
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
      backgroundColor: const Color.fromARGB(255, 0, 66, 88),
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 70,
                ),
                const Center(
                  child: Text(
                    "dzikir",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: allDataDzikir.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 0, top: 0),
                        padding: const EdgeInsets.all(20),
                        width: 380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 0, 66, 88),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              allDataDzikir[index].arab,
                              style: GoogleFonts.alexandria().copyWith(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              allDataDzikir[index].latin,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              allDataDzikir[index].arti,
                              style: const TextStyle(
                                fontSize: 18,
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
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: allDataDzikir.length,
                      effect: const SlideEffect(
                        spacing: 10.0,
                        radius: 4.0,
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: Colors.white,
                        activeDotColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: 600,
              height: 380,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Container(
                    child: Center(
                      child: Image.asset(
                        "assets/images/dzikir.png",
                        height: 380,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: (MediaQuery.of(context).size.width - 165) / 2,
                    width: 165,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "$_counter",
                          style: const TextStyle(
                            fontSize: 40,
                            color: Color.fromARGB(255, 0, 66, 88),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 172,
                    left: (MediaQuery.of(context).size.width + 103) / 2,
                    width: 35,
                    height: 35,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      onPressed: () {
                        _decrementCounter();
                      },
                      child: null,
                    ),
                  ),
                  Positioned(
                    top: 235,
                    left: (MediaQuery.of(context).size.width - 90) / 2,
                    width: 90,
                    height: 90,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 66, 88),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 10,
                        ),
                      ),
                      onPressed: () {
                        _incrementCounter();
                      },
                      child: null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
