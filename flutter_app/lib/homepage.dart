import 'package:flutter/material.dart';
import 'auth.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text('You are now logged in'),
              SizedBox(height: 15.0,
              ),
              RaisedButton(
                  onPressed: () {
                    authService.SignOut();
                    {Navigator.of(context).pushReplacementNamed('/landingpage');}
                  },
                child: Text('Log Out'),
              )
            ],
          ),
        ),
      ),
    );
  }
}