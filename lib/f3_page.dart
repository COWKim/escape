import 'package:escape/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(const F3_page());
// }

class F3_page extends StatelessWidget {
  const F3_page({super.key, required this.route});

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
        title: 'YKD ESCAPE - 3층',
        theme: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
            )
        ),
        //home: F2_first_page(title: '3층'),
        initialRoute: route,
        routes: {
          '1' : (context) => F3_first_page(),
          '2' : (context) => F3_second_page(),
          '3' : (context) => F3_third_page(),
          '4' : (context) => F3_fourth_page(),
          '5' : (context) => F3_final_page(),
        }
    );
  }
}

Future showErrorMessage(BuildContext context) async{
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('틀렸습니다.'),
      duration: Duration(seconds: 1),
    ),
  );
}

// ㅡㅡㅡㅡㅡ 탕자의 귀환 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F3_first_page extends StatefulWidget {
  const F3_first_page({super.key});

  @override
  State<F3_first_page> createState() => _F3_first_pageState();
}

class _F3_first_pageState extends State<F3_first_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == '탕자'){
      _nextStep();
      Navigator.pushNamed(context, '2');
    }
    else {
      showErrorMessage(context);
    }

    //   Navigator.push(context, MaterialPageRoute(builder: (context) => F3_fourth_page()));
  }

  late Future<void> _calculation = Future<void>.delayed(Duration(seconds: 1), (){},);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStep;

  Future<void> _nextStep() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _playerStep = prefs.setInt('f3step', 2).then((bool success)
      { return 2;});
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('f3step') ?? 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('3층', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
            future: _playerStep,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              else {
                return Center(child: Text(
                  '${snapshot.data}/4', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
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
                FutureBuilder<void>(
                    future: _calculation,
                    builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                      if(snapshot.connectionState != ConnectionState.done){
                        return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                      }
                      else{
                        return const Padding(
                          padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
                          child: Image(image: AssetImage('assets/f3_picture.jpg'), width: 350,),
                        );
                      }
                    }
                ),
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,10,10,200),
                      child: Column(
                        children: [
                          Text('3층에 이 그림이'),
                          Text('어디있는지 찾았어?'),
                          Text(' '),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('예배드리는 '),
                                Text('본당 뒤', style: TextStyle(color: Colors.yellow)),
                                Text('에서'),]),
                          Text('본 적 없어??'),
                          Text(' '),
                          Text('어떤 그림인지는'),
                          Text('제목을 보면 알 수 있을거야.'),
                          Text(' '),
                          Text(' '),
                          Text(' '),
                          Text('그림에 대한 정보는'),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('그림 아래 벽면', style: TextStyle(color: Colors.yellow)),
                                Text('에'),]),
                          Text('설명에 나와있어.'),
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
                        return const Padding(
                          padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
                          child: Image(image: AssetImage('assets/f3_son.jpg'), width: 350,),
                        );
                      }
                    }
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
                    padding: EdgeInsets.all(20),
                    child: const Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('인터넷 검색', style: TextStyle(color: Colors.yellow)),
                              Text('을 통해'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('원본 제목', style: TextStyle(color: Colors.yellow)),
                              Text('과'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('가려진 제목', style: TextStyle(color: Colors.yellow)),
                              Text('을 비교하여'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('단어', style: TextStyle(color: Colors.yellow)),
                              Text('가 다른 부분을 찾고'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('원본 단어', style: TextStyle(color: Colors.yellow)),
                              Text('를 쓰시오.'),]),
                      ],
                    )
                ),
                SizedBox(
                    width: 350,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                counterText: '',
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

// ㅡㅡㅡㅡㅡ 헌금봉투 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F3_second_page extends StatefulWidget {
  F3_second_page({super.key});

  @override
  State<F3_second_page> createState() => _F3_second_pageState();
}

class _F3_second_pageState extends State<F3_second_page> {
  String txtMonth = "";
  String txtDay = "";
  String txtDayofaWeek = "";

  void answerCheck(String answer1, String answer2, String answer3){
    if(answer1 == "2" && answer2 == "14" && answer3 == "목"){
      _nextStep();
      Navigator.pushNamed(context, '3');
    }
    else {
      showErrorMessage(context);
    }
  }

  late Future<void> _calculation = Future<void>.delayed(Duration(seconds: 0), (){},);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStep;

  Future<void> _nextStep() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _playerStep = prefs.setInt('f3step', 3).then((bool success)
      { return 3;});
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('f3step') ?? 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('3층', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
            future: _playerStep,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              else {
                return Center(child: Text(
                  '${snapshot.data}/4', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
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
                    padding: EdgeInsets.fromLTRB(10,50,20,200),
                    child: Column(
                      children: [
                        Text('세상을 살다보면'),
                        Text('우리는 연약하기 떄문에'),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('죄', style: TextStyle(color: Colors.redAccent)),
                              Text('를 많이 짓게 돼.')]),
                        Text(''),
                        Text('하지만'),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('주님', style: TextStyle(color: Colors.yellow)),
                              Text('은 우리를 기다리고 계셔.')]),
                        Text(''),
                        Text('더 늦기 전에 회개하고'),
                        Text('주님께 다시 돌아가자!', style: TextStyle(color: Colors.yellow)),
                        Text(''),
                      ],
                    ),
                  )
                ),
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,100,20,50),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('그림 옆 긴 책상', style: TextStyle(color: Colors.yellow)),
                                Text('으로 가면')]),
                          Text('헌금과 관련된 여러가지'),
                          Text('봉투가 마련되어있어.'),
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
                      return const Padding(
                        padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
                        child: Image(image: AssetImage('assets/f3_envelopes.jpg'), width: 350,),
                      );
                    }
                  }
                ),
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,50,20,50),
                      child: Column(
                        children: [
                          Text('감사헌금, 십일조, 선교헌금'),
                          Text('등등'),
                          Text('주님께 드릴 예물이'),
                          Text('참 많은데'),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('아깝다', style: TextStyle(color: Colors.pinkAccent)),
                                Text('고 생각하면 안돼.')]),
                          Text(''),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('원래 다 '),
                                Text('주님의 것', style: TextStyle(color: Colors.yellow)),
                                Text('이니까~')]),
                        ],
                      ),
                    )
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
                  padding: EdgeInsets.all(20),
                  child: const Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('십일조', style: TextStyle(color: Colors.yellow)),
                            Text('와 '),
                            Text('헌금 봉투', style: TextStyle(color: Colors.yellow)),
                            Text('를'),]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('성경묵상 신청', style: TextStyle(color: Colors.yellow)),
                            Text('종이에 놓고')]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('날짜', style: TextStyle(color: Colors.yellow)),
                            Text('와 '),
                            Text('요일', style: TextStyle(color: Colors.yellow)),
                            Text('을 찾아보자.'),]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('단서', style: TextStyle(color: Colors.yellow)),
                            Text('를 꼭 참고해!'),]),
                    ],
                  )
                ),
                Container(
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
                      Image(image: AssetImage('assets/f3_envelope.PNG'),),
                      Text(' '),
                      Text('봉투가 튀어나오거나'),
                      Text('뒤집어서는 안된다.'),
                    ],
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 80,
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          textAlign: TextAlign.center,
                          maxLength: 2,
                          decoration: const InputDecoration(
                            counterText: '',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          onChanged: (text){txtMonth = text;},
                        )
                    ),
                    Text('월'),
                    Container(
                        width: 80,
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          textAlign: TextAlign.center,
                          maxLength: 2,
                          decoration: const InputDecoration(
                            counterText: '',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          onChanged: (text){txtDay = text;},
                        )
                    ),
                    Text('일'),
                    Container(
                        width: 80,
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: const InputDecoration(
                            counterText: '',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          onChanged: (text){txtDayofaWeek = text;},
                        )
                    ),
                    Text('요일'),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 300, height: 100,
                  child: ElevatedButton(onPressed: (){answerCheck(txtMonth, txtDay, txtDayofaWeek);},
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

// ㅡㅡㅡㅡㅡ 시계 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F3_third_page extends StatefulWidget {
  F3_third_page({super.key});

  @override
  State<F3_third_page> createState() => _F3_third_pageState();
}

class _F3_third_pageState extends State<F3_third_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == "3827"){
      _nextStep();
      Navigator.pushNamed(context, '4');
    }
    else {
      showErrorMessage(context);
    }
  }

  late Future<void> _calculation = Future<void>.delayed(Duration(seconds: 0), (){},);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStep;

  Future<void> _nextStep() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _playerStep = prefs.setInt('f3step', 4).then((bool success)
      { return 4;});
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('f3step') ?? 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('3층', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
            future: _playerStep,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              else {
                return Center(child: Text(
                  '${snapshot.data}/4', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
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
                        padding: EdgeInsets.fromLTRB(10,100,10,300),
                        child: Column(
                          children: [
                            Text('정답은 정답일 뿐'),
                            Text('날짜에 의미가 있지는 않아.'),
                            Text(' '),
                            FutureBuilder<void>(
                                future: _calculation,
                                builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                                  if(snapshot.connectionState != ConnectionState.done){
                                    return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                                  }
                                  else{
                                    return Image(image: AssetImage('assets/f3_pass.jpg'),);
                                  }
                                }
                            ),
                          ],
                        )
                    )
                ),
                const Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10,50,10,50),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('뒤에 보면 '),
                                  Text('시계', style: TextStyle(color: Colors.yellow)),
                                  Text('가 있을거야.'),
                                ]
                            ),
                            Text(' '),
                            Text('여러분의 시간이'),
                            Text('얼마나 남았을까요?'),
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
                        return Image(image: AssetImage('assets/f3_clock.jpg'),);
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
                              Text('단서', style: TextStyle(color: Colors.yellow)),
                              Text('와 일치하는 '),
                              Text('숫자', style: TextStyle(color: Colors.yellow)),
                              Text('를'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text('순서대로', style: TextStyle(color: Colors.yellow)),
                              Text(' 적어보자.')]),
                      ],
                    )
                ),
                Container(
                    width: 350,
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
                        Image(image: AssetImage('assets/f3_3.png'),),
                        Text(' '),
                        Image(image: AssetImage('assets/f3_8.png'),),
                        Text(' '),
                        Image(image: AssetImage('assets/f3_2.png'),),
                        Text(' '),
                        Image(image: AssetImage('assets/f3_7.png'),),
                        Text(' '),
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

// ㅡㅡㅡㅡㅡ 청년부 교역자실 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F3_fourth_page extends StatefulWidget {
  F3_fourth_page({super.key});

  @override
  State<F3_fourth_page> createState() => _F3_fourth_pageState();
}

class _F3_fourth_pageState extends State<F3_fourth_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == "사랑합니다"){
      _nextStep();
      Navigator.pushNamed(context, '5');
    }
    else {
      showErrorMessage(context);
    }
  }

  late Future<void> _calculation = Future<void>.delayed(Duration(seconds: 0), (){},);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStep;

  Future<void> _nextStep() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _playerStep = prefs.setInt('f3step', 5).then((bool success)
      { return 5;});
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('f3step') ?? 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('3층', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
            future: _playerStep,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              else {
                return Center(child: Text(
                  '${snapshot.data}/4', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
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
                            Text('우리가 할 수 있는 건'),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('"'),
                                  Text('기도', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                                  Text('"'),]
                            ),
                            Text(' '),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                                child: Image(image: AssetImage('assets/f2_pray.jpg'), width: 250,)
                            ),
                            Text('힘들때나 기쁠때나'),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('항상 '),
                                  Text('기도', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                                  Text('로 나아가는'),]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('YKD 청년', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                                  Text('이 되자!'),]
                            ),
                          ]
                      ),
                    )
                ),
                const Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10,300,10,200),
                        child: Column(
                          children: [
                            Text('다음 장소는'),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('탁아부실', style: TextStyle(color: Colors.yellow)),
                                  Text('이야.'),]
                            ),
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
                        return Image(image: AssetImage('assets/f2_taka.jpg'),);
                      }
                    }
                ),
                const Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10,50,10,50),
                        child: Column(
                          children: [
                            Text('0~17개월된 아기들은'),
                            Text('이곳에서 부모님을 기다려.'),]
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
                              Text('문 앞에', style: TextStyle(color: Colors.yellow)),
                              Text(' 붙어있는')]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('뽀로로의 친구들', style: TextStyle(color: Colors.yellow)),
                              Text(' 중에')]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('혼자만 '),
                              Text('방향', style: TextStyle(color: Colors.yellow)),
                              Text('이 다른 ')]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('캐릭터', style: TextStyle(color: Colors.yellow)),
                              Text('는 누굴까?')]),
                        Text(''),
                        Text('붙어있는 캐릭터의', style: TextStyle(color: Colors.yellow)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('화살표', style: TextStyle(color: Colors.yellow)),
                              Text('가 이어진')]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('창문', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                              Text('을 잘 봐.')]),
                      ],
                    )
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('캐 릭 터', style: TextStyle(color: Colors.yellow, fontSize: 30)),
                        Text(' '),
                        Image(
                          image: AssetImage('assets/f2_pororo.PNG'),
                        )
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
      ),
    );
  }
}

class F3_final_page extends StatefulWidget {
  F3_final_page({super.key});

  @override
  State<F3_final_page> createState() => _F3_final_pageState();
}

class _F3_final_pageState extends State<F3_final_page> {

  void answerCheck(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  late Future<void> _calculation = Future<void>.delayed(Duration(seconds: 0), (){},);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('3층', style: TextStyle(fontSize: 20),),
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
                  child: Text('3층 Mission Clear!', style: TextStyle(color: Colors.cyanAccent),),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(10,50,10,50),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('3층 미션을 모두 '),
                              Text('성공', style: TextStyle(color: Colors.cyanAccent)),
                              Text('했어!')]
                        ),
                        Text(' '),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('4층', style: TextStyle(color: Colors.yellow)),
                              Text('으로 '),
                              Text('GO', style: TextStyle(color: Colors.cyanAccent)),
                              Text('!'),]
                        ),
                        FutureBuilder<void>(
                            future: _calculation,
                            builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                              if(snapshot.connectionState != ConnectionState.done){
                                return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                              }
                              else{
                                return Padding(
                                    padding: EdgeInsets.fromLTRB(10,100,10,50),
                                    child: Image(image: AssetImage('assets/f3_picture.jpg'), width: 300,));
                              }
                            }
                        ),
                        Text('위 그림이 있는 곳으로 가자!'),
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