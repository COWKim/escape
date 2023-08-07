import 'package:escape/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(const F1_page());
// }

class F1_page extends StatelessWidget {
  const F1_page({super.key, required this.route});

  final String route;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.3),
          child: child!,
        );
      },
      title: 'YKD ESCAPE - 1층',
      theme: Theme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
          )
      ),
      // home: F1_first_page(title: '1층'),
        initialRoute: route,
        routes: {
          '1' : (context) => F1_first_page(),
          '2' : (context) => F1_second_page(),
          '3' : (context) => F1_third_page(),
          '4' : (context) => F1_fourth_page(),
          '5' : (context) => F1_fifth_page(),
          '6' : (context) => F1_final_page(),
        }
    );
  }
}

Future showErrorMessage(BuildContext context) async{
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('틀렸습니다.'),
      duration: Duration(seconds: 1),
    ),
  );
}

// ㅡㅡㅡㅡㅡ 층별 정보판 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F1_first_page extends StatefulWidget {
  const F1_first_page({super.key});

  @override
  State<F1_first_page> createState() => _F1_first_pageState();
}

class _F1_first_pageState extends State<F1_first_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == "프리액션 밸브실"){
      _nextStep();
      Navigator.pushNamed(context, '2');
    }
    else {
      showErrorMessage(context);
    }

    //  Navigator.push(context, MaterialPageRoute(builder: (context) => F1_final_page()));
  }

  Future<void> _calculation = Future<void>.delayed(
    Duration(seconds: 0),
        (){},
  );

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStep;

  Future<void> _nextStep() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _playerStep = prefs.setInt('f1step', 2).then((bool success)
      { return 2;});
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('f1step') ?? 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('1층', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
          future: _playerStep,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }
            else {
              return Center(child: Text(
                '${snapshot.data}/5', style: TextStyle(fontSize: 16),)
              );
            }
          }),
        centerTitle: true,
        actions: [IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
            MyApp())), icon: Icon(Icons.home))],
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,200,10,200),
                      child: Column(
                        children: [
                          Text('본격적으로'),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('1층', style: TextStyle(color: Colors.yellow)),
                                Text('을 탐방해보자!')]),
                          Text(' '),
                        ],
                      ),
                    )
                ),
                FutureBuilder<void>(
                  future: _calculation,
                  builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                    if(snapshot.connectionState != ConnectionState.done){
                      return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                    }
                    else{
                      return Image(
                    image: AssetImage('assets/f1_info.jpg'), width: 350);
                    }
                  }
                ),
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 50, 10, 100),
                      child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('엘리베이터 2개 사이에 있는',),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('위와 같은 '),
                                Text('그림', style: TextStyle(color: Colors.yellow)),
                                Text('을 찾아보자.')]),
                          Text(' '),
                          Text('층마다 어떤 장소가 있는지'),
                          Text('한눈에 볼 수 있어!'),
                          Text(' '),
                          Text(' '),
                          Text(' '),
                          Text('그런데'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('바로 '),
                              Text('왼편', style: TextStyle(color: Colors.yellow)),
                              Text('에 보이는 '),
                              Text('장소', style: TextStyle(color: Colors.yellow)),
                              Text('가')]),
                          Text('빠져있는 듯 하다.')],
                      ),
                    )
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('어떤 '),
                        Text('장소', style: TextStyle(color: Colors.yellow)),
                        Text('가 빠져있는걸까?')]),
                ),
                SizedBox(
                    width: 350,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              textAlign: TextAlign.center,
                              maxLength: 8,
                              decoration: const InputDecoration(
                                  counterStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                                  ),),
                              onChanged: (text){txtAnswer = text;},
                            )
                        ),
                      ],
                    )
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 300, height: 100,
                  child: ElevatedButton(onPressed: (){answerCheck(txtAnswer);},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[800]),
                    child: Text('확인'),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}

// ㅡㅡㅡㅡㅡ WE STUDIO ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F1_second_page extends StatefulWidget {
  F1_second_page({super.key});

  @override
  State<F1_second_page> createState() => _F1_second_pageState();
}

class _F1_second_pageState extends State<F1_second_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == "창조"){
      _nextStep();
      Navigator.pushNamed(context, '3');
    }
    else {
      showErrorMessage(context);
    }
  }

  late Future<void> _calculation = Future<void>.delayed(
    Duration(seconds: 1),
        (){},
  );

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStep;

  Future<void> _nextStep() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _playerStep = prefs.setInt('f1step', 3).then((bool success)
      { return 3;});
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('f1step') ?? 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('1층', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
            future: _playerStep,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              else {
                return Center(child: Text(
                  '${snapshot.data}/5', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                );
              }
            }),
        centerTitle: true,
        actions: [IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
            MyApp())), icon: Icon(Icons.home))],
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
                  child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(180)),
                  child: FutureBuilder<void>(
                      future: _calculation,
                      builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                        if(snapshot.connectionState != ConnectionState.done){
                          return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                        }
                        else{
                          return Image(image: AssetImage('assets/f1_belbroom.jpg'), width: 250);
                        }
                      }
                  ),
                ),),
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,50,20,100),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('프리액션 밸브실', style: TextStyle(color: Colors.yellow)),
                                Text('은')]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('관계자 외 출입금지', style: TextStyle(color: Colors.red)),
                              Text('라서')]),
                          Text('명시되어 있지 않은 것 같아.'),
                          Text(' '),
                          Text(' '),
                          Text(' '),
                          Text('다음 장소로 이동하자.'),
                        ],
                      ),
                    )
                ),
                FutureBuilder<void>(
                  future: _calculation,
                  builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                    if(snapshot.connectionState != ConnectionState.done){
                      return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                    }
                    else{
                      return Image(image: AssetImage('assets/f1_creativezone.jpg'), width: 350);
                    }
                  }
                ),
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,100,10,250),
                      child: Column(
                        children: [
                          Text('다음 장소는 '),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('YK CreativeZone', style: TextStyle(color: Colors.yellow)),
                                Text('이야.')]),
                          Text(' '),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('이곳은 '),
                                Text('온라인 방송', style: TextStyle(color: Colors.yellow)),
                                Text('도 하고,')]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('비대면 모임도', style: TextStyle(color: Colors.yellow)),
                                Text(' 하고,')]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('영상 편집', style: TextStyle(color: Colors.yellow)),
                              Text('도 하는 곳이야.')]),
                          Text(' '),
                          Text('창동염광교회 유튜브 채널에'),
                          Text('다양한 컨텐츠들이'),
                          Text('이곳을 거쳐서 탄생하기도 해.'),
                        ],
                      ),
                    )
                ),
                FutureBuilder<void>(
                    future: _calculation,
                    builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                      if(snapshot.connectionState != ConnectionState.done){
                        return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                      }
                      else{
                        return Image(image: AssetImage('assets/f1_weStudio.png'));
                      }
                    }
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(20),
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('단서', style: TextStyle(color: Colors.yellow)),
                            Text('를 참고하여')]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('어느 곳', style: TextStyle(color: Colors.yellow)),
                            Text('을'),]),
                        Text('선택했는지 유추하고'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('장소의 이름', style: TextStyle(color: Colors.yellow)),
                            Text('을 적어보자.'),]),
                      ],
                    )
                ),
                Container(
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(20),
                    child: const Column(
                      children: [
                        Center(
                            child: Text('단 서', style: TextStyle(color: Colors.yellow, fontSize: 30))
                        ),
                        Text(' '),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('We Studio', style: TextStyle(color: Colors.yellow)),
                              Text('에서 촬영한')]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('영상을 '),
                              Text('편집', style: TextStyle(color: Colors.yellow)),
                              Text('하고싶다.'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('(가려진)문구', style: TextStyle(color: Colors.yellow)),
                              Text('를 보아하니'),]),
                        Text('두 곳이 명시되어 있는데'),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('나는 '),
                              Text('후자', style: TextStyle(color: Colors.yellow)),
                              Text('를 선택할래.'),]),
                      ],
                    )
                ),
                Container(
                    width: 300,
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      textAlign: TextAlign.center,
                      maxLength: 2,
                      decoration: const InputDecoration(
                        counterStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      onChanged: (text){txtAnswer = text;},
                    )
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 300, height: 100,
                  child: ElevatedButton(onPressed: (){answerCheck(txtAnswer);},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[800]),
                    child: Text('확인'),
                  ),
                ),
              ],
            ),
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


// ㅡㅡㅡㅡㅡ 캐비넷 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F1_third_page extends StatefulWidget {
  F1_third_page({super.key});

  @override
  State<F1_third_page> createState() => _F1_third_pageState();
}

class _F1_third_pageState extends State<F1_third_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == "김찬우"){
      _nextStep();
      Navigator.pushNamed(context, '4');
    }
    else {
      showErrorMessage(context);
    }
  }

  late Future<void> _calculation = Future<void>.delayed(Duration(seconds: 1), (){},);

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStep;

  Future<void> _nextStep() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _playerStep = prefs.setInt('f1step', 4).then((bool success)
      { return 4;});
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('f1step') ?? 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('1층', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
            future: _playerStep,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              else {
                return Center(child: Text(
                  '${snapshot.data}/5', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                );
              }
            }),
        centerTitle: true,
        actions: [IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
            MyApp())), icon: Icon(Icons.home))],
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10,50,20,100),
                    child: Column(
                      children: [
                        FutureBuilder<void>(
                            future: _calculation,
                            builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                              if(snapshot.connectionState != ConnectionState.done){
                                return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                              }
                              else{
                                return Image(image: AssetImage('assets/f1_create.jpg'), width: 250,);
                              }
                            }
                        ),
                        Text(' '),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('정답은 '),
                            Text('창조', style: TextStyle(color: Colors.yellow)),
                            Text(',')]
                        ),
                        Text('제 5 편집실이였어.'),
                        Text(' '),
                        Text('단서에서 말하는'),
                        Text("둘 중 하나는 '창조'였고,"),
                        Text("다른 하나는 '함께'였지."),
                        Text(' '),
                        Text(' '),
                        Text('"하나님께서 우리를', style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('창조', style: TextStyle(color: Colors.yellow, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                              Text('하셨음을 믿고,', style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),]
                        ),
                        Text('언제나 우리와', style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('함께', style: TextStyle(color: Colors.yellow, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                              Text('하신다"', style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                              Text(' 는 것을'),]
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('꼭', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                              Text(' 기억하자!'),]
                        ),
                      ],
                    ),
                  )
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10,300,10,100),
                    child: Column(
                      children: [
                        Text('다음 장소로 가기 전에'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('여기', style: TextStyle(color: Colors.yellow)),
                            Text('에 짐 좀 두고 가자..')]
                        ),
                        Text(' '),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('문제', style: TextStyle(color: Colors.yellow)),
                              Text('는 덤이야')]
                        ),
                        Text(' '),
                        Image(image: AssetImage('assets/f1_nongdamgom.jpg'), width: 150,)
                      ],
                    )
                  )
                ),
                FutureBuilder<void>(
                    future: _calculation,
                    builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                      if(snapshot.connectionState != ConnectionState.done){
                        return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                      }
                      else{
                        return Image(image: AssetImage('assets/f1_cabinet.jpg'));
                      }
                    }
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.fromLTRB(20,50,20,10),
                    padding: EdgeInsets.all(10),
                    child: const Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('단서들', style: TextStyle(color: Colors.yellow)),
                              Text('을 이용해')]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('무엇', style: TextStyle(color: Colors.yellow)),
                              Text('을 나타내는지 맞춰보자.')]),
                      ],
                    )
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('단 서 1', style: TextStyle(color: Colors.yellow, fontSize: 30)),
                        Text(' '),
                        Text('4 5 7 12 13 15 17 20'),
                        Text('23 26 33 40 42 44 45 46'),
                      ],
                    )
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('단 서 2', style: TextStyle(color: Colors.yellow, fontSize: 30)),
                        Text(' '),
                        Text('한글 점자판'),
                        Text(' '),
                        Image(image: AssetImage('assets/f1_jumja.PNG'),)
                      ],
                    )
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('단 서 3', style: TextStyle(color: Colors.yellow, fontSize: 30)),
                        Text(' '),
                        Text('진행 방향'),
                        Text(' '),
                        Image(image: AssetImage('assets/f1_cabinetHelp.PNG'),)
                      ],
                    )
                ),
                Container(
                    width: 300,
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      textAlign: TextAlign.center,
                      maxLength: 3,
                      decoration: const InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      onChanged: (text){txtAnswer = text;},
                    )
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 300, height: 100,
                  child: ElevatedButton(onPressed: (){answerCheck(txtAnswer);},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[800]),
                    child: Text('확인'),
                  ),
                ),
              ],
            ),
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


// ㅡㅡㅡㅡㅡ 염광비전 선언문 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F1_fourth_page extends StatefulWidget {
  F1_fourth_page({super.key});

  @override
  State<F1_fourth_page> createState() => _F1_fourth_pageState();
}

class _F1_fourth_pageState extends State<F1_fourth_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == "4144"){
      _nextStep();
      Navigator.pushNamed(context, '5');
    }
    else {
      showErrorMessage(context);
    }
  }

  late Future<void> _calculation = Future<void>.delayed(
    Duration(seconds: 0),
        (){},
  );

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStep;

  Future<void> _nextStep() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _playerStep = prefs.setInt('f1step', 5).then((bool success)
      { return 5;});
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('f1step') ?? 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('1층', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
          future: _playerStep,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }
            else {
              return Center(child: Text(
                '${snapshot.data}/5', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
              );
            }
          }),
        centerTitle: true,
        actions: [IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
          MyApp())), icon: Icon(Icons.home))],
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,50,20,100),
                      child: Column(
                        children: [
                          Text('답 보고 화나진 않았지..?'),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 50),
                            child: Image(image: AssetImage('assets/f1_zzugul.png'), width: 250,),
                          ),

                          Text('그래도 내 이름 정도는'),
                          Text('기억해줄 수 있잖아..!'),
                          Text(' '),
                          Image(image: AssetImage('assets/f1_cute.gif'), width: 250,)
                        ]
                      ),
                    )
                ),
                const Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10,300,10,250),
                        child: Column(
                          children: [
                            Text('큼큼'),
                            Text(' '),
                            Text('다음 장소로 이동하자!'),
                            Text(' '),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('본관 엘리베이터 ', style: TextStyle(color: Colors.yellow)),
                                  Text('맞은편'),]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('염광비전 선언문 ', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                                  Text('을 향해'),]
                            ),
                            Text('고고!'),
                          ],
                        )
                    )
                ),
                FutureBuilder<void>(
                    future: _calculation,
                    builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                      if(snapshot.connectionState != ConnectionState.done){
                        return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                      }
                      else{
                        return Image(image: AssetImage('assets/f1_moon.jpg'));
                      }
                    }
                ),
                const Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10,50,10,50),
                        child: Column(
                          children: [
                            Text('여기에는'),
                            Text('우리 교회의 비전과'),
                            Text('성도의 비전이 적혀있어.'),
                            Text('한번 읽어볼까?'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('.'),
                            Text('읽어보니까'),
                            Text('우리의 방향성이'),
                            Text('더 짙어진 것 같아!'),
                          ],
                        )
                    )
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.fromLTRB(20,50,20,10),
                    padding: EdgeInsets.all(10),
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('단서', style: TextStyle(color: Colors.yellow)),
                            Text('와 '),
                            Text('선언문', style: TextStyle(color: Colors.yellow)),
                            Text('을 이용해서')]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('단서', style: TextStyle(color: Colors.yellow)),
                            Text('가 가리키는 '),
                            Text('숫자', style: TextStyle(color: Colors.yellow)),
                            Text('를 유추해'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('번호 순서대로', style: TextStyle(color: Colors.yellow)),
                              Text(' 답을 적어보자.')]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('참고로 정답은 '),
                            Text('숫자', style: TextStyle(color: Colors.yellow)),
                            Text('야!')]),
                      ],
                    )
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('단 서', style: TextStyle(color: Colors.yellow, fontSize: 30)),
                        Text(' '),
                        Image(image: AssetImage('assets/f1_moonKey.PNG'),)
                      ],
                    )
                ),
                Container(
                    width: 300,
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      textAlign: TextAlign.center,
                      maxLength: 4,
                      decoration: const InputDecoration(
                        counterStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      onChanged: (text){txtAnswer = text;},
                    )
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 300, height: 100,
                  child: ElevatedButton(onPressed: (){answerCheck(txtAnswer);},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[800]),
                    child: Text('확인'),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}

// ㅡㅡㅡㅡㅡ 차량운행 노선안내도 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F1_fifth_page extends StatefulWidget {
  F1_fifth_page({super.key});

  @override
  State<F1_fifth_page> createState() => _F1_fifth_pageState();
}

class _F1_fifth_pageState extends State<F1_fifth_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == "2023"){
      _nextFloor();
      Navigator.pushNamed(context, '6');
    }
    else {
      showErrorMessage(context);
    }
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStep;
  late Future<int> _playerFloor;

  late Future<void> _calculation = Future<void>.delayed(
    Duration(seconds: 0),
        (){},
  );

  Future<void> _nextFloor() async{
    final SharedPreferences prefs = await _prefs;
    int playerFloor = (prefs.getInt('floor') ?? 1);

    setState(() {
      if (playerFloor == 1) {
        prefs.setInt('f1step', 6);
        _playerFloor = prefs.setInt('floor', 2).then((bool success) {
          return 2;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('f1step') ?? 5);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('1층', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
          future: _playerStep,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }
            else {
              return Center(child: Text(
                '${snapshot.data}/5', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
              );
            }
          }),
        centerTitle: true,
        actions: [IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
          MyApp())), icon: Icon(Icons.home))],
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,50,20,100),
                      child: Column(
                          children: [
                            Text('답이 문단 모양이란 것을'),
                            Text('눈치챘어?'),
                            Text(' '),
                            Text('역시 대단해!'),
                            Text(' '),
                            Text('그렇다면 혹시'),
                            Text('문제가 점점 어려워지고 있다', style: TextStyle(color: Colors.yellow)),
                            Text('라는 것도 눈치챘어?'),
                            Text(' '),
                            Text('그리고 아직'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('1층', style: TextStyle(color: Colors.yellow)),
                                Text('이라는 사실도..'),]
                            ),
                            Text(' '),
                            Text('파이팅!', style: TextStyle(color: Colors.cyanAccent)),
                          ]
                      ),
                    )
                ),
                Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10,300,10,200),
                        child: Column(
                          children: [
                            Text('다음 장소는'),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('로뎀', style: TextStyle(color: Colors.yellow)),
                                  Text('을 지나'),]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('권사 기도실', style: TextStyle(color: Colors.yellow)),
                                  Text('쪽으로 가야해!'),]
                            ),
                            Text(' '),
                            Text(' '),
                            FutureBuilder<void>(
                                future: _calculation,
                                builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                                  if(snapshot.connectionState != ConnectionState.done){
                                    return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                                  }
                                  else{
                                    return Image(image: AssetImage('assets/f1_rodemRoad.jpg'), width: 350,);
                                  }
                                }
                            ),
                            Text(' '),
                            Text(' '),
                            Text('그러면'),
                          ],
                        )
                    )
                ),
                FutureBuilder<void>(
                    future: _calculation,
                    builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                      if(snapshot.connectionState != ConnectionState.done){
                        return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                      }
                      else{
                        return Image(image: AssetImage('assets/f1_bus.jpg'));
                      }
                    }
                ),
                const Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10,50,10,50),
                        child: Column(
                          children: [
                            Text('염광교회 차량운행 노선안내도', style: TextStyle(color: Colors.yellow)),
                            Text('이걸 가는 길 벽면에서'),
                            Text('찾을 수 있을거야.'),
                            Text(' '),
                            Text(' '),
                            Text('노선 안내도를 보니까'),
                            Text('생각보다 많은 차량이'),
                            Text('성도들을 교회로 올 수 있게'),
                            Text('꽤 넓은 지역까지'),
                            Text('운행되고 있구나!'),
                          ],
                        )
                    )
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.fromLTRB(20,50,20,10),
                    padding: EdgeInsets.all(20),
                    child: const Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('단서', style: TextStyle(color: Colors.yellow)),
                              Text('와 '),
                              Text('노선안내도', style: TextStyle(color: Colors.yellow)),
                              Text('를 이용해서')]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('정답', style: TextStyle(color: Colors.yellow)),
                              Text('을 유추해보자.')]),
                      ],
                    )
                ),
                Container(
                  width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('단 서', style: TextStyle(color: Colors.yellow, fontSize: 30)),
                        Text(' '),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('도봉중학교 = 8'),
                            Text('주호사우나 = 7'),
                            Text('이상갈비 = 5'),
                            Text(' '),
                            Row(
                                children: [
                                  Text('번동주공 2단지 = '),
                                  Text('(1)', style: TextStyle(color: Colors.yellow)),]),
                            Row(
                                children: [
                                  Text('삼양 사거리 = '),
                                  Text('(2)', style: TextStyle(color: Colors.yellow)),]),
                            Text(' '),
                            Text(' '),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('정답 : '),
                                  Text('(1)(2)', style: TextStyle(color: Colors.yellow)),]),
                          ],
                        )
                      ],
                    )
                ),
                Container(
                    width: 300,
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      textAlign: TextAlign.center,
                      maxLength: 4,
                      decoration: const InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      onChanged: (text){txtAnswer = text;},
                    )
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 300, height: 100,
                  child: ElevatedButton(onPressed: (){answerCheck(txtAnswer);},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[800]),
                    child: Text('확인'),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}

class F1_final_page extends StatefulWidget {
  F1_final_page({super.key});

  @override
  State<F1_final_page> createState() => _F1_final_pageState();
}

class _F1_final_pageState extends State<F1_final_page> {

  void answerCheck(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  late Future<void> _calculation = Future<void>.delayed(
    Duration(seconds: 0),
        (){},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('1층', style: TextStyle(fontSize: 20),),
          leading: Icon(Icons.check, color: Colors.lightGreenAccent,),
          actions: [IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
              MyApp())), icon: Icon(Icons.home))],
          centerTitle: true,
        ),
        body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.cyanAccent, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.fromLTRB(20, 250, 20, 500),
                    padding: EdgeInsets.all(30),
                    child: Text('1층 Mission Clear!', style: TextStyle(color: Colors.cyanAccent),),
                  ),
                  FutureBuilder<void>(
                      future: _calculation,
                      builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                        if(snapshot.connectionState != ConnectionState.done){
                          return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                        }
                        else{
                          return Image(image: AssetImage('assets/f1_stair.jpg'));
                        }
                      }
                  ),
                  const Padding(
                      padding: EdgeInsets.fromLTRB(10,50,10,50),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('남은 '),
                                Text('2023', style: TextStyle(color: Colors.yellow)),
                                Text('년도 '),
                                Text('파이팅!', style: TextStyle(color: Colors.cyanAccent))]
                          ),
                          Text(' '),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('1층 미션을 모두 '),
                                Text('성공', style: TextStyle(color: Colors.cyanAccent)),
                                Text('했어!')]
                          ),
                          Text(' '),
                          Text('위 계단을 이용해'),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('2층', style: TextStyle(color: Colors.yellow)),
                                Text('으로 올라가보자.')]
                          )
                        ],)
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: 300, height: 100,
                    child: ElevatedButton(onPressed: (){answerCheck();},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[800]),
                      child: Text('확인'),
                    ),
                  ),
                ],
              ),
            )
        ),
    );
  }
}