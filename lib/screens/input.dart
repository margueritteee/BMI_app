import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../compo/icon_content.dart';
import '../compo/reusable_code.dart';
import '../compo/round_icon.dart';
import '../constants.dart';
import 'result_page.dart';
import '../compo/bottom_button.dart';
import 'package:bmi_calculator/calculator.dart';
enum Gender {
  male,
  female
}
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
   Gender  selectedGender=Gender.male;
   int height=180;
   int weight=60;
   int age=17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: Row(
              children:<Widget>[
                Expanded(child: ReusableCrad(
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.male;
                    });
                  },
                  colour: selectedGender==Gender.male?kActiveCardColor : kInactiveCardColour,
                  cardChild: IconCode(icon: FontAwesomeIcons.mars,
                    label: 'MALE',),)),
                Expanded(child:ReusableCrad(
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.female;
                    });
                  },
                  colour: selectedGender==Gender.female?kActiveCardColor : kInactiveCardColour,
                  cardChild: IconCode( icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',

                  ),)),
              ],
            )
            ),
            Expanded(child: ReusableCrad(colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  Text('HEIGHT',
                    style: kLabelText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),
                      style: kNumberText
                      ,),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('cm',
                      style: kLabelText ,)
                    ],
                  ),
                  SliderTheme(
                    data:SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF666771),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius:30.0 ),
                      thumbColor: Color(0xFFE1AFD1),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x2986326b),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                      setState(() {
                        height=newValue.round();
                      });
                      },
                    ),
                  ),
                ],
              ),
              onPress: (){

              },
            )),
            Expanded(child: Row(
              children:<Widget>[
                Expanded
                  (child: ReusableCrad(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT',
                      style: kLabelText,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center ,
                        children: <Widget>[
                       RoundIconButton(icon:FontAwesomeIcons.minus,
                         onPressed: (){
                         setState(() {
                           weight--;
                         });
                         },

                       ),

                         SizedBox(
                                width: 10.0,
                                ),
                          RoundIconButton(icon:FontAwesomeIcons.plus,
                            onPressed:(){
                            setState(() {
                              weight++;
                            });
                            },),
                      ])
                    ],
                  ),
                  onPress: (){

                },)),
                Expanded
                  (child: ReusableCrad(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE',
                        style: kLabelText,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberText,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center ,
                          children: <Widget>[
                            RoundIconButton(icon:FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },

                            ),

                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(icon:FontAwesomeIcons.plus,
                              onPressed:(){
                                setState(() {
                                  age++;
                                });
                              },),
                          ])
                    ],

                  ),
                  onPress: (){


                },)),
              ],
            )),
            BottomButton(buttonTitle: 'CALCULATE',
              onTap:  (){
              CalculatorBrain calc=CalculatorBrain(weight: weight, height: height);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation:calc.getInterpretation() ,
                    ),
                    )
                );
              },
            ),
          ],
        )

    );
  }
}



