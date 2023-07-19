import 'package:escape/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const First_Floor_page());
}

class First_Floor_page extends StatelessWidget {
  const First_Floor_page({super.key});

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
      home: firstFloor_first_page(title: '1층'),
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
class firstFloor_first_page extends StatefulWidget {
  const firstFloor_first_page({super.key, required this.title});

  final String title;

  @override
  State<firstFloor_first_page> createState() => _firstFloor_first_pageState();
}

class _firstFloor_first_pageState extends State<firstFloor_first_page> {
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
                              Text('을 준수해야 하는데...')]),],
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
    //  Navigator.push(context, MaterialPageRoute(builder: (context) => B1_fourth_page()));
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
