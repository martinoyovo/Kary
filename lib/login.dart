import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp/flutter_otp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controller = TextEditingController();
  String _phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (val) {
                _phone = val;
              },
              decoration: InputDecoration(hintText: 'Numéro de téléphone'),
            ),
            RaisedButton(
              child: Text('ENVOYER'),
              onPressed: () {
                FlutterOtp().sendOtp(_phone);
              },
            )
          ],
        ),
      ),
    );
  }
}
