import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: "pacifico"),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          child: LoginPage(),
        )));
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pagestate = 0;
  double _headingTop = 80;
  var _background = Colors.white;
  var _headingcolor = Color(0xff2C0C49);
  double windowWidth = 0;
  double windowHeight = 0;
  double _loginoffset = 0;
  double _registerYoffset = 0;
  double _loginxoffset = 0;
  double _loginopacity = 1;
  double _loginwidth = 0;

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    switch (_pagestate) {
      case 0:
        _loginopacity = 1;
        _background = Colors.white;
        _headingcolor = Color(0xff2C0C49);
        _loginoffset = windowHeight;
        _loginwidth = windowWidth;
        _loginxoffset = 0;
        _headingTop = 80;
        _registerYoffset = windowHeight;
        break;
      case 1:
        _headingTop = 90;
        _loginoffset = 0;
        _loginopacity = 1;
        _loginwidth = windowWidth;
        _background = Colors.blueGrey;
        _headingcolor = Colors.black;
        _registerYoffset = windowHeight;
        _loginoffset = 270;
        break;
      case 2:
        _headingTop = 80;
        _loginopacity = 0.7;
        _background = Colors.blueGrey;
        _headingcolor = Colors.black;
        _loginwidth = windowWidth - 40;
        _loginoffset = 240;
        _registerYoffset = 270;
        _loginxoffset = 20;

        break;
    }
    return Stack(children: <Widget>[
      //containers stacked upon each other
      AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 1000),
        color: _background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _pagestate = 0;
                });
              },
              child: AnimatedContainer(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: Duration(milliseconds: 1000),
                  padding: EdgeInsets.only(top: 30),
                  margin: EdgeInsets.all(_headingTop),
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 0),
                          child: Text("Each One - Vaccinate One,",
                              style: TextStyle(
                                  color: _headingcolor, fontSize: 16))),
                      Text("Each One - Treat One,",
                          style: TextStyle(color: _headingcolor, fontSize: 16)),
                      Text("Each One - Save One",
                          style: TextStyle(color: _headingcolor, fontSize: 16)),
                    ],
                  )),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.all(5),
              child: Center(
                child: Image.asset('images/vaccine.png'),
              ),
            ),
            Container(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_pagestate != 0)
                      _pagestate = 0;
                    else
                      _pagestate = 1;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xff2C0C49),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    'Hola! Let\'s get started!!!',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, fontFamily: 'serif'),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            _pagestate = 2;
          });
        },
        child: AnimatedContainer(
          padding: EdgeInsets.all(20),
          width: _loginwidth,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(_loginxoffset, _loginoffset, 1),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent.withOpacity(_loginopacity),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: <Widget>[PrimaryButton("Login"),_OutlineBtn("Create Account")],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            _pagestate = 0;
          });
        },
        child: AnimatedContainer(
          padding: EdgeInsets.all(20),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _registerYoffset, 1),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(children: <Widget>[PrimaryButton("Create Account "),
            ]),

          // borderRadius: new BorderRadius.only(
          //   topLeft: BorderRadius.circular(25),
          //   top: BorderRadius.circular(25)
          // )
        ),
      ),
    ]);
  }
}

class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton(this.btnText);
  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color(0xff2C0C49), borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Text(
          widget.btnText,
          style:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'serif'),
        ),
      ),
    );
  }
}

class _OutlineBtn extends StatefulWidget {
  final String btnText;
  _OutlineBtn(this.btnText);
  @override
  __OutlineBtnState createState() => __OutlineBtnState();
}

class __OutlineBtnState extends State<_OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
         border: Border.all(
    color: Color(0xFFB40284A)
    ),
          color: Color(0xff2C0C49), borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Text(
          widget.btnText,
          style:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'serif'),
        ),
      ),
    );
  }
}
