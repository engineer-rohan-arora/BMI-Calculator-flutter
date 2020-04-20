import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusabble_card.dart';
import 'input_page.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.interpretation,
        @required this.bmiResult,
        @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding:EdgeInsets.all(15.0) ,
              alignment: Alignment.center,
              child: Text(
                'Your Result',
                style: kTitle,
              ),
            ) ,
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Normal', style: kResultText,),
                  Text('18.3', style: kBMItext,),
                  Text('You are fit',
                    textAlign: TextAlign.center,
                    style: kbText,),
                ],
              ),
            ),

          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: Container(
              child: Center(child: Text('RE-CALCULATE', style: kLargeButtonTextStyle,)),
              color: Color(kBottomContainerColour),
              margin: EdgeInsets.only(top:10.0) ,
              //padding: EdgeInsets.only(bottom: 20),
              width: double.infinity,
              height: kBottomContainerHeight,

            ),
          )
        ],
      ),
    );
  }
}
