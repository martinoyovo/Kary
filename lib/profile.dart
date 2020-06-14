import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor
                ])),
              ),
              Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    icon: Icon(Icons.exit_to_app),
                    color: Colors.white,
                    onPressed: () {
                      showDialog<bool>(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              content: Text(
                                  'La suppression du compte effacera toutes vos données. Etes-vous sur de vouloir continuer ?'),
                              title: Text('Avertissement'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Oui'),
                                  onPressed: () {},
                                ),
                                FlatButton(
                                  child: Text('Non'),
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                ),
                              ],
                            );
                          });
                    },
                  )),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 85.0)
                      ]),
                      height: 80,
                      margin: EdgeInsets.only(top: 40),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey.shade100,
                        child: Text(
                          'T',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              color: Theme.of(context).accentColor,
                              fontSize: 48),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(4.0)),
                    Text(
                      'Tino',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'nunito',
                          fontSize: 19),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.all(4),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '+228 96214235 /',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'ID:',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          UserInfo(),
        ],
      ),
    ));
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Partager l\'application'),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Nous contacter'),
          ),
          ListTile(
            leading: Icon(Icons.alternate_email),
            title: Text('Suivez-nous'),
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Politique de confidentialité'),
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Supprimer le compte'),
            ),
            onTap: () {
              showDialog<bool>(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      content: Text(
                          'La suppression du compte effacera toutes vos données. Etes-vous sur de vouloir continuer ?'),
                      title: Text('Avertissement'),
                      actions: <Widget>[
                        FlatButton(
                          child:
                              Text('Oui', style: TextStyle(color: Colors.pink)),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child:
                              Text('Non', style: TextStyle(color: Colors.pink)),
                          onPressed: () => Navigator.pop(context, false),
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
