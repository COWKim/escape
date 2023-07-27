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
    const SnackBar(
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
    // if(answer == '14'){
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => F2_second_page()));
    // }
    // else {
    //   showErrorMessage(context);
    // }

       Navigator.push(context, MaterialPageRoute(builder: (context) => F2_fourth_page()));
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
class F2_second_page extends StatefulWidget {
  F2_second_page({super.key});

  @override
  State<F2_second_page> createState() => _F2_second_pageState();
}

class _F2_second_pageState extends State<F2_second_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == "star" || answer == "Star" || answer == "STAR"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => F2_third_page()));
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
                      decoration: const InputDecoration(
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

// ㅡㅡㅡㅡㅡ 벧엘홀 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F2_third_page extends StatefulWidget {
  F2_third_page({super.key});

  @override
  State<F2_third_page> createState() => _F2_third_pageState();
}

class _F2_third_pageState extends State<F2_third_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == "i can do pray" || answer == "I CAN DO PRAY" || answer ==  "I can do pray"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => F2_fourth_page()));
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
                            Text('뭐라고 할지 대기해'),
                          ]
                      ),
                    )
                ),
                const Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10,300,10,250),
                        child: Column(
                          children: [
                            Text('다음 장소는'),
                            Text(' '),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('벧엘홀', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                                  Text('이야.'),]
                            ),
                          ],
                        )
                    )
                ),
                const Image(
                  image: AssetImage('assets/f2_baetel.jpg'),
                ),
                const Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10,50,10,50),
                        child: Column(
                          children: [
                            Text('이곳은 주일에'),
                            Text('통합유아부와 유아부 어린이가'),
                            Text('예배드리는 곳이야.'),
                            Text(' '),
                            Text('그리고 큰 거울이 있어서'),
                            Text('워십을 하는 사람들이'),
                            Text('이곳에서 연습을 많이 해.'),
                            Text(' '),
                            Text('그러고 보니 우리 청년부에도'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('솔라C', style: TextStyle(color: Colors.yellow)),
                                Text('라는 '),
                                Text('CCD', style: TextStyle(color: Colors.yellow)),
                                Text('팀이 있는데'),
                              ]
                            ),
                            Text('알고있었니?'),
                            Text(' '),
                            Text('관심있는 친구들은'),
                            Text('솔라C 팀장님에게 연락하기~'),
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
                              Text('와 일치하는')]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('그림', style: TextStyle(color: Colors.yellow)),
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
                              Text('문장', style: TextStyle(color: Colors.yellow)),
                              Text('이야!')]),
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
                        Image(image: AssetImage('assets/f2_recycle.png'),)
                      ],
                    )
                ),
                Container(
                    width: 320,
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
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

// ㅡㅡㅡㅡㅡ 탁아부실 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F2_fourth_page extends StatefulWidget {
  F2_fourth_page({super.key});

  @override
  State<F2_fourth_page> createState() => _F2_fourth_pageState();
}

class _F2_fourth_pageState extends State<F2_fourth_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == "해리"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => F2_fifth_page()));
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
                const Image(
                  image: AssetImage('assets/f2_taka.jpg'),
                ),
                const Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10,50,10,50),
                        child: Column(
                          children: [
                            Text('0~17개월된 아기들은'),
                            Text('이곳에서 부모님을 기다려.'),
                            Text(' '),
                            Text('아무래도 아기가 옆에 있으면'),
                            Text('예배에 집중하기 어렵고'),
                            Text('남에게 피해를 줄 수도'),
                            Text('있어서 대신 선생님들이'),
                            Text('예배시간 동안에'),
                            Text('아기들을 돌봐주고 있어.'),
                            Text(' '),
                            Text('나는 예전에'),
                            Text('탁아부에서 봉사했었는데'),
                            Text('새근새근 자고'),
                            Text('아장아장 기어다니는'),
                            Text('아기들이 얼마나 귀엽던지..'),
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

// ㅡㅡㅡㅡㅡ 아가맘예배실 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F2_fifth_page extends StatefulWidget {
  F2_fifth_page({super.key});

  @override
  State<F2_fifth_page> createState() => _F2_fifth_pageState();
}

class _F2_fifth_pageState extends State<F2_fifth_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == "GO" || answer == "Go" || answer == "go"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => F2_final_page()));
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(10,50,20,100),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('그렇다면 탁아부에'),
                        Text('맡기는게 부담이 되는'),
                        Text('부모님들은 아이와 함께'),
                        Text('어디서 예배를 드릴까?'),
                      ]
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10,200,10,100),
                  child: Image(image: AssetImage('assets/f2_babymom.jpg'), width: 350,),
                ),
                const Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10,50,10,50),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('아가맘예배실', style: TextStyle(color: Colors.yellow)),
                                  Text('이 바로'),]),
                            Text('탁아부실 맞은편에 있어.'),
                            Text(' '),
                            Text('이곳에서 아이와 함께'),
                            Text('예배도 드릴 수 있고'),
                            Text('탁아부가 가깝기 때문에'),
                            Text('아이를 맡기고 근처에서'),
                            Text('예배를 드릴 수 있어.'),
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
                              Text('의자', style: TextStyle(color: Colors.yellow)),
                              Text('가'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('무엇', style: TextStyle(color: Colors.yellow)),
                              Text('을 나타내는 걸까?'),]),
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

class F2_final_page extends StatefulWidget {
  F2_final_page({super.key});

  @override
  State<F2_final_page> createState() => _F2_final_pageState();
}

class _F2_final_pageState extends State<F2_final_page> {

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
                const Padding(
                    padding: EdgeInsets.fromLTRB(10,50,10,50),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('2층 미션을 모두 '),
                              Text('성공', style: TextStyle(color: Colors.cyanAccent)),
                              Text('했어!')]
                        ),
                        Text(' '),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('3층', style: TextStyle(color: Colors.yellow)),
                              Text('으로 '),
                              Text('GO', style: TextStyle(color: Colors.cyanAccent)),
                              Text('!'),]
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10,100,10,50),
                          child: Image(image: AssetImage('assets/f3_picture.jpg'), width: 300,),
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