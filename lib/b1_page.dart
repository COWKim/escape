import 'package:escape/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyB1_page());
}

class MyB1_page extends StatelessWidget {
  const MyB1_page({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YKD ESCAPE',
      theme: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          fontSizeDelta: 4,
        )
      ),
      home: B1_page(title: 'B1층'),
    );
  }
}

class B1_page extends StatefulWidget {
  const B1_page({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<B1_page> createState() => _B1_pageState();
}

class _B1_pageState extends State<B1_page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text(widget.title),
        leading: IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                const MyApp())),
          icon: const Icon(Icons.arrow_back),),
        centerTitle: true,
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(
                  image: AssetImage('assets/b1_sogroup.jpg'),
                  color: Colors.black38,
                  colorBlendMode: BlendMode.darken,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('먼저 이곳으로 가보자',),
                      Text('이곳은 성도들의 모임을 위한 장소 같아'),
                      Text('이곳을 사용하려면 기준을 준수해야하는데..'),
                      ],
                    ),
                  )
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 5)),
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(20),
                  child: Text('어떤 기준이 있을까?'),
                ),
                Container(
                  child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[300]),
                    child: Text('B1층', style: TextStyle(fontSize: 20),),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 500, height: 100,
                  child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[300]),
                    child: Text('1층', style: TextStyle(fontSize: 20),),
                  ),
                ),
              ],
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Final Code',
        child: const Icon(Icons.key,),
        backgroundColor: Colors.purple[300],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
