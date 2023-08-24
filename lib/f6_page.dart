import 'package:escape/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_to_act/slide_to_act.dart';

// void main() {
//   runApp(const F6_page());
// }

class F6_page extends StatelessWidget {
  const F6_page({super.key, required this.route});

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
        title: 'YKD ESCAPE - 6층',
        theme: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
            ),
        ),
        //home: F2_first_page(title: '3층'),
        initialRoute: route,
        routes: {
          '1' : (context) => F6_first_page(),
          '2' : (context) => F6_second_page(),
          '3' : (context) => F6_final_page(),
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

// ㅡㅡㅡㅡㅡ 청년부 사무실 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F6_first_page extends StatefulWidget {
  const F6_first_page({super.key});

  @override
  State<F6_first_page> createState() => _F6_first_pageState();
}

class _F6_first_pageState extends State<F6_first_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    //if(answer == '←←←←↑→↑↑'){
      _nextStep();
      Navigator.pushNamed(context, '2');
    //}
    // else {
    //   showErrorMessage(context);
    //   setState(() {
    //     txtAnswer = '';
    //   });
    //}

    //   Navigator.push(context, MaterialPageRoute(builder: (context) => F6_fourth_page()));
  }

  late Future<void> _calculation = Future<void>.delayed(Duration(seconds: 1), (){},);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStep;

  Future<void> _directionHigh(Key key) async{

    if(txtAnswer.length < 10){

      setState(() {
        if(key == highSlideKey){
          txtAnswer += '↑';
        }
        else if(key == leftSlideKey){
          txtAnswer += '←';
        }
        else if(key == rightSlideKey){
          txtAnswer += '→';
        }
        else if(key == lowSlideKey){
          txtAnswer += '↓';
        }
        else{
        }
      });
    }
  }

  Future<void> _nextStep() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _playerStep = prefs.setInt('f6step', 2).then((bool success)
      { return 2;});
    });
  }

  final highSlideKey = GlobalKey<SlideActionState>();
  final lowSlideKey = GlobalKey<SlideActionState>();
  final leftSlideKey = GlobalKey<SlideActionState>();
  final rightSlideKey = GlobalKey<SlideActionState>();

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('f6step') ?? 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('6층', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
            future: _playerStep,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              else {
                return Center(child: Text(
                  '${snapshot.data}/2', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                );
              }
            }),
        centerTitle: true,
        actions: [IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
            MyHomePage())), icon: Icon(Icons.home))],
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,50,10,200),
                      child: Column(
                        children: [
                          Text('와 이제 어느덧 6층이네?'),
                          Text('계단 오르내리느라'),
                          Text('모두들 수고 많았어.'),
                          Text(''),
                          Text('이제 진짜로'),
                          Text('거의 다 왔으니까'),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('파이팅', style: TextStyle(color: Colors.yellow)),
                                Text('해보자!'),
                              ]),
                          Text(''),
                          Image(image: AssetImage('assets/f6_fighting.jpg'),),
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
                          child: Image(image: AssetImage('assets/f6_room.jpg'), width: 350,),
                        );
                      }
                    }
                ),
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,50,10,100),
                      child: Column(
                        children: [
                          Text('여기가 바로'),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('청년부 사무실', style: TextStyle(color: Colors.yellow)),
                                Text('이야.'),
                              ]),
                          Text(' '),
                          Text('청년들이 사무적인 업무나'),
                          Text('공적인 혹은 사적인 모임을 갖는'),
                          Text('공간이지.'),
                          Text(' '),
                          Text('비록 공간이 협소하고'),
                          Text('접근성이 많이 떨어지지만'),
                          Text(''),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('YKD 청년부', style: TextStyle(color: Colors.yellow)),
                                Text('를 위해'),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('이곳에 모여 '),
                                Text('예배를 준비', style: TextStyle(color: Colors.yellow)),
                                Text('하는'),
                              ]),
                          Text('청년들이 있다는 것을'),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('기억하며 '),
                                Text('감사', style: TextStyle(color: Colors.yellow)),
                                Text('하는 마음으로'),
                              ]),
                          Text('청년부 예배를 드리자.'),
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
                              Text('월중행사 및 계획표', style: TextStyle(color: Colors.yellow)),
                              Text('라고 적힌'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('화이트보드', style: TextStyle(color: Colors.yellow)),
                              Text('와 '),
                              Text('단서', style: TextStyle(color: Colors.yellow)),
                              Text('를 이용해'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('버튼을 '),
                              Text('순서대로', style: TextStyle(color: Colors.yellow)),
                              Text(' 조작해보자.'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('염광교회 홈페이지', style: TextStyle(color: Colors.yellow)),
                              Text('에'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('주보', style: TextStyle(color: Colors.yellow)),
                              Text('가 필요할거야.'),]),
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
                        Image(image: AssetImage('assets/f6_memo.PNG'),),
                        Text(' '),
                      ],
                    )
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
                    padding: EdgeInsets.all(20),
                    child: Column( children: [
                        RotatedBox(
                            quarterTurns: 1,
                            child: SizedBox(
                              width: 150,
                              child: SlideAction(
                                key: highSlideKey,
                                sliderRotate: false,
                                borderRadius: 20,
                                elevation: 0,
                                innerColor: Colors.lightGreenAccent,
                                outerColor: Colors.brown,
                                reversed: true,
                                submittedIcon: Icon(Icons.circle_outlined, color: Colors.lightGreenAccent,),
                                text: '',
                                onSubmit: (){ _directionHigh(highSlideKey);
                                  Future.delayed(const Duration(seconds: 0),
                                          (){highSlideKey.currentState!.reset();});
                                  },
                              )
                            )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              child: Container(
                                width: 180,
                                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                                child: SlideAction(
                                  key: leftSlideKey,
                                  sliderRotate: false,
                                  borderRadius: 20,
                                  elevation: 0,
                                  innerColor: Colors.lightGreenAccent,
                                  outerColor: Colors.brown,
                                  reversed: true,
                                  submittedIcon: Icon(Icons.circle_outlined, color: Colors.lightGreenAccent,),
                                  text: '',
                                  onSubmit: (){ _directionHigh(leftSlideKey);
                                  Future.delayed(const Duration(seconds: 0),
                                          (){leftSlideKey.currentState!.reset();});},
                                )
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 180,
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                child: SlideAction(
                                    key: rightSlideKey,
                                    sliderRotate: false,
                                    borderRadius: 20,
                                    elevation: 0,
                                    innerColor: Colors.lightGreenAccent,
                                    outerColor: Colors.brown,
                                    submittedIcon: Icon(Icons.circle_outlined, color: Colors.lightGreenAccent,),
                                    text: '',
                                    onSubmit: (){ _directionHigh(rightSlideKey);
                                      Future.delayed(const Duration(seconds: 0),
                                              (){rightSlideKey.currentState!.reset();});},
                                )
                              )
                            ),
                          ],
                        ),
                        RotatedBox(
                            quarterTurns: 1,
                            child: SizedBox(
                                width: 150,
                                child: SlideAction(
                                  key: lowSlideKey,
                                  borderRadius: 20,
                                  elevation: 6,
                                  sliderRotate: false,
                                  innerColor: Colors.lightGreenAccent,
                                  outerColor: Colors.brown,
                                  submittedIcon: Icon(Icons.circle_outlined, color: Colors.lightGreenAccent,),
                                  text: '',
                                  onSubmit: (){ _directionHigh(lowSlideKey);
                                    Future.delayed(const Duration(seconds: 0),
                                            (){lowSlideKey.currentState!.reset();});},
                                )
                            )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: FilledButton(
                                  onPressed: (){setState(() {
                                    txtAnswer = '';
                                  });},
                                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.brown)),
                                  child: Icon(Icons.refresh, size: 40, color: Colors.lightGreenAccent,)),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                          child: Text(txtAnswer, style: TextStyle(fontSize: 15, color: Colors.cyanAccent, letterSpacing: 5.0),),
                        )
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

// ㅡㅡㅡㅡㅡ 사무용품 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F6_second_page extends StatefulWidget {
  F6_second_page({super.key});

  @override
  State<F6_second_page> createState() => _F6_second_pageState();
}

class _F6_second_pageState extends State<F6_second_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == "popular"){
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
  late Future<int> _playerFloor;

  Future<void> _nextStep() async{
    final SharedPreferences prefs = await _prefs;
    int playerFloor = (prefs.getInt('floor') ?? 5);

    setState(() {
      prefs.setInt('f6step', 3);
      if (playerFloor == 5) {
        _playerFloor = prefs.setInt('floor', 6).then((bool success) {
          return 6;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('f6step') ?? 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('6층', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
            future: _playerStep,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              else {
                return Center(child: Text(
                  '${snapshot.data}/2', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                );
              }
            }),
        centerTitle: true,
        actions: [IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
            MyHomePage())), icon: Icon(Icons.home))],
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
                          child: Image(image: AssetImage('assets/f6_cabinet.jpg')),
                        );
                      }
                    }
                ),
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,100,20,50),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('청년부 사무실', style: TextStyle(color: Colors.yellow)),
                                Text(' 벽면에는')]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('공용물품', style: TextStyle(color: Colors.yellow)),
                                Text('과 기타 물품이 있는')]),
                          Text('캐비넷들이 있어.'),
                          Text(''),
                          Text('음.. 열어보지는 않는게 좋겠어.'),
                          Text(''),
                          Text('정리를 할 필요가 있어보이거든...')
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
                        Image(image: AssetImage('assets/f6_quiz.PNG'),),
                        Text(''), Text(''),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('아래의 '),
                              Text('사진', style: TextStyle(color: Colors.yellow)),
                              Text('과 '),
                              Text('단서', style: TextStyle(color: Colors.yellow)),
                              Text('를 이용해'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('실제 표지', style: TextStyle(color: Colors.yellow)),
                              Text('와 비교하며'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('무엇', style: TextStyle(color: Colors.yellow)),
                              Text('을 의미하는지 맞춰보자. '),]),
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
                        Text(' '),
                        Image(image: AssetImage('assets/f6_things.png'),),
                        Text(' '),
                      ],
                    )
                ),
                Container(
                    width: 220,
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
                        Text('칼 = k'),
                        Text(''),
                        Text('가위 = c'),
                        Text(''),
                        Text('마스크 = s'),
                      ],
                    )
                ),
                Container(
                    width: 300,
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      textAlign: TextAlign.center,
                      maxLength: 7,
                      decoration: const InputDecoration(
                        counterStyle: TextStyle(color: Colors.white),
                        counterText: '영어',
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

class F6_final_page extends StatefulWidget {
  F6_final_page({super.key});

  @override
  State<F6_final_page> createState() => _F6_final_pageState();
}

class _F6_final_pageState extends State<F6_final_page> {

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
        title: Text('6층', style: TextStyle(fontSize: 20),),
        leading: Icon(Icons.check, color: Colors.lightGreenAccent,),
        actions: [IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
            MyHomePage())), icon: Icon(Icons.home))],
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
                  child: Text('6층 Mission Clear!', style: TextStyle(color: Colors.cyanAccent),),
                ),
                const Padding(
                    padding: EdgeInsets.fromLTRB(10,50,10,50),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('6층 미션을 모두 '),
                              Text('성공', style: TextStyle(color: Colors.cyanAccent)),
                              Text('했어!')]
                        ),
                        Text(' '),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('5층 비전홀', style: TextStyle(color: Colors.yellow)),
                              Text('로 돌아가보자!'),]
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