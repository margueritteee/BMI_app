import 'package:flutter/material.dart';
import 'screens/input.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF685cb0),
        textTheme: TextTheme(
            bodyMedium: TextStyle(
              color: Colors.white,
            )
        ),
        appBarTheme: AppBarTheme(
            color: Color(0xFF685cb0),
            titleTextStyle: TextStyle(
              color: Colors.white,
            )
        ),
      ),
      home: InputPage(),
    );
  }
}

