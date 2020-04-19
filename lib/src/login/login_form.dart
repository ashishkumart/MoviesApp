import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/src/login/login_bloc.dart';
import 'package:movies_app/src/login/login_event.dart';
import 'package:movies_app/src/login/login_state.dart';
import 'package:movies_app/src/sign_up/sign_up_page.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  OutlineInputBorder textFieldBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: const Color(0xff01d277)));

  final formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  LoginBloc _loginBloc;

  @override
  Widget build(BuildContext context) {
    _loginBloc = BlocProvider.of<LoginBloc>(context);

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
          if (formKey.currentState.validate()) {
            _loginBloc.dispatch(LoginButtonPressed(username: "", password: ""));
          } else {
            setState(() {
              _autoValidate = true;
            });
          }
          //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Done!')));
        },
        child: Text("Login", textAlign: TextAlign.center, style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    /// Sign Up
    final signUpButton = FlatButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return new SignUpPage();
          }));
        },
        child: Text('Sign Up'));

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {},
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.fromLTRB(36, 36, 36, 10),
              child: Form(
                  autovalidate: _autoValidate,
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
                      ),
                      signUpButton,
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  )));
        },
      ),
    );
  }
}
