import 'package:flutter/material.dart';
import 'feed.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Signup Page",
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.light,
      ),
      home: SignPage(),
    );
  }
}

class SignPage extends StatelessWidget{
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
                      hintText: "Name",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      hintStyle: TextStyle(color: Colors.white)
                  ),
                ),
                Container(height: 10.0,),
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Email Id",
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
                      child: Text("Signup", style: TextStyle(fontSize: 20.0),),
                      onPressed: (){runApp(FrontPage());},
                    )
                )
              ],
            )
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account?", style: TextStyle(fontSize: 20.0),),
                FlatButton(
                    onPressed: () {},
                    child: Text("Login", style: TextStyle(fontSize: 20.0),)
                )
              ],
            )
        )

    );
  }
}