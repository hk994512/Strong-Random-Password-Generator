import 'package:flutter/material.dart';
import 'password_generater.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        cardColor: const Color.fromARGB(255, 9, 16, 53),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey,
          onBackground: Colors.white,
        )),
    home: const RandomPasswordGenerater()));
