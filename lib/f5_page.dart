import 'package:escape/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(const F5_page());
// }

class F5_page extends StatelessWidget {
  const F5_page({super.key, required this.route});

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
        title: 'YKD ESCAPE - 5층',
        theme: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
            )
        ),
        //home: F2_first_page(title: '3층'),
        initialRoute: route,
        routes: {
          '1' : (context) => F5_first_page(),
          '2' : (context) => F5_second_page(),
          '3' : (context) => F5_final_page(),
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

// ㅡㅡㅡㅡㅡ 우박 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F5_first_page extends StatefulWidget {
  const F5_first_page({super.key});

  @override
  State<F5_first_page> createState() => _F5_first_pageState();
}

class _F5_first_pageState extends State<F5_first_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == 'Hail' || answer == 'hail' || answer == 'HAIL'){
      _nextStep();
      Navigator.pushNamed(context, '2');
    }
    else {
      showErrorMessage(context);
    }

    //   Navigator.push(context, MaterialPageRoute(builder: (context) => F5_fourth_page()));
  }

  late Future<void> _calculation = Future<void>.delayed(Duration(seconds: 1), (){},);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStep;

  Future<void> _nextStep() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _playerStep = prefs.setInt('f5step', 2).then((bool success)
      { return 2;});
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('f5step') ?? 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('5층', style: TextStyle(fontSize: 20),),
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
            MyApp())), icon: Icon(Icons.home))],
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // FutureBuilder<void>(
                //     future: _calculation,
                //     builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                //       if(snapshot.connectionState != ConnectionState.done){
                //         return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                //       }
                //       else{
                //         return const Padding(
                //           padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
                //           child: Image(image: AssetImage('assets/f3_picture.jpg'), width: 350,),
                //         );
                //       }
                //     }
                // ),
                Text('계단 사진 필요'),
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,50,10,100),
                      child: Column(
                        children: [
                          Text('4층으로 올라가다보면'),
                          Text('계단 옆 벽면에 글자들이'),
                          Text('주렁주렁 붙어있을 거야.'),
                          Text(''),
                          Text('내용과 같이'),
                          Text('나도 많은 청년들과'),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('교회와 나와 '),
                                Text('함께', style: TextStyle(color: Colors.yellow)),
                              ]),
                          Text('예배드릴 수 있어서'),
                          Text('기뻐!'),
                          Text(''),
                          Image(image: AssetImage('assets/f4_ogu.png'), width: 200,),
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
                              Text('아래 문제', style: TextStyle(color: Colors.yellow)),
                              Text('를 보고'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('정답', style: TextStyle(color: Colors.yellow)),
                              Text('을 유추해보자.'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('참고로 정답', style: TextStyle(color: Colors.yellow)),
                              Text('은'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('영어로 된 단어', style: TextStyle(color: Colors.yellow)),
                              Text('야.'),]),
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
                            child: Text('문 제', style: TextStyle(color: Colors.yellow, fontSize: 30))
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('난이도: '),
                            Icon(Icons.star, color: Colors.yellowAccent,),
                            Icon(Icons.star, color: Colors.yellowAccent,),
                            Icon(Icons.star, color: Colors.yellowAccent,),
                            Icon(Icons.star, color: Colors.yellowAccent,),
                            Icon(Icons.star, color: Colors.yellowAccent,),
                          ],
                        ),
                        Image(image: AssetImage('assets/f4_stair.PNG'),),
                        Text(' '),
                        Center(
                            child: Text('< 정답에 관한 힌트 >', style: TextStyle(color: Colors.yellow))
                        ),
                        Text('날씨와 관련이 있어.'),
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
                              maxLength: 4,
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

// ㅡㅡㅡㅡㅡ 유년부 사무실 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F5_second_page extends StatefulWidget {
  F5_second_page({super.key});

  @override
  State<F5_second_page> createState() => _F5_second_pageState();
}

class _F5_second_pageState extends State<F5_second_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == "510"){
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
      _playerStep = prefs.setInt('f5step', 3).then((bool success)
      { return 3;});
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('f5step') ?? 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('5층', style: TextStyle(fontSize: 20),),
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
                          Text('어때?'),
                          Text('문제는 어렵지 않았어?'),
                          Text(''),
                          Text('이제 거의 다 왔어.'),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('조금만 더 '),
                                Text('힘내자', style: TextStyle(color: Colors.yellow)),
                                Text('!'),]),
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
                                Text('엘리베이터', style: TextStyle(color: Colors.yellow)),
                                Text(' 옆에 보면')]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('유년부 사무실', style: TextStyle(color: Colors.yellow)),
                                Text('이 있을거야.')]),
                          Text('우리의 다음 장소지.'),
                          Text(''),
                          Text('사무실 사진 필요')
                        ],
                      ),
                    )
                ),
                // FutureBuilder<void>(
                //     future: _calculation,
                //     builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                //       if(snapshot.connectionState != ConnectionState.done){
                //         return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                //       }
                //       else{
                //         return const Padding(
                //           padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
                //           child: Image(image: AssetImage('assets/f3_envelopes.jpg'), width: 350,),
                //         );
                //       }
                //     }
                // ),
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,50,20,50),
                      child: Column(
                        children: [
                          Text('이 곳은 유년부 선생님들의'),
                          Text('모임 장소이자 어린이용'),
                          Text('물품들이 구비되어 있어.'),
                          Text(''),
                          Text('내가 유년부에서 봉사한지'),
                          Text('꽤나 오래됐는데'),
                          Text('아이들은 청년 선생님들을'),
                          Text('무척이나 좋아해줘.'),
                          Text(''),
                          Text('관심이 있다면'),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('섬기는 마음', style: TextStyle(color: Colors.yellow)),
                                Text('으로 함께'),]),
                          Text('봉사해보는 건 어떨까?'),
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
                              Text('아래의 '),
                              Text('사진', style: TextStyle(color: Colors.yellow)),
                              Text('과'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('단서', style: TextStyle(color: Colors.yellow)),
                              Text('를 활용해서'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('무엇', style: TextStyle(color: Colors.yellow)),
                              Text('을 의미하는지 찾고'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('RGB의 합', style: TextStyle(color: Colors.yellow)),
                              Text('이 '),
                              Text('가장 큰 번호', style: TextStyle(color: Colors.yellow)),
                              Text('의'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('RGB의 합', style: TextStyle(color: Colors.yellow)),
                              Text('을 적어보자.'),]),
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
                            child: Text('사 진', style: TextStyle(color: Colors.yellow, fontSize: 30))
                        ),
                        Text(' '),
                        Image(image: AssetImage('assets/f4_color.jpg'),),
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
                        Text('1. #dab22e'),
                        Text('2. #8ca9c9'),
                        Text('3. #55c0b8'),
                        Text('4. #c2914c'),
                        Text('5. #476d18'),
                        Text('6. #9f411b'),
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

class F5_final_page extends StatefulWidget {
  F5_final_page({super.key});

  @override
  State<F5_final_page> createState() => _F5_final_pageState();
}

class _F5_final_pageState extends State<F5_final_page> {

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
        title: Text('5층', style: TextStyle(fontSize: 20),),
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
                  child: Text('5층 Mission Clear!', style: TextStyle(color: Colors.cyanAccent),),
                ),
                const Padding(
                    padding: EdgeInsets.fromLTRB(10,50,10,50),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('5층 미션을 모두 '),
                              Text('성공', style: TextStyle(color: Colors.cyanAccent)),
                              Text('했어!')]
                        ),
                        Text(' '),
                        Text('계단을 이용해'),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('6층', style: TextStyle(color: Colors.yellow)),
                              Text('으로 올라가자!'),]
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