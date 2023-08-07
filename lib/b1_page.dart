import 'package:escape/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MyB1_page extends StatelessWidget {
  MyB1_page({super.key, required this.route});

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
      title: 'YKD ESCAPE - B1층',
      theme: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
        )
      ),
      //home: B1_first_page(),
      initialRoute: route,
      routes: {
        '1' : (context) => B1_first_page(),
        '2' : (context) => B1_second_page(),
        '3' : (context) => B1_third_page(),
        '4' : (context) => B1_fourth_page(),
        '5' : (context) => B1_final_page(),
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

// ㅡㅡㅡㅡㅡ 소그룹실 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class B1_first_page extends StatefulWidget {
  const B1_first_page({super.key});

  @override
  State<B1_first_page> createState() => _B1_first_pageState();
}

class _B1_first_pageState extends State<B1_first_page> {
  String txtSogroup1 = "";
  String txtSogroup2 = "";

  void answerSogroup(String firstAns, String secondAns){
    if(firstAns == "정숙" && secondAns == "분리수거"){
      _nextStep();
      Navigator.pushNamed(context, '2');
    }
    else {
     showErrorMessage(context);
    }

    //Navigator.push(context, MaterialPageRoute(builder: (context) => B1_final_page()));
  }

  late Future<void> _calculation = Future<void>.delayed(
    Duration(seconds: 1), (){},);

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStep;

  Future<void> _nextStep() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _playerStep = prefs.setInt('b1step', 2).then((bool success)
      { return 2;});
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('b1step') ?? 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('B1층', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
            future: _playerStep,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              else {
                return Center(child: Text(
                  '${snapshot.data}/4', style: TextStyle(fontSize: 16),)
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
                        if(snapshot.hasError){
                          return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                        }
                        else{
                          return const Image(
                          image: AssetImage('assets/b1_sogroup.jpg'),
                          color: Colors.black38,
                          colorBlendMode: BlendMode.darken,
                          );
                        }
                      }
                    }
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('먼저 소그룹실로 가보자!',),
                      Text(' '),
                      Text('여긴 성도들의 모임을 위한 장소야.'),
                      Text('이곳을 사용하려면 '),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('기준', style: TextStyle(color: Colors.yellow)),
                            Text('을 준수해야 하는데...')]),
                      ],
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
                        Text('기준', style: TextStyle(color: Colors.yellow)),
                        Text('들이 있을까?')]),
                ),
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          maxLength: 2,
                          decoration: const InputDecoration(
                            counterStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 1.0),
                                borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            labelText: '1',
                            labelStyle: TextStyle(color: Colors.yellow)),
                          onChanged: (text){txtSogroup1 = text;},
                        )
                      ),
                      const Padding(
                          padding: EdgeInsets.fromLTRB(10,0,10,25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text('2  ', style: TextStyle(color: Colors.yellow),),
                              Text('이단 모임 금지')])
                      ),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            maxLength: 4,
                            decoration: const InputDecoration(
                                counterStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                                ),
                                labelText: '3',
                                labelStyle: TextStyle(color: Colors.yellow)),
                            onChanged: (text){txtSogroup2 = text;},
                          )
                      ),
                    ],
                  )
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 300, height: 100,
                  child: ElevatedButton(onPressed: (){answerSogroup(txtSogroup1, txtSogroup2);},
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

// ㅡㅡㅡㅡㅡ 농인부 예배실 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class B1_second_page extends StatefulWidget {
  B1_second_page({super.key});

  @override
  State<B1_second_page> createState() => _B1_second_pageState();
}

class _B1_second_pageState extends State<B1_second_page> {
  String txtNongin = "";

  void answerNongin(String answer){
     if(answer == "403"){
       _nextStep();
       Navigator.pushNamed(context, '3');
      }
     else {
        showErrorMessage(context);
     }
  }

  late Future<void> _calculation = Future<void>.delayed(
    Duration(seconds: 0), (){},);

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStep;

  Future<void> _nextStep() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _playerStep = prefs.setInt('b1step', 3).then((bool success)
      { return 3;});
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('b1step') ?? 2);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('B1층', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
            future: _playerStep,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              else {
                return Center(child: Text(
                  '${snapshot.data}/4', style: TextStyle(fontSize: 16),)
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
                      padding: EdgeInsets.fromLTRB(10,100,20,100),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('소그룹실', style: TextStyle(color: Colors.yellow)),
                              Text('을 사용하려면')]),
                          Text('정숙하고!', style: TextStyle(color: Colors.yellow)),
                          Text('이단 모임도 금하며!', style: TextStyle(color: Colors.yellow)),
                          Text('뒷정리도 깔끔하게 해야돼!', style: TextStyle(color: Colors.yellow)),
                          Text(' '),
                          Text('YKD 청년부로써 꼭 명심하자!'),
                        ],
                      ),
                    )
                ),
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,200,10,250),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('다음 장소는 '),
                              Text('농인부 예배실', style: TextStyle(color: Colors.yellow)),
                              Text('이야.')]),
                          Text('소그룹실 복도로 들어가보자.',),
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
                        return const Image(image: AssetImage('assets/b1_nongin.png'),);
                      }
                    }
                ),
                const Padding(
                      padding: EdgeInsets.fromLTRB(10,50,10,50),
                      child: Column(
                        children: [
                          Text('이곳은 농인분들을 위한 예배실이야.'),
                          Text('수화로 함께 찬양하고 예배드리지.'),
                          Text(''),
                          Text('그건 그렇고'),
                          Text('정말 꼭꼭 숨겨져있네..'),
                          Text(''),
                          Text('나중에 농인분들께 예배실 위치를'),
                          Text('알려드릴 수 있을 것 같아!'),
                        ],)
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
                            Text('문에 붙어있는 '),
                            Text('표지', style: TextStyle(color: Colors.yellow)),
                            Text('를 이용해')]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('번호', style: TextStyle(color: Colors.yellow)),
                            Text('가 '),
                            Text('가리키는 것', style: TextStyle(color: Colors.yellow)),
                            Text('을')]),
                      Text('순서대로 나열해보자.')
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
                    onChanged: (text){txtNongin = text;},
                  )
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 300, height: 100,
                  child: ElevatedButton(onPressed: (){answerNongin(txtNongin);},
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


// ㅡㅡㅡㅡㅡ 중보기도실 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class B1_third_page extends StatefulWidget {
  B1_third_page({super.key});

  @override
  State<B1_third_page> createState() => _B1_third_pageState();
}

class _B1_third_pageState extends State<B1_third_page> {
  String txtGido = "";

  void answerNongin(String answer){
    if(answer == "스불론"){
      _nextStep();
      Navigator.pushNamed(context, '4');
    }
    else {
      showErrorMessage(context);
    }
  }

  late Future<void> _calculation = Future<void>.delayed(
    Duration(seconds: 0), (){},);

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStep;

  Future<void> _nextStep() async{
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _playerStep = prefs.setInt('b1step', 4).then((bool success)
      { return 4;});
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('b1step') ?? 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('B1층', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
            future: _playerStep,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              else {
                return Center(child: Text(
                  '${snapshot.data}/4', style: TextStyle(fontSize: 16),)
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
                      padding: EdgeInsets.fromLTRB(10,100,20,100),
                      child: Column(
                        children: [
                          Text('마지막 숫자가',),
                          Text('3이란 걸 눈치챘어?',),
                          Text('이 수화는 사실 미국 수화로'),
                          Text(' '),
                          Text('I Love You', style: TextStyle(color: Colors.yellow),),
                          Text(' '),
                          Text('라고 쓰인다고 해.'),
                          Text(' '),
                          Image(image: AssetImage('assets/b1_iloveyou.png'), width: 300, height: 300,),
                          Text('모두들 사랑해', style: TextStyle(color: Colors.pink),),
                        ],
                      ),
                    )
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10,200,10,250),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('다음 장소는 '),
                        Text('중보기도실', style: TextStyle(color: Colors.yellow)),
                        Text('이야.')]
                    )
                  )
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10,250,10,250),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('내부 공간은 문제와 관련 없으니까'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('지금은 들어가면 '),
                            Text('안돼!', style: TextStyle(color: Colors.red))],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('그리고 '),
                            Text('정숙', style: TextStyle(color: Colors.yellow)),
                            Text('해야돼.')]
                        ),
                        Text(' '),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('주님과 '),
                            Text('소통', style: TextStyle(color: Colors.yellow)),
                            Text('하는 공간이거든!')]
                        ),],
                    )
                  )
                ),
                const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(180)),
                    child: Image(image: AssetImage('assets/b1_gido.jpg'), width: 300,),
                  ),
                const Padding(
                    padding: EdgeInsets.fromLTRB(10,50,10,50),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('나중에 정말 '),
                              Text('주님이 간절할 때', style: TextStyle(color: Colors.yellow))],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('기도', style: TextStyle(color: Colors.yellow)),
                            Text('하기 위해 사용해보자!')]
                        ),
                        Text(' '),
                        Text('우리는 하루에 과연'),
                        Text('얼마나 기도하고 있을까?'),
                        Text(' '),
                        Text('일단 나부터 회개해야겠는걸.'),
                      ],)
                ),
                const Image(
                  image: AssetImage('assets/b1_gidoroom.png'),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(20),
                  child: const Column(
                    children: [
                      Text('방의 이름들이 지워져있다.'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('그림', style: TextStyle(color: Colors.yellow)),
                          Text('의 원본을 찾아서')]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('그림', style: TextStyle(color: Colors.yellow)),
                          Text('과 '),
                          Text('단서', style: TextStyle(color: Colors.yellow)),
                          Text('를 이용해')]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('어떤 방', style: TextStyle(color: Colors.yellow)),
                            Text('을 가리키는지')]),
                      Text('유추해보자.'),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                child: Text('1. 납달리보다 낮은 사람이자 요셉보다 높은 사람이다.'))]),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                child: Text('2. 유다와 사이가 좋지 않아 붙어있는 걸 싫어한다.'))]),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                child: Text('3. ‘ㅏ’ 발음이 필요없다.'))]),
                    ],
                  )
                ),
                Container(
                    width: 300,
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      textAlign: TextAlign.center,
                      maxLength: 5,
                      decoration: const InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      onChanged: (text){txtGido = text;},
                    )
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 300, height: 100,
                  child: ElevatedButton(onPressed: (){answerNongin(txtGido);},
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


// ㅡㅡㅡㅡㅡ 탁구장 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class B1_fourth_page extends StatefulWidget {
  B1_fourth_page({super.key});

  @override
  State<B1_fourth_page> createState() => _B1_fourth_pageState();
}

class _B1_fourth_pageState extends State<B1_fourth_page> {
  String txtTakgoo = "";

  void answerCheck(String answer){
    if(answer == "768"){
      _nextFloor();
      Navigator.pushNamed(context, '5');
    }
    else {
      showErrorMessage(context);
    }
  }

  late Future<void> _calculation = Future<void>.delayed(
    Duration(seconds: 0), (){},);

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _playerStep;
  late Future<int> _playerFloor;

  Future<void> _nextFloor() async {
    final SharedPreferences prefs = await _prefs;
    int playerFloor = (prefs.getInt('floor') ?? 0) + 1;

    setState(() {
      prefs.setInt('b1step', 5);
      if (playerFloor == 1) {
        _playerFloor = prefs.setInt('floor', playerFloor).then((bool success) {
          return playerFloor;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _playerStep = _prefs.then((SharedPreferences prefs) => prefs.getInt('b1step') ?? 4);
    _playerFloor = _prefs.then((SharedPreferences prefs) => prefs.getInt('floor') ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('B1층', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
            future: _playerStep,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              else {
                return Center(child: Text(
                  '${snapshot.data}/4', style: TextStyle(fontSize: 16),)
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
                const Padding(
                    padding: EdgeInsets.fromLTRB(10,50,10,50),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('정답은 '),
                            Text('스불론', style: TextStyle(color: Colors.yellow)),
                            Text('이야.')]
                        ),
                        Text(' '),
                        Text('스불론의 뜻은'),
                        Text('후한 선물', style: TextStyle(color: Colors.yellow)),
                        Text('이라고 해.'),
                        Text(' '),
                        Text('우리도 모두 마찬가지로'),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('귀한 선물', style: TextStyle(color: Colors.yellow)),
                              Text('이야~')]
                        ),
                        Text(' '),
                        Image(image: AssetImage('assets/b1_present.png'), width: 300,),
                        Text(' '),
                        Text('스불론이 더 궁금하다면'),
                        Text('창세기를 참고하거나'),
                        Text('인터넷을 이용하도록 해.')
                      ],)
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10,200,10,200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('다음 장소는 '),
                            Text('탁구장', style: TextStyle(color: Colors.yellow)),
                            Text('이야.')]),
                        Text(' '),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('이전에 썼던 '),
                            Text('그림', style: TextStyle(color: Colors.yellow)),
                            Text('을 보면')]
                        ),
                        Text('탁구장의 위치를 알 수 있어.'),
                      ]
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
                        return const ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(180)),
                          child: Image(image: AssetImage('assets/b1_takgooload.jpg'), width: 300,),
                        );
                      }
                    }
                ),
                const Padding(
                    padding: EdgeInsets.fromLTRB(10,100,10,100),
                    child: Column(
                      children: [
                        Text('탁구장을 잘 찾았어?'),
                        Text(' '),
                        Text('탁구장 앞까지 가면'),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('탁구장 사용규칙', style: TextStyle(color: Colors.yellow)),
                              Text('이')]
                        ),
                        Text('벽면에 보일거야.'),
                        Text(' '),
                        Text('시간 될 때'),
                        Text('나중에 탁구 한판 어때?')
                      ],)
                ),
                FutureBuilder<void>(
                    future: _calculation,
                    builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                      if(snapshot.connectionState != ConnectionState.done){
                        return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                      }
                      else{
                        return const Image(
                          image: AssetImage('assets/b1_takgoo.jpg'));
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
                              Text('탁구장 사용규칙 표지', style: TextStyle(color: Colors.yellow)),
                              Text('에')]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('숫자', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                            Text('들을 '),
                            Text('모두', style: TextStyle(color: Colors.yellow)),
                            Text(' 찾고'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('아래 '),
                              Text('수식', style: TextStyle(color: Colors.yellow)),
                              Text('에 대입하여'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('답', style: TextStyle(color: Colors.yellow)),
                              Text('을 구해보자!'),]),
                        Text('단,'),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('요일별 개방시간', style: TextStyle(color: Colors.redAccent)),
                              Text('은')]),
                        Text('전부 이용하지 않아.'),
                      ]
                    )
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(10),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('(1) = 가장 많은 숫자'),
                        Text('(2) = 두번째로 많은 숫자'),
                        Text('(3) = 세번째로 많은 숫자'),
                        Text('(4) = 네번째로 많은 숫자'),],
                    )
                ),
                Container(
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(10),
                    child: const Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
                            child: Text('수식', style: TextStyle(color: Colors.yellow, fontSize: 20),),),
                        Text("(1) × '(1)의 개수'"),
                        Text('\n × \n'),
                        Text("(2) × '(2)의 개수'"),
                        Text('\n × \n'),
                        Text("(3) × '(3)의 개수'"),
                        Text('\n × \n'),
                        Text("'(4)의 개수'\n"),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('= '),
                              Text('?', style: TextStyle(color: Colors.yellow)),]),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Text(' '),
                        //     Text(' '),
                        //     Text('(1): 가장 많은 숫자'),
                        //     Text('(2): 두번째로 많은 숫자'),
                        //     Text('(3): 세번째로 많은 숫자'),
                        //     Text('(4): 네번째로 많은 숫자'),],
                        // ),
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
                      onChanged: (text){txtTakgoo = text;},
                    )
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 300, height: 100,
                  child: ElevatedButton(onPressed: (){answerCheck(txtTakgoo);},
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

// ㅡㅡㅡㅡㅡ 마지막 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class B1_final_page extends StatefulWidget {
  const B1_final_page({super.key});

  @override
  State<B1_final_page> createState() => _B1_final_pageState();
}

class _B1_final_pageState extends State<B1_final_page> {

  void answerCheck(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  late Future<void> _calculation = Future<void>.delayed(
    Duration(seconds: 0), (){},);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('B1층', style: TextStyle(fontSize: 20, color: Colors.white),),
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
                  child: Text('B1층 Mission Clear!', style: TextStyle(color: Colors.cyanAccent),),
                ),
                FutureBuilder<void>(
                    future: _calculation,
                    builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                      if(snapshot.connectionState != ConnectionState.done){
                        return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                      }
                      else{
                        return const Image(image: AssetImage('assets/b1_heart.jpg'));
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
                              Text('B1층 미션을 모두 '),
                              Text('성공', style: TextStyle(color: Colors.cyanAccent)),
                              Text('했어!')]
                        ),
                        Text('역시 대단한걸?'),
                        Text(' '),
                        Text('사진에 보이는 하트'),
                        Text('맞은편 계단을 이용해'),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('1층', style: TextStyle(color: Colors.yellow)),
                              Text('으로 올라가보자.')]
                        )
                      ],)
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 300, height: 100,
                  child: ElevatedButton(onPressed: () => answerCheck(),
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