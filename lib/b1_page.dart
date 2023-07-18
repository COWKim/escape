import 'package:escape/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyB1_page());
}

class MyB1_page extends StatelessWidget {
  const MyB1_page({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YKD ESCAPE - B1층',
      theme: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          fontSizeDelta: 4,
        )
      ),
      home: B1_page(title: 'B1층'),
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
class B1_page extends StatefulWidget {
  const B1_page({super.key, required this.title});

  final String title;

  @override
  State<B1_page> createState() => _B1_pageState();
}

class _B1_pageState extends State<B1_page> {
  String txtSogroup1 = "";
  String txtSogroup2 = "";

  void answerSogroup(String firstAns, String secondAns){
    if(firstAns == "정숙" && secondAns == "분리수거"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => B1_second_page()));
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
                const Image(
                  image: AssetImage('assets/b1_sogroup.jpg'),
                  color: Colors.black38,
                  colorBlendMode: BlendMode.darken,
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('먼저 이곳으로 가보자!',),
                      Text(' '),
                      Text('여긴 성도들의 모임을 위한 장소 같아.'),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('이곳을 사용하려면 '),
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
                  child: Text('어떤 기준이 있을까?'),
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
                      Padding(
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => B1_third_page()));
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
        title: Text('B1층', style: TextStyle(fontSize: 20),),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('소그룹실', style: TextStyle(color: Colors.yellow)),
                              Text('을 사용하려면')]),
                          Text('정숙하고!', style: TextStyle(color: Colors.yellow)),
                          Text('이단 모임도 금하며!', style: TextStyle(color: Colors.yellow)),
                          Text('뒷정리도 깔끔하게 해야하는구나!', style: TextStyle(color: Colors.yellow)),
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
                const Image(image: AssetImage('assets/b1_nongin.png'),),
                const Padding(
                      padding: EdgeInsets.fromLTRB(10,50,10,50),
                      child: Column(
                        children: [
                          Text('이곳은 농인분들을 위한 예배실인가봐.'),
                          Text('이런 곳에 농인부 예배실이 있다는 건'),
                          Text('처음 알았어.'),
                          Text('나중에 농인분들께 예배실 위치를'),
                          Text('알려드릴 수 있겠다!'),
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
                      Text('문제를 풀어보자.')
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => B1_fourth_page()));
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
        title: Text('B1층', style: TextStyle(fontSize: 20),),
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
//                    mainAxisAlignment: MainAxisAlignment.center,
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
    if(answer == "1056"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => B1_final_page()));
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
        title: Text('B1층', style: TextStyle(fontSize: 20),),
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
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(180)),
                  child: Image(image: AssetImage('assets/b1_takgooload.jpg'), width: 300,),
                ),
                const Padding(
                    padding: EdgeInsets.fromLTRB(10,100,10,100),
                    child: Column(
                      children: [
                        Text('탁구는 나중에 치는 걸로 하고'),
                        Text('탁구장 앞까지 가면'),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('탁구장 사용규칙', style: TextStyle(color: Colors.yellow)),
                              Text('이')]
                        ),
                        Text('벽면에 보일거야.')
                      ],)
                ),
                const Image(
                  image: AssetImage('assets/b1_takgoo.jpg'),
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
                              Text('탁구장 사용규칙', style: TextStyle(color: Colors.yellow)),
                              Text('에서')]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('나오는 '),
                            Text('숫자', style: TextStyle(color: Colors.yellow)),
                            Text('들을 '),
                            Text('모두', style: TextStyle(color: Colors.yellow)),]),
                        Text('이용해서 식을 완성해!'),
                        Text('단,'),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('요일별 개방시간', style: TextStyle(color: Colors.redAccent)),
                              Text(' 표는')]),
                        Text('이용하지 않아.'),
                      ]
                    )
                ),
                Container(
                    width: 350,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(20),
                    child: const Column(
                      children: [
                        Text("(1) × '(1)의 개수'"),
                        Text(' × '),
                        Text("(2) × '(2)의 개수'"),
                        Text(' × '),
                        Text("[(3) + '(3)의 개수']"),
                        Text(' × '),
                        Text("'(4)의 개수'"),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('= '),
                              Text('?', style: TextStyle(color: Colors.yellow)),]),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(' '),
                            Text(' '),
                            Text('(1): 가장 많은 숫자'),
                            Text('(2): 두번째로 많은 숫자'),
                            Text('(3): 세번째로 많은 숫자'),
                            Text('(4): 네번째로 많은 숫자'),],
                        ),],
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

class B1_final_page extends StatefulWidget {
  const B1_final_page({super.key});

  @override
  State<B1_final_page> createState() => _B1_final_pageState();
}

class _B1_final_pageState extends State<B1_final_page> {

  void answerCheck(){

    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('B1층', style: TextStyle(fontSize: 20, color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(
                  image: AssetImage('assets/b1_heart.jpg')
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.cyanAccent, width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(20),
                  child: Text('B1층 Mission Clear', style: TextStyle(color: Colors.cyanAccent),),
                ),
                const Padding(
                    padding: EdgeInsets.fromLTRB(10,100,10,100),
                    child: Column(
                      children: [
                        Text('B1층 미션을 모두 성공했어!'),
                        Text('역시 대단한걸?'),
                        Text(' '),
                        Text('하트 맞은편 계단을 이용해'),
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