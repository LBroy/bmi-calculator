import 'package:bmi_calculator/gender.dart';
import 'package:bmi_calculator/gender_card.dart';
import 'package:flutter/material.dart';
import 'utils.dart' show screenAwareSize;

class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0.0), //MediaQuery.of(context).size
        child: Column(
          children: [
            _buildTitle(context),
            Expanded(
              child: _buildCards(context),
            ),
            _buildBottom(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenAwareSize(context, 56.0),
      ),
      child: Text(
        "BMI Calculator",
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: screenAwareSize(context, 108.0),
      width: double.infinity,
      child: Switch(
        value: true,
        onChanged: (val) {},
      ),
    );
  }

  Widget _buildCards(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: GenderCard(
                    Gender.male,
                  ),
                ),
                Expanded(
                  child: _tempCard("Weight"),
                ),
              ],
            ),
          ),
          Expanded(
            child: _tempCard("Height"),
          ),
        ],
      ),
    );
  }

  Widget _tempCard(String label) {
    return Card(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Text(label),
      ),
    );
  }
}
