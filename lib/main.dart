import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vitalitas/auth/auth.dart';
import 'package:vitalitas/data/bodybuilding/exercise.dart';
import 'package:vitalitas/data/mayoclinic/conditon.dart';
import 'package:vitalitas/data/mayoclinic/drug.dart';
import 'package:vitalitas/ui/appstate/health.dart';
import 'package:vitalitas/ui/appstate/home.dart';
import 'package:vitalitas/ui/auth/landing.dart';

import 'firebase_options.dart';

import 'package:vitalitas/ui/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Vitalitas());
}

class Vitalitas extends StatelessWidget {
  static AppTheme theme = AppTheme();
  const Vitalitas({super.key});
  @override
  Widget build(BuildContext context) {
    theme.bg = Colors.white;
    theme.fg = Colors.red[800];
    theme.acc = Colors.red[200];
    theme.txt = Colors.black;

    Widget page = LandingPage();
    if (Authentification.currentUser != null &&
        Authentification.currentUser!.emailVerified) {
      page = HomePage.load();
    }
    return MaterialApp(
      title: 'Vitalitas',
      home: page,
    );
  }
}

class AppTheme {
  var bg;
  var fg;
  var acc;
  var txt;
}
