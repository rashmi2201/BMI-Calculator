// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_calculator_project/resultscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double heightValue = 150;
  double weightValue = 50;
  double ageValue = 25;
  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 150,
                  child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Icon(
                            Icons.male_sharp,
                            size: 35,
                            color: Colors.blue,
                          ),
                          Text(
                            'MALE',
                            style:
                                TextStyle(fontSize: 20, color: Colors.yellow),
                          )
                        ],
                      ),
                      color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: SizedBox(
                  height: 150,
                  child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Icon(
                            Icons.female_rounded,
                            size: 35,
                            color: Colors.red,
                          ),
                          Text(
                            'FEMALE',
                            style:
                                TextStyle(fontSize: 20, color: Colors.yellow),
                          )
                        ],
                      ),
                      color: Color.fromARGB(255, 206, 174, 174)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Another card
          Row(
            children: [
              SizedBox(
                width: 400,
                child: Card(
                  child: Column(
                    children: [
                      const Text(
                        'HEIGHT in cm',
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        heightValue.toStringAsFixed(1),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Slider(
                          value: heightValue,
                          activeColor: const Color.fromARGB(255, 228, 144, 138),
                          min: 50,
                          max: 150,
                          onChanged: (value) {
                            setState(() {
                              heightValue = value;
                            });
                          })
                    ],
                  ),
                  color: const Color.fromARGB(255, 119, 119, 123),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // ignore: prefer_const_constructors
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Card(
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 200,
                        ),
                        const Center(
                          child: Text(
                            'WEIGHT',
                            style:
                                TextStyle(fontSize: 20, color: Colors.yellow),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          weightValue.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 25),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 35,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.remove_circle,
                                size: 40,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (weightValue > 1) {
                                    weightValue--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add_circle,
                                size: 40,
                              ),
                              onPressed: () {
                                setState(() {
                                  weightValue++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    color: Colors.grey),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 200,
                width: 200,
                child: Card(
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 200,
                        ),
                        const Center(
                          child: Text(
                            'AGE',
                            style:
                                TextStyle(fontSize: 20, color: Colors.yellow),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          ageValue.toStringAsFixed(1),
                          // ignore: prefer_const_constructors
                          style: TextStyle(fontSize: 25),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 25,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.remove_circle,
                                size: 40,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (ageValue > 1) {
                                    ageValue--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add_circle,
                                size: 40,
                              ),
                              onPressed: () {
                                setState(() {
                                  ageValue++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                double heightmeter = heightValue / 100;
                double bmi = weightValue / (heightmeter * heightmeter);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(bmiResult: bmi),
                  ),
                );
              },
              child: const Text("Calculate BMI"))
        ],
      ),
    );
  }
}
