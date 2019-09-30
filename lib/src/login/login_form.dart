import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/src/login/login_bloc.dart';
import 'package:movies_app/src/login/login_event.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  OutlineInputBorder textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(color: const Color(0xff01d277)));

  final formKey = GlobalKey<FormState>();

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
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (formKey.currentState.validate())
            BlocProvider.of<LoginBloc>(context).dispatch(LoginButtonPressed());
            //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Done!')));
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(36, 36, 36, 10),
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
      SizedBox(
        height: 10.0,
      )
      ],
    )));
  }
}
