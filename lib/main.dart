import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'b1_page.dart';
import 'f1_page.dart';
import 'f2_page.dart';
import 'f3_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YKD ESCAPE',
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.1),
          child: child!,
        );
      },
      home: MyHomePage(),
    );
  }
}

late int RESET_FLOOR;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late Future<int> _playerFloor;
  late Future<int> _b1step;
  late Future<int> _f1step;
  late Future<int> _f2step;
  late Future<int> _f3step;
  late Future<int> _f4step;
  late Future<int> _f5step;
  late Future<int> _f6step;

  int checkFloor = 0; // 현재 층 확인

  late int b1step;
  late int f1step;
  late int f2step;
  late int f3step;
  late int f4step;
  late int f5step;
  late int f6step;

  Future<void> _checkFloor() async{
    final SharedPreferences prefs = await _prefs;
    final int playerFloor = (prefs.getInt('floor') ?? 0) + 1;

    setState(() {
      _playerFloor = prefs.setInt('floor', playerFloor).then((bool success)
      { return playerFloor;});
    });
  }

  Future<void> _resetFloor() async{
    RESET_FLOOR++;
    if(RESET_FLOOR == 10){
      RESET_FLOOR = 0;

      final SharedPreferences prefs = await _prefs;
      const int playerFloor = 0;

      setState(() {
        prefs.remove('b1step');
        prefs.remove('f1step');
        prefs.remove('f2step');
        prefs.remove('f3step');
        prefs.remove('f4step');
        prefs.remove('f5step');
        prefs.remove('f6step');
        _playerFloor = prefs.setInt('floor', playerFloor).then((bool success)
        { return playerFloor;});

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('RESET'),
            duration: Duration(seconds: 1),
          ),
        );
      });
    }
  }

  Future<void> getData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    b1step = (prefs.getInt('b1step') ?? 1);
    f1step = (prefs.getInt('f1step') ?? 1);
    f2step = (prefs.getInt('f2step') ?? 1);
    f3step = (prefs.getInt('f3step') ?? 1);
    f4step = (prefs.getInt('f4step') ?? 1);
    f5step = (prefs.getInt('f5step') ?? 1);
    f6step = (prefs.getInt('f6step') ?? 1);

    setState(() {
      _b1step = prefs.setInt('b1step', b1step).then((bool success)
      { return b1step;});
      _f1step = prefs.setInt('f1step', f1step).then((bool success)
      { return f1step;});
      _f2step = prefs.setInt('f2step', f2step).then((bool success)
      { return f2step;});
      _f3step = prefs.setInt('f3step', f3step).then((bool success)
      { return f3step;});
      _f4step = prefs.setInt('f4step', f4step).then((bool success)
      { return f4step;});
      _f5step = prefs.setInt('f5step', f5step).then((bool success)
      { return f5step;});
      _f6step = prefs.setInt('f6step', f6step).then((bool success)
      { return f6step;});
    });

  }

  Future<void> checkData() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      checkFloor = pref.getInt('floor')!;

    });
  }

  @override
  void initState() {
    super.initState();
    RESET_FLOOR = 0;
    _playerFloor = _prefs.then((SharedPreferences prefs) => prefs.getInt('floor') ?? 0);
    _b1step = _prefs.then((SharedPreferences prefs) => prefs.getInt('b1step') ?? 1);
    _f1step = _prefs.then((SharedPreferences prefs) => prefs.getInt('f1step') ?? 1);
    _f2step = _prefs.then((SharedPreferences prefs) => prefs.getInt('f2step') ?? 1);
    _f3step = _prefs.then((SharedPreferences prefs) => prefs.getInt('f3step') ?? 1);
    _f4step = _prefs.then((SharedPreferences prefs) => prefs.getInt('f4step') ?? 1);
    _f5step = _prefs.then((SharedPreferences prefs) => prefs.getInt('f5step') ?? 1);
    _f6step = _prefs.then((SharedPreferences prefs) => prefs.getInt('f6step') ?? 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextButton(onPressed: (){_resetFloor();}, child: Text('YKD ESCAPE', style: TextStyle(fontSize: 20, color: Colors.white),),),
        leading: FutureBuilder(
            future: _playerFloor,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              else {
                checkData();
                return Center(child: Text(
                  '${snapshot.data == 0 ?'B1' : snapshot.data}층', style: TextStyle(fontSize: 16),)
                );
              }
            }),
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
                      child: ElevatedButton(onPressed: (){ getData();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              MyB1_page(route: b1step.toString())));},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[800]),
                        child: Text('B1층', style: TextStyle(fontSize: 20),),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 500, height: 100,
                      child: ElevatedButton(onPressed: checkFloor < 1 ? null : (){ getData();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            F1_page(route: f1step.toString(),)));},
                        child: Text('1층', style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[700]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 500, height: 100,
                      child: ElevatedButton(onPressed: checkFloor < 2 ? null : (){ getData();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            F2_page(route: f2step.toString())));},
                        child: Text('2층', style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[600]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 500, height: 100,
                      child: ElevatedButton(onPressed: checkFloor < 3 ? null :  (){ getData();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                          F3_page(route: f3step.toString())));},
                        child: Text('3층', style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[500]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 500, height: 100,
                      child: ElevatedButton(onPressed: checkFloor < 4 ? null : (){},
                        child: Text('4층', style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[400]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 500, height: 100,
                      child: ElevatedButton(onPressed: checkFloor < 5 ? null : (){},
                        child: Text('5층', style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[300]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 500, height: 100,
                      child: ElevatedButton(onPressed: checkFloor < 6 ? null : (){},
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
        onPressed: (){ _test();},
        tooltip: 'Final Code',
        child: const Icon(Icons.key,),
        backgroundColor: Colors.purple[800],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _test() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _playerFloor = prefs.setInt('floor', 6).then((bool success)
      { return 6;});
    });
  }
}
