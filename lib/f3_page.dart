import 'package:carousel_slider/carousel_slider.dart';
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
                              Text('제목', style: TextStyle(color: Colors.yellow)),
                              Text('의 '),
                              Text('원래 이름', style: TextStyle(color: Colors.yellow)),
                              Text('을 찾고 '),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('적혀진 제목', style: TextStyle(color: Colors.yellow)),
                              Text('과 비교하여'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('다른 단어', style: TextStyle(color: Colors.yellow)),
                              Text('가 무엇인지 찾아'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('원래 제목의 단어', style: TextStyle(color: Colors.yellow)),
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
                              maxLength: 2,
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('더 늦기 전에 '),
                              Text('회개', style: TextStyle(color: Colors.yellow)),
                              Text('하고')]),
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
                            Text('종이에 겹쳐')]),
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
                            Text('예배시간에 늦는'),
                            Text('청년들은 없지요?'),
                            Text(' '),
                            Text('째깍째깍', style: TextStyle(color: Colors.lightGreenAccent)),
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
                        Image(image: AssetImage('assets/f3_3.PNG'),),
                        Text(' '),
                        Image(image: AssetImage('assets/f3_8.PNG'),),
                        Text(' '),
                        Image(image: AssetImage('assets/f3_2.PNG'),),
                        Text(' '),
                        Image(image: AssetImage('assets/f3_7.PNG'),),
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

  void answerCheck(){
    if(isClickedIsaac == true && isClickedKim == true && isClickedChoi == false && isClickedBang == false && isClickedJung == false){
      _nextStep();
      Navigator.pushNamed(context, '5');
    }
    else {
      showErrorMessage(context);
    }
  }

  late Future<void> _calculation = Future<void>.delayed(Duration(seconds: 0), (){},);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final CarouselController _controller = CarouselController();
  late Future<int> _playerStep;
  late Future<int> _playerFloor;

  Future<void> _nextStep() async{
    final SharedPreferences prefs = await _prefs;
    int playerFloor = (prefs.getInt('floor') ?? 3);

    setState(() {
      prefs.setInt('f3step', 5);
      if (playerFloor == 3) {
        _playerFloor = prefs.setInt('floor', 4).then((bool success) {
          return 4;
        });
      }
    });
  }

  Future<void> _clickEvent(int index) async{

    setState(() {
      if(index == 0){
        isClickedChoi = isClickedChoi == false ? true : false;
      }
      else if(index == 1){
        isClickedIsaac = isClickedIsaac == false ? true : false;
      }
      else if(index == 2){
        isClickedBang =  isClickedBang == false ? true : false;
      }
      else if(index == 3){
        isClickedKim = isClickedKim == false ? true : false;
      }
      else if(index == 4){
        isClickedJung = isClickedJung == false ? true : false;
      }
    });
  }

  int _current = 0;

  bool isClickedChoi = false;
  bool isClickedIsaac = false;
  bool isClickedBang = false;
  bool isClickedKim = false;
  bool isClickedJung = false;

  List imageList = [
    Image(image: AssetImage('assets/f3_choi.PNG')),
    Image(image: AssetImage('assets/f3_isaac.PNG')),
    Image(image: AssetImage('assets/f3_bang.PNG')),
    Image(image: AssetImage('assets/f3_kim.PNG')),
    Image(image: AssetImage('assets/f3_jung.PNG')),
  ];

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
                      padding: EdgeInsets.fromLTRB(10,50,20,300),
                      child: Column(
                          children: [
                            Text('다음으로'),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('청년부 교역자', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                                  Text('님들을 뵈러갈까?'),]
                            ),
                            Text(' '),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('교육관 3층 안쪽', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                                  Text('으로'),]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('쭉 들어가면'),
                                  Text('오른편', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                                  Text('에'),]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('청년부 교역자실', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                                  Text('이 있어.'),]),
                          ]
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
                        return Image(image: AssetImage('assets/f3_priest.jpg'),);
                      }
                    }
                ),
                const Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10,50,10,50),
                        child: Column(
                          children: [
                            Text('항상 우리 청년들을 위해'),
                            Text('기도해주시고 섬겨주시는', style: TextStyle(color: Colors.yellow)),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('귀하신 분들', style: TextStyle(color: Colors.yellow)),
                                  Text('이야~')]),
                            Text(' '),
                            Text('우리도 교역자님들을 위해'),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('감사', style: TextStyle(color: Colors.yellow)),
                                  Text('한 마음으로')]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('함께 '),
                                  Text('기도', style: TextStyle(color: Colors.yellow)),
                                  Text('하자!')]),
                          ]
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
                              Text('문 앞 표지', style: TextStyle(color: Colors.yellow)),
                              Text('에 적혀있는')]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('말씀구절', style: TextStyle(color: Colors.yellow)),
                              Text(' 중에서')]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('직관적', style: TextStyle(color: Colors.yellow)),
                              Text('으로 해당되는')]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('분들', style: TextStyle(color: Colors.yellow)),
                              Text('은 누굴까?')]),
                        Text(''),
                        Text('옆으로 슬라이드하며'),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('해당되는 분', style: TextStyle(color: Colors.yellow)),
                              Text('을 클릭해봐.')]),
                      ],
                    )
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('인 물', style: TextStyle(color: Colors.yellow, fontSize: 30)),
                        Text(' '),
                        CarouselSlider(
                          carouselController: _controller,
                          items: imageList.map((img){
                            return Builder(
                              builder: (context){
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: ListTile(onTap: (){
                                    _clickEvent(_current);
                                    }, title: img,)
                                );
                              }
                            );
                          }).toList(),
                          options: CarouselOptions(
                            height: 300,
                            viewportFraction: 1.0,
                            autoPlay: false,
                            onPageChanged: (index, reason){
                              setState(() {
                                _current = index;
                              });
                            }
                          ),

                        ),
                        Text(''),
                        Text('최자혜 목사님', style: TextStyle(
                            color: isClickedChoi == true ? Colors.cyanAccent : Colors.white) ),
                        Text('김이삭 목사님', style: TextStyle(
                            color: isClickedIsaac == true ? Colors.cyanAccent : Colors.white) ),
                        Text('방연진 전도사님', style: TextStyle(
                            color: isClickedBang == true ? Colors.cyanAccent : Colors.white) ),
                        Text('김지환 전도사님', style: TextStyle(
                            color: isClickedKim == true ? Colors.cyanAccent : Colors.white) ),
                        Text('정민지 전도사님', style: TextStyle(
                            color: isClickedJung == true ? Colors.cyanAccent : Colors.white) ),
                      ],
                    )
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
                const Padding(
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
                              Text('교육관 계단', style: TextStyle(color: Colors.yellow)),
                              Text('을 이용해'),]
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('4층', style: TextStyle(color: Colors.yellow)),
                              Text('으로 가자!'),]
                        ),
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