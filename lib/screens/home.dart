import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/circular_icon_button.dart';
import 'package:bmi_calculator/components/custom_text.dart';
import 'package:bmi_calculator/model/calculate.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';

const double height = 120;
bool genderCard = true;
// 0 for male and 1 for female

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int inputHeight = 120;
  int inputWeight = 36;
  int inputAge = 19;

  decreaseWeight() {
    setState(() {
      if (inputWeight <= 1) return;
      inputWeight--;
    });
  }

  increaseWeight() {
    setState(() {
      if (inputWeight > 1000) return;
      inputWeight++;
    });
  }

  decreaseAge() {
    setState(() {
      if (inputAge <= 1) return;
      inputAge--;
    });
  }

  increaseAge() {
    setState(() {
      if (inputAge > 200) return;
      inputAge++;
    });
  }

  genderCardSelect() {
    setState(() {
      genderCard = !genderCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    String v = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                GenderCard(
                  label: 'MALE',
                  icon: Icons.male,
                  isCardSelect: genderCardSelect,
                  colour: genderCard == true ? Colors.white12 : Colors.white24,
                  textColour:
                      genderCard == true ? Colors.grey.shade400 : Colors.white,
                ),
                GenderCard(
                  label: 'FEMALE',
                  icon: Icons.female,
                  isCardSelect: genderCardSelect,
                  colour: genderCard == false ? Colors.white12 : Colors.white24,
                  textColour:
                      genderCard == false ? Colors.grey.shade400 : Colors.white,
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
                  const CustomText.custom(
                    label: 'HEIGHT',
                    fontSize: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      CustomText.custom(
                        label: '$inputHeight',
                        fontSize: 40,
                      ),
                      CustomText.custom(
                        label: 'CM',
                        fontSize: 14,
                        color: Colors.grey.shade50,
                      ),
                    ],
                  ),
                  Slider(
                    value: inputHeight.toDouble(),
                    min: 80,
                    max: 220,
                    label: v,
                    activeColor: Colors.purpleAccent,
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
                CustomCard(
                  name: 'WEIGHT',
                  increaseFunction: increaseWeight,
                  decreaseFunction: decreaseWeight,
                  inputLabelName: '$inputWeight',
                ),
                CustomCard(
                  name: 'AGE',
                  increaseFunction: increaseAge,
                  decreaseFunction: decreaseAge,
                  inputLabelName: '$inputAge',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BottomButton(
            label: 'CALCULATOR',
            onInputTap: () {
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

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.name,
    required this.increaseFunction,
    required this.decreaseFunction,
    required this.inputLabelName,
  });

  final String name;
  final String inputLabelName;
  final Function() increaseFunction;
  final Function() decreaseFunction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        colour: Colors.white12,
        cardChild: Column(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText.custom(
                      label: name,
                      fontSize: 22,
                    ),
                    CustomText.custom(
                      label: inputLabelName,
                      fontSize: 40,
                    ),
                  ]),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircularIconButton(
                    iconLabel: Icons.horizontal_rule,
                    onInputPress: decreaseFunction,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  CircularIconButton(
                    iconLabel: Icons.add,
                    onInputPress: increaseFunction,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  const GenderCard(
      {super.key,
      required this.label,
      required this.icon,
      required this.isCardSelect,
      required this.colour,
      required this.textColour});

  final IconData icon;
  final String label;
  final Color colour;
  final Function() isCardSelect;
  final Color textColour;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: isCardSelect,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: ReusableCard(
          colour: colour,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 85,
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomText.custom(label: label, color: textColour),
            ],
          ),
        ),
      ),
    );
  }
}
