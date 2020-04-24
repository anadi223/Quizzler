import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'ABOUT',
          style: TextStyle(fontFamily: "Bangers"),
        ),
        backgroundColor: Colors.deepPurple[800],
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width - 70,

                    child: Padding(
                      padding: EdgeInsets.only(top:5.0),
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                'One of first few app i made on my journey in flutter.',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            Text(
                              'You can find the whole source code on',
                              style: kTextStyle,
                            ),
                            SizedBox(height: 10.0,),
                            GestureDetector(
                              onTap: _launchURL,
                              child: Text(
                                'https://github.com/anadi223',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15.0),
                              ),
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            Text(
                              'Made with ❤ by',
                              style: kTextStyle,
                            ),
                            Text(
                              '@anadi',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5,right: 5),
                              child: Text(
                                'A passionate learner and obssesed with flutter',textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:  EdgeInsets.only(top: 15.0),
                child: Container(
                  height: 150,
                  width: 150,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/abc.jpeg'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'http://github.com/anadi223';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

const kTextStyle = TextStyle(color: Colors.black);
