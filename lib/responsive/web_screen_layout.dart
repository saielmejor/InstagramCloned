import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('AppBar Demo'),),
      body: Center(
        child:Text('This is mobile screen'),
      ),
      
    );
  }
}