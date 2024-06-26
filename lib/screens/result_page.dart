import 'package:bmi_calculator/compo/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../compo/reusable_code.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.bmiResult, required this.interpretation,required this.resultText});
  final  String bmiResult ;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children:<Widget> [
           Expanded
             (child: Container(
             padding: EdgeInsets.all(15.0),
             alignment: Alignment.bottomLeft,
             child: Text('Your Result',
                style: kTitleTextStyle,
             ),
           ),
           ),
           Expanded(
             flex: 5,
             child: ReusableCrad(colour: kActiveCardColor, 
                 cardChild: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children:<Widget> [
                     Text(resultText.toUpperCase() , style: kResultText,
                     ),
                     Text(
                       bmiResult,
                       style: kBMITextStyle,
                     ),
                     Text(interpretation,
                       textAlign: TextAlign.center,
                       style: kBodyText,
                     )
                   ],
                 ), onPress: (){

               },
           )
           ),
           BottomButton(
               onTap: (){
                 Navigator.pop(context);
               },
               buttonTitle: 'RE-CALCULATE')
         ],
      )
    );
  }
}
