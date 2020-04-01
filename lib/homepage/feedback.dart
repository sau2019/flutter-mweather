/*
Auther: S.Ranjan Kr.
Date: 31st March,2020
License: MIT

*/

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mweather/homepage/homepage.dart';
import 'package:http/http.dart' as http;

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
 final _scaffoldresKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String name;
  String email;
  String message;
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldresKey,
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
                  validator: (value) => value.isEmpty ? 'Enter your name.' : null,
                  onChanged: (value) {
                    setState(
                      () => name = value,
                    );
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: inputDecoration.copyWith(hintText: 'Email ID'),
                  validator: (value) =>
                      value.isEmpty ? 'Enter your email id.' : null,
                  onChanged: (value) {
                    setState(
                      () => email = value,
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
                  validator: (value) => value.isEmpty ? 'Type your message.' : null,
                  onChanged: (value) {
                    setState(
                      () => message = value,
                    );
                  },
                ),
                SizedBox(
                  height: 50.0,
                ),
                RaisedButton(
                  onPressed: () {
                  
                    insertFeedback(name, email, message);

                    setState(() {
                      flag = true;
                    });
                  

                    
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
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: !flag
                        ? Text('')
                        : SpinKitCircle(color: Colors.blue, size: 40),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static const ROOT = 'http://192.168.225.44/mweather/index.php';
  static const _ADD_FEEDBACK = 'ADD_FEEDBACK';

  Future<String> insertFeedback(
      String names, String emails, String messages) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_FEEDBACK;
      map['names'] = names;
      map['emails'] = emails;
      map['messages'] = messages;
      print(names);
      print(emails);
      print(messages);
      final response = await http.post(ROOT, body: map);
      print('Feedback Response: ${response.body}');
      if (200 == response.statusCode) {
       
        setState(() {
          Future.delayed(Duration(seconds: 1)).then((_) => _displayresSnackbar);
          flag = false;
          name='';
          email='';
          message='';
        });
        print("200 success result");

        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
  void get _displayresSnackbar {
    _scaffoldresKey.currentState.showSnackBar(SnackBar(
      backgroundColor: Color(0xffFFEB3B),
      elevation: 0.5,
      duration: Duration(seconds: 1),
      content: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Thanks for giving Feedback.',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 18.0,
            fontFamily: 'IndieFlower',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ));
  }
}
