import 'package:flutter/material.dart';
import 'package:flutter_app/demo.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/Demo': (BuildContext context) => new Demo(),
      },
    );
  }
}

TextEditingController _txt1 = TextEditingController();
TextEditingController _txt2 = TextEditingController();
int position = 0;
int currentPage = 0;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomeStateState createState() => _MyHomeStateState();
}

class _MyHomeStateState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Text Translator'),
        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.search, title: "Search"),
            TabData(iconData: Icons.shopping_cart, title: "Basket")
          ],
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: _getPage(currentPage),
          ),
        ),
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _txt2,
                decoration:
                InputDecoration(labelText: "Text", hintText: "Enter Your text"),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("Submit"),
              ),
            ],
          ),
        );
      case 1:
        return Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _txt1,
                decoration:
                InputDecoration(labelText: "Text", hintText: "Enter Your text"),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("Submit"),
              ),
            ],
          ),
        );
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the basket page"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme
                  .of(context)
                  .primaryColor,
              onPressed: () {},
            )
          ],
        );
    }
  }
}
