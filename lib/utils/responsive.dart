import 'package:flutter/material.dart';

class ResponsiveLayout {
  static const double tabletBreakpoint = 850.0;
  static const double phoneBreakpoint = 500.0;

  final BuildContext context;

  ResponsiveLayout(this.context);

  String getDeviceType() {
    final double width = MediaQuery.of(context).size.width;

    //if width exceeds 850 = web
    if (width >= tabletBreakpoint) 
    {
      return "web";
    } 

    // else width is between 850 and 480 = tablet
    else if (width >= phoneBreakpoint) 
    {
      return "tablet";
    } 

    // else less than 480 = phone
    else 
    {
      return "mobile";
    }
  }
}




