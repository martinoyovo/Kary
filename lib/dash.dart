import 'package:carry/acceuil.dart';
import 'package:carry/command/depart_location.dart';
import 'package:carry/historique.dart';
import 'package:carry/location_search.dart';
import 'package:carry/login.dart';
import 'package:carry/profile.dart';
import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  @override
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Login(),
    Departure(),
    //LocationSearch(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              IcoFontIcons.search,
            ),
            title: Text('Acceuil', style: TextStyle(letterSpacing: 1.2)),
          ),
          BottomNavigationBarItem(
            icon: Icon(IcoFontIcons.filesStack),
            title: Text('Commandes', style: TextStyle(letterSpacing: 1.2)),
          ),
          BottomNavigationBarItem(
            icon: Icon(IcoFontIcons.user),
            title: Text('Mon compte', style: TextStyle(letterSpacing: 1.2)),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
