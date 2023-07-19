import 'package:escape/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const F1_page());
}

class F1_page extends StatelessWidget {
  const F1_page({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YKD ESCAPE - 1층',
      theme: Theme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            fontSizeDelta: 4,
          )
      ),
      home: F1_first_page(title: '1층'),
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

// ㅡㅡㅡㅡㅡ 층별 정보판 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
class F1_first_page extends StatefulWidget {
  const F1_first_page({super.key, required this.title});

  final String title;

  @override
  State<F1_first_page> createState() => _F1_first_pageState();
}



class _F1_first_pageState extends State<F1_first_page> {
  String txtAnswer = "";

  void answerCheck(String answer){
    if(answer == "프리액션 밸브실"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => F1_second_page()));
    }
    else {
      showErrorMessage(context);
    }

    //   Navigator.push(context, MaterialPageRoute(builder: (context) => B1_fourth_page()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title, style: TextStyle(fontSize: 20),),
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
                      padding: EdgeInsets.fromLTRB(10,200,20,200),
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
                const Image(
                  image: AssetImage('assets/f1_info.jpg'),
                  width: 350,
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
                              Text('바로 옆에 보이는 '),
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
        title: Text('1층', style: TextStyle(fontSize: 20),),
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
                  padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
                  child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(180)),
                  child: Image(image: AssetImage('assets/f1_belbroom.jpg'), width: 250,),
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
                          Text('명시되어 있지 않는 것 같아.'),
                          Text(' '),
                          Text(' '),
                          Text(' '),
                          Text('다음 장소로 이동하자.'),
                        ],
                      ),
                    )
                ),
                const Image(image: AssetImage('assets/f1_creativezone.jpg'), width: 350,),
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
                const Image(image: AssetImage('assets/f1_weStudio.png'),),
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
                              Text('하고 싶은데'),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('가려진 문구', style: TextStyle(color: Colors.yellow)),
                              Text('를 보아하니'),]),
                        Text('두 곳을 사용하고 싶은데,.'),
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
        title: Text('1층', style: TextStyle(fontSize: 20),),
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
                      padding: EdgeInsets.fromLTRB(10,100,20,100),
                      child: Column(
                        children: [
                          Text('창조',),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('지금은 들어가면 '),
                                Text('안돼', style: TextStyle(color: Colors.red))],
                            ),
                            Text('내부 공간은 문제와 관련없어.'),
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
                        Text('정답을 유추해보자.')
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
                                  child: Text('2. .유다와 사이가 좋지 않아 붙어있는 걸 싫어한다.'))]),
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

class F1_fourth_page extends StatefulWidget {
  F1_fourth_page({super.key});

  @override
  State<F1_fourth_page> createState() => _F1_fourth_pageState();
}

class _F1_fourth_pageState extends State<F1_fourth_page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}