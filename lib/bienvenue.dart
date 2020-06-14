import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'dash.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void initState() {
    Timer(Duration(seconds: 2), ()=> Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dash()),
    ));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            fit: StackFit.expand,
            children: <Widget> [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white
                  )
              ),
              Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    SizedBox(height: 150.0,),
                    Expanded(
                        flex: 2,
                        child: Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget> [
                                  Container(
                                    child: Icon(IcoFontIcons.fastDelivery, size: MediaQuery.of(context).size.width/3,color: Colors.blueAccent,),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                  ),
                                  Text('CARRY APP',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold)
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                  ),
                                  Text('Logistique Express',style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold)
                                  ),
                                ]
                            )
                        )
                    ),
                    SizedBox(height: 100.0,),
                    Expanded(flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                                children: <Widget> [
                                  Center(
                                    child: Text('By Carry Team', style: TextStyle(
                                        fontSize: 11.0,
                                        color: Colors.blueAccent)),
                                  ),
                                ]
                            ),
                          ],
                        ))
                  ]
              )
            ]
        )
    );
  }
}
