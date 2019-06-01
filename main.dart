import 'package:flutter/material.dart';
import 'package:flutter_app/demo.dart';
import 'package:translator/translator.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
String _ans1 = "";
String _ans2 = "";

Map _language = {
  "Chinese": "zh_CN",
  "Danish": "da",
  "Dutch": "nl_NL",
  "English": "en_US",
  "Finnish": "fi",
  "French": "fr",
  "German": "de",
  "Italian": "it",
  "Japanese": "ja",
  "Korean": "ko",
};

class MyHomePage extends StatefulWidget {
  @override
  _MyHomeStateState createState() => _MyHomeStateState();
}

class _MyHomeStateState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cursorColor: Colors.purple,
        primaryColor: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Translator'),
        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.translate, title: "Local"),
            TabData(iconData: Icons.g_translate, title: "Other")
          ],
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: () {},
          child: Icon(Icons.volume_up),
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
    String _toLanuage = 'hi';
    final translator = GoogleTranslator();
    switch (page) {
      case 0:
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _txt1,
                  decoration: InputDecoration(
                    labelText: "Text",
                    hintText: "Enter Your text",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.purple,
                    onPressed: () {
                      setState(() {
                        translator
                            .translate(_txt1.text, to: _toLanuage)
                            .then((s) => _ans1 = s);
                      });
                    },
                    child: Text(
                      "Translate",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 8,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(_ans1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      default:
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _txt2,
                  decoration: InputDecoration(
                    labelText: "Text",
                    hintText: "Enter Your text",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: _from(),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: _to(),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.purple,
                    onPressed: () {
                      setState(() {
                        _ans2 = _txt2.text;
                      });
                    },
                    child: Text(
                      "Translate",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 8,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(_ans2),
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

  List _items = List();

  getItems() {}

  Widget _from() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("From :"),
        ),
      ],
    );
  }

  Widget _to() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("To :"),
        ),
        DropdownButton(
          items: [
            DropdownMenuItem(
              child: Text("English"),
            ),
            DropdownMenuItem(
              child: Text("English"),
            ),
            DropdownMenuItem(
              child: Text("English"),
            ),
            DropdownMenuItem(
              child: Text("English"),
            ),
          ],
          onChanged: null,
          hint: Text("Select Language"),
        )
      ],
    );
  }
}
