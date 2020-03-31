/*
Auther: S.Ranjan Kr.
Date: 31st March,2020
License: MIT

*/

import 'package:flutter/material.dart';
import 'package:mweather/homepage/homepage.dart';

var inputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2.0),
    borderRadius: BorderRadius.circular(10.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2.0),
    borderRadius: BorderRadius.circular(20.0),
  ),
);
var messageDecoration = InputDecoration(
  isDense: true,
  hintMaxLines: 50,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.grey, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2.0),
    borderRadius: BorderRadius.circular(20.0),
  ),
);

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String email;
  String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 30.0,
          tooltip: 'Back to HomePage',
          color: Colors.blue,
          onPressed: () {
            Navigator.pop(context,
                new MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        backgroundColor: Colors.yellow,
        title: Center(
          child: Text(
            'mWeather',
            style: TextStyle(
                color: Colors.black, fontSize: 25.0, fontFamily: 'Acme'),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color(0xffFFF7AA),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Form(
            child: Column(
              key: _formKey,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    'Feedback Form',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20.0,
                      fontFamily: 'Acme',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: inputDecoration.copyWith(hintText: 'Name'),
                  validator: (val) => val.isEmpty ? 'Enter your name.' : null,
                  onChanged: (val) {
                    setState(
                      () => name = val,
                    );
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: inputDecoration.copyWith(hintText: 'Email ID'),
                  validator: (val) =>
                      val.isEmpty ? 'Enter your email id.' : null,
                  onChanged: (val) {
                    setState(
                      () => email = val,
                    );
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: messageDecoration.copyWith(hintText: 'Message'),
                  validator: (val) => val==null ? 'Type your message.' : null,
                  onChanged: (val) {
                    setState(
                      () => message = val,
                    );
                  },
                ),
                SizedBox(
                  height: 50.0,
                ),
                RaisedButton(
                  onPressed: () async { 
                    _formKey.currentState.validate();
                    print(email);
                    print(name);
                    print(message);
                  },
                  hoverColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.white)),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                  child: Text('Submit',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontFamily: 'Acme',
                          letterSpacing: 1.0)),
                  color: Colors.yellowAccent,
                  elevation: 2.0,
                  focusColor: Colors.yellow,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
