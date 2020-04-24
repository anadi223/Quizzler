import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp3/quiz.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[900],
        body:SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Hero(
                tag: 'logo',
                child: Icon(Icons.question_answer,
                  color: Colors.white,
                  size: 100,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              ColorizeAnimatedTextKit(text:['Quizzler'],totalRepeatCount: 3,
              speed: Duration(milliseconds: 400),
              pause: Duration(milliseconds: 100),
              colors: [Colors.purple,
                  Colors.blue,
                  Colors.red[700],
                  Colors.teal[700]],
              textStyle: TextStyle(
                fontFamily: 'Bangers',
                fontSize: 50.0,
                color: Colors.white,
              ),),
              SizedBox(height: 15.0,),
              Text('Test your knowledge skills',
              style: TextStyle(color:Colors.white,fontFamily: 'Dosis',fontSize: 12),),],),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              Center(child: Text('Made with ❤️ by anadi',style: TextStyle(color: Colors.white,),)),
              SizedBox(height:10.0),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Center(child: Text("By clicking Let's play you agree to our privacy policy",textAlign:TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 10.0),)),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),
                child: MaterialButton(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 17.0,bottom: 17.0,left: 15.0),
                  minWidth: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    "Let's Play !",
                    style: TextStyle(fontSize: 20),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Quizzler()));
                  },
                ),
              ),],),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
