import 'package:bmi_calculator/card_title.dart';
import 'package:bmi_calculator/gender.dart';
import 'package:bmi_calculator/utils.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';

double _circleSize(BuildContext context) => screenAwareSize(context, 80.0);

const double _defaultGenderAngle = math.pi / 4;
const Map<Gender, double> _genderAngles = {
  Gender.female: -_defaultGenderAngle,
  Gender.other: 0.0,
  Gender.male: _defaultGenderAngle,
};

class GenderIconTranslated extends StatelessWidget {
  static final Map<Gender, String> _genderImages = {
    Gender.female: "images/gender_female.svg",
    Gender.male: "images/gender_male.svg",
    Gender.other: "images/gender_other.svg",
  };

  final Gender gender;
  GenderIconTranslated(this.gender, {Key key}) : super(key: key);

  bool get _isOtherGender => gender == Gender.other;

  String get _assetName => _genderImages[gender];

  double _iconSize(BuildContext context) {
    return screenAwareSize(context, _isOtherGender ? 20.0 : 16.0);
  }

  double _genderLeftPadding(BuildContext context) {
    return screenAwareSize(context, _isOtherGender ? 8.0 : 8.0);
  }

  @override
  Widget build(BuildContext context) {
    Widget icon = Padding(
      padding: EdgeInsets.only(left: _genderLeftPadding(context)),
      child: SvgPicture.asset(
        _assetName,
        height: _iconSize(context),
        width: _iconSize(context),
      ),
    );
    Widget rotatedIcon = Transform.rotate(
      child: icon,
      angle: _genderAngles[gender],
    );
    Widget iconWithALine = Padding(
      padding: EdgeInsets.only(bottom: 0 * _circleSize(context) / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          rotatedIcon,
          GenderLine(),
        ],
      ),
    );
    Widget rotatedIconWithALine = Transform.rotate(
      alignment: Alignment.bottomCenter,
      angle: _genderAngles[gender],
      child: iconWithALine,
    );
    Widget centeredIconWithALine = Padding(
      padding: EdgeInsets.only(bottom: _circleSize(context) / 2),
      child: rotatedIconWithALine,
    );
    return centeredIconWithALine;
  }
}

class GenderCard extends StatefulWidget {
  final Gender initialGender;
  // GenderCard({this.initialGender});
  GenderCard(this.initialGender, {Key key}) : super(key: key);
  @override
  _GenderCardState createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CardTitle("GENDER"),
            Padding(
              padding: EdgeInsets.only(top: screenAwareSize(context, 16.0)),
              child: _drawMainStack(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawMainStack() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _drawCircleIndicator(),
        GenderIconTranslated(Gender.female),
        GenderIconTranslated(Gender.other),
        GenderIconTranslated(Gender.male),
      ],
    );
  }

  Widget _drawCircleIndicator() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        GenderCircle(),
      ],
    );
  }
}

class GenderCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: _circleSize(context),
      height: _circleSize(context),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(244, 244, 244, 1),
      ),
    );
  }
}

class GenderLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenAwareSize(context, 6.0),
      ),
      child: Container(
        height: screenAwareSize(context, 8.0),
        width: 1.0,
        color: Color.fromRGBO(216, 217, 223, 0.54),
      ),
    );
  }
}
