import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mytask/views/home_view.dart';



class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _duration = const Duration(seconds: 2);

  late Timer? _t;

  void _timer() async {
    _t = Timer.periodic(_duration, _callback);
  }

  void _callback(_) =>    Navigator.of(context).pushReplacement(
    MaterialPageRoute<void>(
      builder: (BuildContext context) => HomeView(),
    ),
  );

  @override
  void initState() {
    _timer();
    super.initState();
  }

  @override
  void dispose() {
    _t?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: Text('myTask',
        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w900,
        ),),
      ),
    );  }
}
