import 'package:aplikasibaru/backend/grafik.dart';
import 'package:aplikasibaru/pages/daftarPage.dart';
import 'package:aplikasibaru/pages/halamanpercobaan.dart';
import 'package:aplikasibaru/pages/homePage.dart';
import 'package:aplikasibaru/pages/loginPage.dart';
import 'package:aplikasibaru/pages/mapPageinteractive.dart';
import 'package:aplikasibaru/pages/mapinteractivePointPage.dart';
import 'package:aplikasibaru/pages/notifPage.dart';
import 'package:aplikasibaru/pages/tambahSensor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'package:aplikasibaru/backend/firebasesetting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi monitoring selokan terintegrasi berbasis IoT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => DaftarPageDinas(),
        '/login': (context) => LoginPageDinasUpdate(),
        '/home': (context) => HomePageDinas(),
        '/notif': (context) => NotifPageDinas(),
        '/tambahsensor': (context) => TambahSensorPageDinas(),
        '/grafik': (context) => DataFetch(),
        '/zona': (context) => MapInteractive(),
        '/zona1': (context) => MapInteractivePoint(),
        '/gaje': (context) => grafik(),
        '/percobaan': (context) => HalamanCoba(),
      },
    );
  }
}
