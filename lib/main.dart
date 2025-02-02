import 'package:flutter/material.dart';

void main() {
  runApp(MoraApp());
}

class MoraApp extends StatelessWidget {
  const MoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashPage());
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
