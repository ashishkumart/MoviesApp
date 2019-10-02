import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/src/sign_up/sign_up.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpFormState();
  }
}

class _SignUpFormState extends State<SignUpForm> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  OutlineInputBorder textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(color: const Color(0xff01d277)));

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _autoValidate = false;

  SignUpBloc _signUpBloc;

  @override
  void initState() {
    super.initState();
    _signUpBloc = BlocProvider.of<SignUpBloc>(context);

    _emailController.addListener(_onFirstNameChanged);
    _emailController.addListener(_onLastNameChanged);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>();
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Form(
        autovalidate: _autoValidate,
        key: _formKey,
        child: ListView(
          children: <Widget>[
            // First Name Text Box
            TextFormField(
                obscureText: false,
                style: style,
                controller: _firstNameController,
                validator: (value) {
                  if (value.isEmpty) return 'Please enter first name';
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: 'First Name',
                  border: textFieldBorder,
                )),

            SizedBox(
              height: 20,
            ),
            // Last Name Text Box
            TextFormField(
                obscureText: false,
                style: style,
                controller: _lastNameController,
                validator: (value) {
                  if (value.isEmpty) return 'Please enter last name';
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: 'Last Name',
                  border: textFieldBorder,
                )),

            SizedBox(
              height: 20,
            ),
            // Email Text Box
            TextFormField(
                obscureText: false,
                style: style,
                controller: _emailController,
                validator: (value) {
                  if (value.isEmpty) return 'Please enter email';
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: 'Email',
                  border: textFieldBorder,
                )),
            SizedBox(
              height: 20,
            ),
            // Password Text Box
            TextFormField(
                obscureText: true,
                style: style,
                controller: _passwordController,
                validator: (value) {
                  if (value.isEmpty) return 'Please enter password';
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: 'Password',
                  border: textFieldBorder,
                )),
            SizedBox(
              height: 20,
            ),

            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Color(0xff01d277),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                  } else {
                    setState(() {
                      _autoValidate = true;
                    });
                  }
                },
                child: Text("Register",
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _onFirstNameChanged() {
    _signUpBloc
        .dispatch(FirstNameChanged(firstName: _firstNameController.text));
  }

  void _onLastNameChanged() {
    _signUpBloc.dispatch(LastNameChanged(lastName: _lastNameController.text));
  }

  void _onEmailChanged() {
    _signUpBloc.dispatch(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _signUpBloc.dispatch(PasswordChanged(password: _passwordController.text));
  }

  void _onSubmitPressed() {
    _signUpBloc.dispatch(FormSubmitted());
  }
}
