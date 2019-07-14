import 'package:flutter/material.dart';
import 'feed.dart';
import 'signup.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Signup Page",
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.light,
      ),
      home: LogPage(),
    );
  }
}



class LogPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _Logpage();
  }
}


class _Logpage extends State<LogPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink,
        body: Container(
            alignment: AlignmentDirectional.centerStart,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                Center(
                  child: Text("InstaFluttergram", style: TextStyle(fontFamily: 'DancingScript', fontSize: 40.0, color: Colors.white),),
                ),
                Container(height: 50.0,),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      hintStyle: TextStyle(color: Colors.white)
                  ),
                ),
                Container(height: 10.0,),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      hintStyle: TextStyle(color: Colors.white)
                  ),
                ),
                Container(height: 20.0,),
                Opacity(
                    opacity: 1.0,
                    child: RaisedButton(
                      elevation: 10.0,
                      child: Text("Login", style: TextStyle(fontSize: 20.0),),
                      onPressed: (){runApp(FeedPage());},
                    )
                )
              ],
            )
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Didn't have an account?", style: TextStyle(fontSize: 20.0),),
                FlatButton(
                    onPressed: () {
                      runApp(SignupPage());
                    },
                    child: Text("Signup", style: TextStyle(fontSize: 20.0),)
                )
              ],
            )
        )

    );
  }
}