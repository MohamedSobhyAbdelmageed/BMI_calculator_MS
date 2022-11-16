import 'input_page.dart';
import 'package:bmi_calculator/components/resable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String bmiTitle;
  final String bmiInterpretation;
  ResultPage(
      {@required this.bmiResult,
      @required this.bmiTitle,
      @required this.bmiInterpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiTitle,
                    style: kTitleStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(bmiResult.toString(), style: kResultLargeTextStyle),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                    child: Text(
                      bmiInterpretation,
                      style: kBodyStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 20.0),
              alignment: Alignment.center,
              child: Text(
                'Re-Calculate',
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
