
/*
Auther: S.Ranjan Kr.
Date: 31st March, 2020
License: MIT

*/

import 'package:flutter/material.dart';
import 'package:mweather/homepage/homepage.dart';
import 'package:flutter/cupertino.dart';

class AboutPage extends StatelessWidget {
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
            textAlign: TextAlign.center,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.perm_device_information),
            color: Colors.blue,
            iconSize: 30.0,
            tooltip: 'View Licenses and Agreements',
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      backgroundColor: Color(0xffFCF4A8),
                      title: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: ListTile(
                          leading: Text(
                            'MIT License',
                            style: TextStyle(
                                color: Colors.blue,
                                fontFamily: 'Acme',
                                fontSize: 25.0),
                          ),
                          trailing: IconButton(
                              icon: Icon(Icons.close),
                              iconSize: 30.0,
                              color: Colors.blue,
                              onPressed: () => Navigator.of(context).pop()),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      content: Container(
                        color: Color(0xffFEFAD8),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        '\bLicenses & Agreements:\b\n\n"Copyright 2020 S.Ranjan kr".\n Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "mWeather "), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\nTHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontFamily: 'IndieFlower',
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  maxLines: 100,
                                  softWrap: true,
                                  textDirection: TextDirection.ltr,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        color: Color(0xffFFF7AA),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'About mWeather',
                  style: TextStyle(
                      color: Color(0xff003322),
                      fontSize: 30.0,
                      fontFamily: 'Acme'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'This \"mWeather\" App is Designed and\n develop to fulfill the requirements\n of project-II.\nServices provide in this application are:\n Weather Forecast, Live City Forecast,\n Wind Speed etc.',
                    style: TextStyle(
                        color: Color(0xff655768),
                        height: 1.5,
                        fontFamily: 'Acme',
                        fontSize: 18.0),
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Center(
              child: RaisedButton(
                autofocus: false,
                animationDuration: kThemeAnimationDuration,
                child: const Text('About Developer\'s'),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        color: Color(0xffFFF282),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(5.0),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'assets/devloper.png',
                                height: 80,
                                width: 80,
                              ),
                            ),
                            trailing: Text(
                              'Designed by: S.Ranjan kr.(IT)',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Acme',
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: Text(
                        'Credit: SISTec, Bhopal',
                        style: TextStyle(
                            color: Color(0xff0099FF),
                            fontSize: 20.0,
                            fontFamily: 'Acme'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Image.asset('assets/sistec.png',
                    height: 120.0, width: 100.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
