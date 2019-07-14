import 'package:flutter/material.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'feed.dart';
import 'login.dart';


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


class SignPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return _Signpage();
  }
}

class _Signpage extends State<SignPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSIA = await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gSIA.accessToken,
      idToken: gSIA.idToken,
    );
    FirebaseUser user = await _auth.signInWithCredential(credential);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    print("Username : ${user.displayName}");
    return user;
  }

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
                  child: Text("InstaFluttergram", style: TextStyle(
                      fontFamily: 'DancingScript',
                      fontSize: 40.0,
                      color: Colors.white),),
                ),
                Container(height: 50.0,),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintStyle: TextStyle(color: Colors.white)
                  ),
                ),
                Container(height: 10.0,),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintStyle: TextStyle(color: Colors.white)
                  ),
                ),
                Container(height: 10.0,),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Email Id",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintStyle: TextStyle(color: Colors.white)
                  ),
                ),
                Container(height: 10.0,),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintStyle: TextStyle(color: Colors.white)
                  ),
                ),
                Container(height: 20.0,),
                Opacity(
                    opacity: 1.0,
                    child: RaisedButton(
                      elevation: 10.0,
                      child: Text("Signup", style: TextStyle(fontSize: 20.0),),
                      onPressed: () {
                        runApp(FeedPage());
                      },
                    )
                ),
                Container(height: 20.0,),
                Opacity(
                    opacity: 1.0,
                    child: RaisedButton(
                      elevation: 10.0,
                      child: Text("Sign in with Google", style: TextStyle(fontSize: 20.0),),
                      onPressed: () => _signIn()
                          .then((FirebaseUser user) => print(user))
                          .catchError((e) => print(e)),
                    )
                )
              ],
            )
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account?",
                  style: TextStyle(fontSize: 20.0),),
                FlatButton(
                    onPressed: () {runApp(LoginPage());},
                    child: Text("Login", style: TextStyle(fontSize: 20.0),)
                )
              ],
            )
        )

    );
  }
}