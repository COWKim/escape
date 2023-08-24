//import 'dart:ffi';
//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'b1_page.dart';
import 'f1_page.dart';
import 'f2_page.dart';
import 'f3_page.dart';
import 'f4_page.dart';
import 'f5_page.dart';
import 'f6_page.dart';
import 'hint_page.dart';

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
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.2),
          child: child!,
        );
      },
      home: Login_page(),
      //home: MyHomePage(),
    );
  }
}

String NAME = "";

class Login_page extends StatefulWidget {
  Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {

  void loginCheck(){
    if(playerPW == 'salt' && playerID != ""){
      _setStartFloor(_startFloor);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Story_page()));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('잘못 입력하셨습니다.'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStartFloor;
  late Future<String> _playerID;

  Future<void> _setStartFloor(int floor) async{
    final SharedPreferences prefs = await _prefs;
    int preFloor = prefs.getInt('start') ?? 10;

    if(preFloor != 10){
      if(floor != preFloor){
        floor = preFloor;
      }
    }

    setState(() {
      NAME = playerID;
      checkStartFloor = floor;
      _playerID = prefs.setString('ID', playerID).then((bool success)
      { return playerID;});
      _playerStartFloor = prefs.setInt('start', floor).then((bool success)
      { return floor;});
    });
  }

  Future<void> _autoLogin() async{
    final SharedPreferences prefs = await _prefs;
    String id = prefs.getString('ID') ?? '';

    setState(() {
      if(id != ''){
        checkStartFloor = prefs.getInt('start') ?? 0;
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
      }
    });
  }

  String playerID = "";
  String playerPW = "";

  String _selectedValue = 'B1층';
  int _startFloor = 0;
  final List floorList = ["B1층", "1층", "2층"];

  @override
  void initState() {
    super.initState();
    _playerStartFloor = _prefs.then((SharedPreferences prefs) => prefs.getInt('start') ?? 0);
    _playerID = _prefs.then((SharedPreferences prefs) => prefs.getString('ID') ?? '');
    _autoLogin();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1000,
        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/login.png'), colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)),),
        child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 500,
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(30),
                    child: const Text('YKD ESCAPE',
                      style: TextStyle(
                        fontSize: 35,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,),
                  ),
                  SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                maxLength: 5,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.black,
                                    counterText: '',
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                                    ),
                                    label: Text('이름'),
                                    labelStyle: TextStyle(color: Colors.white)),
                                onChanged: (text){playerID = text;},
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                maxLength: 5,
                                textAlign: TextAlign.center,
                                obscureText: true,
                                style: TextStyle(color: Colors.white),
                                decoration: const InputDecoration(filled: true,
                                    fillColor: Colors.black,
                                    counterText: '',
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                                    ),
                                    labelText: '입장코드',
                                    labelStyle: TextStyle(color: Colors.white)),
                                onChanged: (text){playerPW = text;},
                              )
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                                width: 280,
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  dropdownColor: Colors.black,
                                  decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                                        borderRadius: BorderRadius.all(Radius.circular(20.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                                      ),
                                      filled: true,
                                      fillColor: Colors.black),
                                  value: _selectedValue,
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white,),
                                  items:
                                  floorList.map((value) {
                                    return DropdownMenuItem(
                                        value: value,
                                        child: Center(
                                          child: Text(value),
                                        )
                                    );
                                  }).toList(),
                                  onChanged: (value){
                                    setState(() {
                                      _selectedValue = value.toString();
                                      _startFloor = floorList.indexOf(_selectedValue);
                                    });
                                  },
                                )
                            ),
                          ),
                        ],
                      )
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                    width: 300, height: 100,
                    child: ElevatedButton(onPressed: (){loginCheck();},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[800]),
                      child: Text('확인'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 50, 10, 100),
                    child: Text('Produced by Poszer Kim', style: TextStyle(color: Colors.white70),),
                  )
                ],
              ),
            )
        ),
      )
    );
  }
}

class Story_page extends StatefulWidget {
  Story_page({super.key});

  @override
  State<Story_page> createState() => _Story_pageState();
}

class _Story_pageState extends State<Story_page> {

  void gameStart(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  void initState() {
    super.initState();
  }

  final TextStyle _textWhite = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: 1000,
          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/login.png'), colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)),),
          child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10,100,20,100),
                          child: Column(
                              children: [
                                Text('안녕?', style: _textWhite),
                                Text(''),
                                Text(''),
                                Text(''),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('창동염광교회', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                                      Text('에 온 걸 환영해!', style: _textWhite),]),
                              ]
                          ),
                        )
                     ),
                     Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10,100,20,100),
                          child: Column(
                              children: [
                                Text('너희들은 우리 교회에', style: _textWhite),
                                Text('언제부터 다니게 되었어?', style: _textWhite),
                                Text(''),Text(''),Text(''),Text(''),Text(''),
                                Text('교회를 다닌지', style: _textWhite),
                                Text('얼마 안된 친구들도 있을테고', style: _textWhite),
                                Text('교회를 아주 오오오오래', style: _textWhite),
                                Text('다닌 친구들도 있을테지.', style: _textWhite),
                                Text(''),Text(''),Text(''),Text(''),Text(''),
                                Text('그런데', style: TextStyle(color: Colors.purpleAccent)),
                                Text('우리 교회에', style: _textWhite),
                                Text('어떤 공간들이 있는지', style: _textWhite),
                                Text('다 알고 있어?', style: _textWhite),
                                Text(''), Text(''),Text(''),Text(''),Text(''),
                                Text('아마도', style: _textWhite),
                                Text('잘 모르는 공간들도', style: _textWhite),
                                Text('많이 있을거라고 생각해.', style: _textWhite),
                                Text(''), Text(''),Text(''),Text(''),Text(''),
                                Text('그래서', style: _textWhite),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('창동염광교회', style: TextStyle(color: Colors.yellow)),
                                      Text('를', style: _textWhite),]),
                                Text('엄마 뱃속에서부터 다녔던', style: _textWhite),
                                Text(''),
                                Text('바로 내가!', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                                Text(''),
                                Text('너희들에게 이곳저곳을', style: _textWhite),
                                Text('돌아다니며 알려줄게!', style: _textWhite),
                                Text(''),Text(''),Text(''),Text(''),Text(''),
                                Text('곳곳에 많은 문제들이 있으니', style: _textWhite),
                                Text('너희들이 차근차근 풀어내며', style: _textWhite),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('잘 따라올 거라고 ', style: _textWhite),
                                      Text('믿어!', style: TextStyle(color: Colors.yellow)),]),
                                Text(''), Text(''),Text(''),Text(''),Text(''),
                                Text('그리고', style: _textWhite),
                                Text('내가 전하고 싶은', style: _textWhite),
                                Text(''),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('신앙의 메세지', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                                      Text('를', style: _textWhite),]),
                                Text(''),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('꼭 ', style: TextStyle(color: Colors.yellow)),
                                      Text('들려주고 싶어.', style: _textWhite),]),
                                Text(''), Text(''),Text(''),Text(''),Text(''),
                                Text('그러니까', style: _textWhite),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('끝까지 ', style: _textWhite),
                                      Text('성공', style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold)),
                                      Text('하는거야!!', style: _textWhite),]),

                              ]
                          ),
                        )
                    ),
                    const Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10,150,20,70),
                          child: Column(
                              children: [
                                Text('그럼 출발해볼까?', style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold)),
                              ]
                          ),
                        )
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                      width: 300, height: 100,
                      child: ElevatedButton(onPressed: (){gameStart();},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[800]),
                        child: Text('출발'),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                    //   child: Text('Produced by Poszer Kim', style: TextStyle(color: Colors.white),),
                    // )
                  ],
                ),
              )
          ),
        )
    );
  }
}

late int RESET_FLOOR;
late int checkStartFloor; // 시작 층

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late Future<int> _playerFloor;
  late Future<int> _startFloor;
  late Future<int> _b1step;
  late Future<int> _f1step;
  late Future<int> _f2step;
  late Future<int> _f3step;
  late Future<int> _f4step;
  late Future<int> _f5step;
  late Future<int> _f6step;
  late Future<int> _hintCount;

  int checkFloor = 0; // 현재 층 확인
  String txtHint = '';

  late int b1step; // b1층 단계
  late int f1step;
  late int f2step;
  late int f3step;
  late int f4step;
  late int f5step;
  late int f6step;

  bool b1open = false;   // 시작층에 따른 T / F 체크용
  bool f1open = false;
  bool f2open = false;

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
    if(RESET_FLOOR == 5){
      RESET_FLOOR = 0;

      final SharedPreferences prefs = await _prefs;
      const int playerFloor = 0;

      setState(() {
        prefs.remove('floor');
        prefs.remove('b1step');
        prefs.remove('f1step');
        prefs.remove('f2step');
        prefs.remove('f3step');
        prefs.remove('f4step');
        prefs.remove('f5step');
        prefs.remove('f6step');
        prefs.remove('start');
        prefs.remove('ID');
        prefs.remove('hint');
        b1open = f1open = f2open = false;
        //_playerFloor = prefs.setInt('floor', playerFloor).then((bool success)
        //{ return playerFloor;});

        Navigator.push(context, MaterialPageRoute(builder: (context) => Login_page()));

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
      checkFloor = pref.getInt('floor') ?? 0;
      checkStartFloor = pref.getInt('start') ?? 0;
    });
  }

  Future<void> naviFloor() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    checkStartFloor = pref.getInt('start') ?? 0;

    int stepB1 = pref.getInt('b1step') ?? 1;
    int stepF1 = pref.getInt('f1step') ?? 1;
    int stepF2 = pref.getInt('f2step') ?? 1;

    setState(() {
      if(stepF2 == 6 || checkStartFloor == 0){
        b1open = true;
      }

      if(stepB1 == 5 || checkStartFloor == 1){
        f1open = true;
      }

      if(stepF1 == 6 || checkStartFloor == 2){
        f2open = true;
      }

    });
  }

  @override
  void initState() {
    super.initState();
    RESET_FLOOR = 0;
    _playerFloor = _prefs.then((SharedPreferences prefs) => prefs.getInt('floor') ?? 0);
    _startFloor = _prefs.then((SharedPreferences prefs) => prefs.getInt('start') ?? 0);
    _b1step = _prefs.then((SharedPreferences prefs) => prefs.getInt('b1step') ?? 1);
    _f1step = _prefs.then((SharedPreferences prefs) => prefs.getInt('f1step') ?? 1);
    _f2step = _prefs.then((SharedPreferences prefs) => prefs.getInt('f2step') ?? 1);
    _f3step = _prefs.then((SharedPreferences prefs) => prefs.getInt('f3step') ?? 1);
    _f4step = _prefs.then((SharedPreferences prefs) => prefs.getInt('f4step') ?? 1);
    _f5step = _prefs.then((SharedPreferences prefs) => prefs.getInt('f5step') ?? 1);
    _f6step = _prefs.then((SharedPreferences prefs) => prefs.getInt('f6step') ?? 1);
    _hintCount = _prefs.then((SharedPreferences prefs) => prefs.getInt('hint') ?? 0);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/login.png'), colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)),),
        child: Scaffold(
        backgroundColor: Colors.transparent,
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
                  naviFloor();
                  return Center(child: Text(
                    '${snapshot.data == 0 ?'B1' : snapshot.data}층', style: TextStyle(fontSize: 16),)
                  );
                }
              }),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Center(
              child: Container(
                  decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/church.jpg'), colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)),),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          width: 500, height: 100,
                          child: ElevatedButton(onPressed: checkStartFloor == 0 || b1open == true ? (){ getData();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              MyB1_page(route: b1step.toString())));} : null,
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[800]),
                            child: const Text('B1층', style: TextStyle(fontSize: 18, color: Colors.white),),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: 500, height: 100,
                          child: ElevatedButton(onPressed: checkStartFloor == 1 || f1open == true ? (){ getData();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              F1_page(route: f1step.toString(),)));} : null,
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[700]),
                            child: const Text('1층', style: TextStyle(fontSize: 18, color: Colors.white),),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: 500, height: 100,
                          child: ElevatedButton(onPressed: checkStartFloor == 2 || f2open == true ? (){ getData();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              F2_page(route: f2step.toString())));} : null,
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[600]),
                            child: const Text('2층', style: TextStyle(fontSize: 18, color: Colors.white),),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: 500, height: 100,
                          child: ElevatedButton(onPressed: checkFloor >= 3 ? (){ getData();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              F3_page(route: f3step.toString())));} : null,
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[500]),
                            child: const Text('3층', style: TextStyle(fontSize: 18, color: Colors.white),),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: 500, height: 100,
                          child: ElevatedButton(onPressed: checkFloor >= 4 ? (){ getData();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              F4_page(route: f4step.toString())));} : null,
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[400]),
                            child: const Text('4층', style: TextStyle(fontSize: 18, color: Colors.white),),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: 500, height: 100,
                          child: ElevatedButton(onPressed: checkFloor >= 5 ? (){ getData();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              F5_page(route: f5step.toString())));} : null,
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[300]),
                            child: const Text('5층', style: TextStyle(fontSize: 18, color: Colors.white),),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: 500, height: 100,
                          child: ElevatedButton(onPressed: checkFloor >= 6 ? (){ getData();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              F6_page(route: f6step.toString())));} : null,
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[200]),
                            child: const Text('6층', style: TextStyle(fontSize: 18, color: Colors.white),),
                          ),
                        ),
                      ],
                    ),
                  )
              )
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){ _hint(); _test();},
          tooltip: 'Final Code',
          backgroundColor: Colors.purple[800],
          child: const Icon(Icons.key,),
        ),
      )
    );
  }

  Future<void> _hint() async{
    txtHint = '';
    return showDialog(
      context: context,
      barrierDismissible: true, // false: 외부 영역 터치 방지
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.fromLTRB(10,50,10, 50),
          backgroundColor: Colors.black,
          title: const Text('HINT CODE', textAlign: TextAlign.center,),
          titleTextStyle: const TextStyle(fontSize: 20,
              color: Colors.white, fontWeight: FontWeight.bold),
          content: SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 300,
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      maxLength: 4,
                      decoration: const InputDecoration(
                        counterStyle: TextStyle(color: Colors.white),
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      onChanged: (text){txtHint = text;},
                    )
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Center(child: Text('확인', style: TextStyle(color: Colors.white),)),
              onPressed: () {checkHintCode(context);},
            ),
          ],
        );
      }
    );
  }

  Future<void> checkHintCode(BuildContext _context) async{
    bool isChecked = false;
    for(int i = 0; i< HINTCODE.length; i++){
      if(HINTCODE[i] == txtHint){

        if(HINTCODE[i] == "1022" || HINTCODE[i] == "0729" || HINTCODE[i] == "0822"){
          if(NAME != "은주"){
            break;
          }
        }
        isChecked = true;
        final SharedPreferences prefs = await _prefs;
        int hint = (prefs.getInt('hint') ?? 0) + 1;

        setState(() {
          Navigator.of(_context).push(MaterialPageRoute(builder: (context) =>
              Hint_page(route: txtHint)));
          _hintCount = prefs.setInt('hint', hint).then((bool success)
          { return hint;});
        });
      }
    }
    if(isChecked == false){
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('잘못 입력하셨습니다.'),
            duration: Duration(seconds: 1),
          ),
        );
        txtHint = "";
        Navigator.of(_context).pop();
      });
    }
  }

  Future<void> _test() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _playerFloor = prefs.setInt('floor', 6).then((bool success)
      { return 6;});
    });
  }
}

final List HINTCODE = [
  // B1층
  "2839",
  "3417",
  "8253",
  "5861",
  // 1층
  "7851",
  "2984",
  "8695",
  "0852",
  "8942",
  // 2층
  "9353",
  "6359",
  "7834",
  "8560",
  "2960",
  // 3층
  "3486",
  "6846",
  "0855",
  "3843",
  // 4층
  "7634",
  "5073",
  "8566",
  "4583",
  // 5층
  "7863",
  "2912",
  // 6층
  "1964",
  "5762",
  // 이스터에그
  "1022",
  "0729",
  "0822",
  "0312",
];


