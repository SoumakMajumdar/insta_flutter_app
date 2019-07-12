import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Feed",
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.light,
      ),
      home: Bar(),
    );
  }
}


class Bar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
            onPressed: null, 
            child: Image.asset("assets/images/camera.png")
        ),
        title: Text("InstaFluttergram", style: TextStyle(fontFamily: 'DancingScript', fontSize: 25.0),),
        actions: <Widget>[
          FlatButton(
            onPressed: (){},
            child: Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Image.asset("assets/images/dm.png"),
            ),
          ),
        ],
      ),

      body: FeedList(),

      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(icon: Icon(Icons.home), onPressed: (){}),
              IconButton(icon: Icon(Icons.search), onPressed: (){}),
              IconButton(icon: Icon(Icons.add_circle_outline), onPressed: (){}),
              IconButton(icon: Icon(Icons.favorite_border), onPressed: (){}),
              IconButton(icon: Icon(Icons.account_circle), onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}


class FeedList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _Feedlist();
  }
}

class _Feedlist extends State<FeedList>{

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                getStory(),
              ],
            )
          ],
        ),
      ],
    );
  }

  getStory() {

  }
}




