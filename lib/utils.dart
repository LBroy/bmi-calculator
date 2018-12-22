import 'package:flutter/material.dart';

// specs for screen size with height of 650px
const double baseHeight = 650.0;

double screenAwareSize(BuildContext context, double size) {
  return size * (MediaQuery.of(context).size.height / baseHeight);
}
