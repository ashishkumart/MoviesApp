import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  OutlineInputBorder textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(color: const Color(0xff01d277)));

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    /// Username field
    final usernameField = TextFormField(
        obscureText: false,
        style: style,
        validator: (value) {
          if (value.isEmpty) return 'Please enter username';
          return null;
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Username',
          border: textFieldBorder,
        ));

    /// Password field
    final passwordField = TextFormField(
        obscureText: true,
        style: style,
        validator: (value) {
          if (value.isEmpty) return 'Please enter password';
          return null;
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Password',
          border: textFieldBorder,
        ));

    /// Login button
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01d277),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (formKey.currentState.validate())
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Done!')));
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Container(
          child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                  key: formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                        child: Image.asset(
                          'lib/assets/images/logo_dark.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 45.0),
                      usernameField,
                      SizedBox(
                        height: 45.0,
                      ),
                      passwordField,
                      SizedBox(
                        height: 45.0,
                      ),
                      loginButton,
                    ],
                  )))),
    );
  }
}
