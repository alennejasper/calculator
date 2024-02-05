import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: "Flutter Demo",
            
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
            
                useMaterial3: true,
            ),
      
            home: const MyHomePage(title: "Simple Flutter App"),
        );
    }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the value  (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController txtFname = TextEditingController();
  TextEditingController txtLname = TextEditingController();

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  void _minusCounter() {
    setState(() {
      _counter--;
    });
  }

  double result = 0;
  void _add(){
    setState(() {
      result = double.parse(txtFname.text) + double.parse(txtLname.text);
    });
  }

  void _minus(){
    setState(() {
      result = double.parse(txtFname.text) - double.parse(txtLname.text);
    });
  }

  void _divide(){
    setState(() {
      result = double.parse(txtFname.text) / double.parse(txtLname.text);
    });
  }

  void _multiply(){
    setState(() {
      result = double.parse(txtFname.text) * double.parse(txtLname.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: TextField(
                controller: txtFname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter First Number",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: TextField(
                controller: txtLname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Last Number",
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Positioned(
                    bottom: 75,
                    child: FloatingActionButton(
                      onPressed: (){
                        _add();
                        Fluttertoast.showToast(
                            msg: "The Answer is: $result",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      },
                      tooltip: "Addition",
                      child: const Icon(Icons.add),
                    )),
                Positioned(
                    bottom: 0,
                    child: FloatingActionButton(
                      onPressed: (){
                        _minus();
                        Fluttertoast.showToast(
                            msg: "The Answer is: $result",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      },
                      tooltip: "Subtract",
                      child: const Icon(Icons.remove),
                    )),
                Positioned(
                    bottom: 75,
                    right: 75,
                    child: FloatingActionButton(
                      onPressed: (){
                        _divide();
                        Fluttertoast.showToast(
                            msg: "The Answer is: $result",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      },
                      tooltip: "Divide",
                      child: const Icon(CupertinoIcons.divide),
                    )),
                Positioned(
                    bottom: 0,
                    right: 75,
                    child: FloatingActionButton(
                      onPressed: (){
                        _multiply();
                        Fluttertoast.showToast(
                            msg: "The Answer is: $result",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      },
                      tooltip: "Multiply",
                      child: const Icon(CupertinoIcons.multiply),
                    )),
              ]
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}