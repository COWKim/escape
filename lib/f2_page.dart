import 'package:escape/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const F2_page());
}

class F2_page extends StatelessWidget {
  const F2_page({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YKD ESCAPE - 2층',
      theme: Theme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            fontSizeDelta: 4,
          )
      ),
      home: F2_first_page(title: '2층'),
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

Future answerCheck(String text, String answer, BuildContext context, StatefulWidget page) async{
  if (text == answer) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
  else {
    showErrorMessage(context);
  }
}

// ㅡㅡㅡㅡㅡ 세계선교현황 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F2_first_page extends StatefulWidget {
  const F2_first_page({super.key, required this.title});

  final String title;

  @override
  State<F2_first_page> createState() => _F2_first_pageState();
}

class _F2_first_pageState extends State<F2_first_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == '14'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => F1_second_page()));
    }
    else {
      showErrorMessage(context);
    }

    //   Navigator.push(context, MaterialPageRoute(builder: (context) => F1_fifth_page()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title, style: TextStyle(fontSize: 20),),
        leading: IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
            MyApp())),
          icon: const Icon(Icons.arrow_back),),
        centerTitle: true,
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
                  child: Image(
                    image: AssetImage('assets/f2_international.jpg'),
                    width: 350,
                  ),
                ),
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,10,10,200),
                      child: Column(
                        children: [
                          Text('2층에 올라오니까'),
                          Text('가장 먼저 보이는게'),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('세계선교현황', style: TextStyle(color: Colors.yellow)),
                                Text(' 판이야.')]),
                          Text(' '),
                          Text('우리 교회가'),
                          Text('복음을 전하거나 후원하는'),
                          Text('나라들이 엄청 많다.'),
                          Text(' '),
                          Text('혹시 우리 교회 사명이'),
                          Text('"민족 복음화, 세계선교!"', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                          Text('인 건 다들 알지?'),
                          Text(' '),
                          Text('몰랐다면 오늘부터 기억하기.'),
                          Text('그리고 실천해 나아가자!'),
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
                  child: const Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('세계선교현황판', style: TextStyle(color: Colors.yellow)),
                            Text('과')]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('단서', style: TextStyle(color: Colors.yellow)),
                            Text('를 참고하여')]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('?', style: TextStyle(color: Colors.yellow)),
                            Text('를 유추해보자.'),]),
                    ],
                  )
                ),
                Container(
                  width: 200,
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
                      Text('1 = 7'),
                      Text('1 = 10'),
                      Text('10 = 9'),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('4 = '),
                            Text('?', style: TextStyle(color: Colors.yellow)),]
                      ),
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

// ㅡㅡㅡㅡㅡ 국내선교현황 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F1_second_page extends StatefulWidget {
  F1_second_page({super.key});

  @override
  State<F1_second_page> createState() => _F1_second_pageState();
}

class _F1_second_pageState extends State<F1_second_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == "star" || answer == "Star" || answer == "STAR"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => F1_third_page()));
    }
    else {
      showErrorMessage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('2층', style: TextStyle(fontSize: 20),),
        centerTitle: true,
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
                  child: Image(image: AssetImage('assets/f2_domestic.jpg'), width: 350,),
                  ),
                const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,50,20,100),
                      child: Column(
                        children: [
                          Text('바로 옆면에는'),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('국내선교현황', style: TextStyle(color: Colors.yellow)),
                                Text('판도 있어.')]),
                          Text(''),
                          Text('해외 뿐만 아니라'),
                          Text('국내 선교 및 후원도'),
                          Text('열심히 하고 있구나!'),
                          Text(''),
                          Text('역시 창동염광교회 대단해~'),
                          Text(''),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(180)),
                            child: Image(image: AssetImage('assets/f2_goodjob.gif'), width: 250,)
                          ),
                          Text(''),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('우리가 교회를 더욱 '),
                                Text('사랑', style: TextStyle(color: Colors.yellow)),
                                Text('해주자!'),]),
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
                    child: const Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('국내선교현황판', style: TextStyle(color: Colors.yellow)),
                              Text('과')]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('단서', style: TextStyle(color: Colors.yellow)),
                              Text('를 참고하여')]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('무엇', style: TextStyle(color: Colors.yellow)),
                              Text('을 나타내는지'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('영어', style: TextStyle(color: Colors.yellow)),
                              Text('로 적어보자.'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('참고로 '),
                              Text('순서', style: TextStyle(color: Colors.yellow)),
                              Text('가 중요해.'),]),
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
                        Text('밝은빛 새길교회'),
                        Text('덕수돌 작은 교회'),
                        Text('세곡 교회'),
                        Text('창대 교회'),
                        Text('초원 교회'),
                        Text('꿈이 있는 교회'),
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => F1_fourth_page()));
    }
    else {
      showErrorMessage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('2층', style: TextStyle(fontSize: 20),),
        centerTitle: true,
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
                          Image(image: AssetImage('assets/f1_create.jpg'), width: 250,),
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
                          Text("다른 하나는 '함께'였지,"),
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
                const Image(
                  image: AssetImage('assets/f1_cabinet.jpg'),
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
                      children: [
                        Center(
                            child: Text('단 서 2', style: TextStyle(color: Colors.yellow, fontSize: 30))
                        ),
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => F1_fifth_page()));
    }
    else {
      showErrorMessage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('2층', style: TextStyle(fontSize: 20),),
        centerTitle: true,
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
                            Text('기억해주면 좋겠어 :)'),
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
                const Image(
                  image: AssetImage('assets/f1_moon.jpg'),
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
                            Text('이렇게 읽어보니까'),
                            Text('우리의 방향성이'),
                            Text('더 확실해진 것 같아!'),
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
                              Text('정답', style: TextStyle(color: Colors.yellow)),
                              Text('을 유추해보자.')]),
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => F1_final_page()));
    }
    else {
      showErrorMessage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('2층', style: TextStyle(fontSize: 20),),
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
                            Text('그리고'),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('아직 '),
                                  Text('2층', style: TextStyle(color: Colors.yellow)),
                                  Text('이라는 사실도..'),]
                            ),
                            Text(' '),
                            Text('파이팅!', style: TextStyle(color: Colors.cyanAccent)),
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
                                  Text('로뎀', style: TextStyle(color: Colors.yellow)),
                                  Text('을 지나'),]
                            ),
                            Text(' '),
                            Text(' '),
                            Image(image: AssetImage('assets/f1_rodemRoad.jpg'), width: 350,),
                            Text(' '),
                            Text(' '),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('권사 기도실', style: TextStyle(color: Colors.yellow)),
                                  Text('쪽으로 가야해!'),]
                            ),
                          ],
                        )
                    )
                ),
                const Image(
                  image: AssetImage('assets/f1_bus.jpg'),
                ),
                const Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10,50,10,50),
                        child: Column(
                          children: [
                            Text('그럼 다음과 같은'),
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
                    width: 280,
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
                            Text('도봉중학교 = 7'),
                            Text('도봉중학교 = 5'),
                            Text(' '),
                            Row(
                                children: [
                                  Text('번동주공2단지 = '),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('2층', style: TextStyle(fontSize: 20),),
        leading: IconButton(onPressed: () =>
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
            const MyApp())),
          icon: const Icon(Icons.arrow_back),),
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
                  child: Text('2층 Mission Clear!', style: TextStyle(color: Colors.cyanAccent),),
                ),
                const Image(
                    image: AssetImage('assets/f1_stair.jpg')
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
                              Text('2층 미션을 모두 '),
                              Text('성공', style: TextStyle(color: Colors.cyanAccent)),
                              Text('했어!')]
                        ),
                        Text(' '),
                        Text('위 계단을 이용해'),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('3층', style: TextStyle(color: Colors.yellow)),
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