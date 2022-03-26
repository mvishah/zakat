// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'zakatCalculator.dart';


void main() =>
runApp(MaterialApp(
  title: "MV Zakat App",
  theme: ThemeData(
    // brightness: Brightness.dark,
    primaryColor: Colors.green,
    // accentColor: Colors.white,
    
  ),
 
  home:  zakatCalculator(),
  
));


