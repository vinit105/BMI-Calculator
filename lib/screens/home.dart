import 'package:bmi_calculator/model/calulate.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double height = 120;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int inputHeight = 120;
  int inputWeight = 36;
  int inputAge = 19;

  @override
  Widget build(BuildContext context) {
    String v = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                const Expanded(
                  child: ReusableCard(
                    colour: Colors.white12,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          color: Colors.white,
                          size: 85,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Colors.white12,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          color: Colors.white,
                          size: 85,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ReusableCard(
              colour: Colors.white12,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$inputHeight',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'CM',
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  Slider(
                    value: inputHeight.toDouble(),
                    min: 80,
                    max: 220,
                    label: v,
                    activeColor: Colors.yellow,
                    onChanged: (newValue) {
                      setState(() {
                        inputHeight = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: Colors.white12,
                    cardChild: Column(
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'WEIGHT',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      '$inputWeight',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'KG',
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ],
                                ),
                              ]),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.horizontal_rule,
                                  size: 50.0,
                                  color: Colors.white,
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    const CircleBorder(),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black12),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  size: 50.0,
                                  color: Colors.white,
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    const CircleBorder(),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black12),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Colors.white12,
                    cardChild: Column(
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'AGE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                Text(
                                  '$inputAge',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.horizontal_rule,
                                  size: 50.0,
                                  color: Colors.white,
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    const CircleBorder(),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black12),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              IconButton(
                                onPressed: () {
                                  //Navigator.of(context).push(MaterialPageRoute(
                                  //        builder: (context) => const Scrren()));
                                },
                                icon: Icon(
                                  Icons.add,
                                  size: 50.0,
                                  color: Colors.white,
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    const CircleBorder(),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black12),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              color: Colors.yellow,
              height: 80.0,
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                      fontSize: 38,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: inputHeight, weight: inputWeight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                      interpretation: calc.getInterpretation(),
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult()),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key, required this.colour, required this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.all(10.0),
      child: cardChild,
    );
  }
}
