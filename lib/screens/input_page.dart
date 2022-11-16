import 'package:bmi_calculator/calculate_brain.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/resable_card.dart';
import '../constants.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInActiveCardColour;
  Color femaleCardColour = kInActiveCardColour;

  GenderType selectedGender;
  int height = 180;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    colour: selectedGender == GenderType.male
                        ? kActiveCardColour
                        : kInActiveCardColour,
                    cardChild: CardContent(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    colour: selectedGender == GenderType.female
                        ? kActiveCardColour
                        : kInActiveCardColour,
                    cardChild: CardContent(
                      cardIcon: FontAwesomeIcons.venus,
                      cardText: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kLargeTextStyle),
                      Text(
                        'cm',
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 300.0,
                      inactiveColor: kGreyColour,
                      activeColor: kBottomContainerColour,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: kLabelStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kLargeTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressedIcon: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                onPressedIcon: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: kActiveCardColour),
                ),
                Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: kLabelStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kLargeTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressedIcon: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                onPressedIcon: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: kActiveCardColour),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculateBrain calc =
                  CalculateBrain(weight: weight, height: height);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calc.calculateBMI(),
                            bmiTitle: calc.getResult(),
                            bmiInterpretation: calc.getInterpretation(),
                          )));
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 20.0),
              alignment: Alignment.center,
              child: Text(
                'Calculate',
                style: kLargeButtonStyle,
              ),
              color: kBottomContainerColour,
              width: double.infinity,
              margin: EdgeInsets.only(top: 15.0),
              height: kBottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressedIcon;

  RoundIconButton({@required this.icon, @required this.onPressedIcon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressedIcon,
      elevation: 0.6,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      child: Icon(icon),
      fillColor: kDarkGreyColour,
    );
  }
}
