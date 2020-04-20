import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusabble_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'brain.dart';



enum Genderr{
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;
  Genderr selectGender;
  int height = 100;
  int weight = 50;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR'),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectGender=Genderr.male;
                    });
                  },
                  colour: selectGender == Genderr.male ? kActiveCardColour : kInactiveCardColour,
                  cardChild:Gender(icon: FontAwesomeIcons.mars,txt: 'MALE',) ,
                ),
              ),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectGender=Genderr.female;
                  });
                },
                colour: selectGender == Genderr.female ? kActiveCardColour : kInactiveCardColour,
                cardChild: Gender(icon: FontAwesomeIcons.venus, txt: 'FEMALE'),),),

            ],
          ),
          ),
          Expanded(
            child: ReusableCard(
              colour:kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius:15.0 ),
                      overlayShape: RoundSliderOverlayShape(overlayRadius:30.0 ),
                      overlayColor:Color(0x29EB1555) ,
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 220,
                      onChanged:(double newValue){
                        setState(() {
                          height=newValue.toInt();
                        });
                      } ,
                    ),
                  ),
                ],
              ) ,
            ),
          ),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPressed: (){
                            setState(() {
                              weight=weight+1;
                            });
                            },
                          ),
                          SizedBox(width: 10,),
                          RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: (){
                            setState(() {
                              weight=weight-1;
                            });
                          },),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.plus,onPressed:(){
                            setState(() {
                              age=age+1;
                            });
                          },),
                          SizedBox(width: 10,),
                          RoundIconButton(icon: FontAwesomeIcons.minus,onPressed:(){
                            setState(() {
                              age=age-1;
                            });

                          },),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),),
          GestureDetector(
            onTap: (){

              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),),);
            },
            child: Container(
              child: Center(child: Text('CALCULATE', style: kLargeButtonTextStyle,)),
              color: Color(kBottomContainerColour),
              margin: EdgeInsets.only(top:10.0) ,
              //padding: EdgeInsets.only(bottom: 20),
              width: double.infinity,
              height: kBottomContainerHeight,

            ),
          ),
        ],
      ),
    );
  }
}



class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      //elevation: 6.0,
      //disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      );
  }
}

