import "package:flutter/cupertino.dart";

import "package:flutter/material.dart";

import "package:fluttertoast/fluttertoast.dart";

void main(){
    runApp(const MyApp());
}

class MyApp extends StatelessWidget{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context){
        return MaterialApp(
            title: "Calculator",
            
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
            
                useMaterial3: true,
            ),
      
            home: const MyHomePage(title: "Calculator"),
        );
    }
}

class MyHomePage extends StatefulWidget{
    const MyHomePage({super.key, required this.title});

    final String title;

    @override
    State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    TextEditingController txtFnumber = TextEditingController();
  
    TextEditingController txtLnumber = TextEditingController();

    double result = 0;
  
    void _add(){
        setState((){
            result = double.parse(txtFnumber.text) + double.parse(txtLnumber.text);
        });
    }

    void _subtract(){
        setState((){
            result = double.parse(txtFnumber.text) - double.parse(txtLnumber.text);
        });
    }

    void _divide(){
        setState((){
            result = double.parse(txtFnumber.text) / double.parse(txtLnumber.text);
        });
    }

    void _multiply(){
        setState((){
            result = double.parse(txtFnumber.text) * double.parse(txtLnumber.text);
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    
                title: Text(widget.title),
            ),
            
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                            
                            child: TextField(
                            
                                controller: txtFnumber,
                
                                decoration: const InputDecoration( 
                                    border: OutlineInputBorder(),
                
                                    hintText: "Enter your first number.",
                                ),
                            ),
                        ),

                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                            
                            child: TextField(
                                controller: txtLnumber,
                                
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),

                                    hintText: "Enter your last number.",
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
                                        msg: "The answer is: $result.",
                                        
                                        toastLength: Toast.LENGTH_SHORT,
                                        
                                        gravity: ToastGravity.CENTER,
                                        
                                        timeInSecForIosWeb: 5,
                                        
                                        backgroundColor: Colors.lightGreen,
                                        
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
                                    _subtract();
                                    
                                    Fluttertoast.showToast(
                                        msg: "The answer is: $result.",
                                    
                                        toastLength: Toast.LENGTH_SHORT,
                                    
                                        gravity: ToastGravity.CENTER,
                                    
                                        timeInSecForIosWeb: 5,
                                    
                                        backgroundColor: Colors.lightGreen,
                                    
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
                                        msg: "The answer is: $result.",
                                    
                                        toastLength: Toast.LENGTH_SHORT,
                                    
                                        gravity: ToastGravity.CENTER,
                                    
                                        timeInSecForIosWeb: 5,
                                    
                                        backgroundColor: Colors.lightGreenAccent,
                                    
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
                                        msg: "The answer is: $result.",
                                        
                                        toastLength: Toast.LENGTH_SHORT,
                                        
                                        gravity: ToastGravity.CENTER,
                                        
                                        timeInSecForIosWeb: 5,
                                        
                                        backgroundColor: Colors.lightGreen,
                                        
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