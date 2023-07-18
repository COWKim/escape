import 'package:flutter/material.dart';

import 'b1_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'YKD ESCAPE',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final int nowMyFloor = 0;

  void buttonControl(){
    if(nowMyFloor == 0){

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('YKD ESCAPE'),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
              decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/church.jpg'), colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)),),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 500, height: 100,
                      child: ElevatedButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              const MyB1_page())),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[800]),
                        child: Text('B1층', style: TextStyle(fontSize: 20),),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 500, height: 100,
                      child: ElevatedButton(onPressed: (){},
                        child: Text('1층', style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[700]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 500, height: 100,
                      child: ElevatedButton(onPressed: (){},
                        child: Text('2층', style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[600]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 500, height: 100,
                      child: ElevatedButton(onPressed: (){},
                        child: Text('3층', style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[500]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 500, height: 100,
                      child: ElevatedButton(onPressed: (){},
                        child: Text('4층', style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[400]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 500, height: 100,
                      child: ElevatedButton(onPressed: (){},
                        child: Text('5층', style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[300]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 500, height: 100,
                      child: ElevatedButton(onPressed: (){},
                        child: Text('6층', style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[200]),
                      ),
                    ),
                  ],
                ),
              )
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Final Code',
        child: const Icon(Icons.key,),
        backgroundColor: Colors.purple[800],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
