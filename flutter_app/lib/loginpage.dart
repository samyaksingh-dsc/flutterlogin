import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(hintText: 'Email'),
                  onChanged: (value){
                    setState(() {
                      _email = value;
                    });
                  }
              ),
              SizedBox(height: 15.0,),
              TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                  onChanged: (value){
                    setState(() {
                      _password = value;
                    });
                  }
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                child: Text('Login'),
                color: Colors.orange,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _email,
                      password: _password
                  ).then((FirebaseUser user) {
                    Navigator.of(context).pushReplacementNamed('homepage');
                  } )
                      .catchError((e){
                    print(e);
                  });
                },
              ),
              RaisedButton(
                child: Text('Login with Google'),
                color: Colors.orange,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () { authService.googleSignIn().then((user){Navigator.of(context).pushReplacementNamed('/homepage');});
                }
              ),
              SizedBox(height: 15.0),
              Text('Don\'t have an account?'),
              SizedBox(height: 10.0),
              RaisedButton(
                child: Text('Sign Up'),
                color: Colors.orange,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  Navigator.of(context).pushNamed('/signup');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}