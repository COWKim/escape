import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class Hint_page extends StatelessWidget {
  const Hint_page({super.key, required this.route});

  final String route;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YKD ESCAPE',
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.3),
          child: child!,
        );
      },
      theme: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
        ),
      ),
      initialRoute: route,
      routes: {
        // B1층
        '2839' : (context) => Hint_state(route: '2839'), '3417' : (context) => Hint_state(route: '3417'),
        '8253' : (context) => Hint_state(route: '8253'), '5861' : (context) => Hint_state(route: '5861'),
        // 1층
        '7851' : (context) => Hint_state(route: '7851'), '2984' : (context) => Hint_state(route: '2984'),
        '8695' : (context) => Hint_state(route: '8695'), '0852' : (context) => Hint_state(route: '0852'),
        '8942' : (context) => Hint_state(route: '8942'),
        // 2층
        '9353' : (context) => Hint_state(route: '9353'), '6359' : (context) => Hint_state(route: '6359'),
        '7834' : (context) => Hint_state(route: '7834'), '8560' : (context) => Hint_state(route: '8560'),
        '2960' : (context) => Hint_state(route: '2960'),
        // 3층
        '3486' : (context) => Hint_state(route: '3486'), '6846' : (context) => Hint_state(route: '6846'),
        '0855' : (context) => Hint_state(route: '0855'), '3843' : (context) => Hint_state(route: '3843'),
        // 4층
        '7634' : (context) => Hint_state(route: '7634'), '5073' : (context) => Hint_state(route: '5073'),
        '8566' : (context) => Hint_state(route: '8566'), '4583' : (context) => Hint_state(route: '4583'),
        // 5층
        '7863' : (context) => Hint_state(route: '7863'), '2912' : (context) => Hint_state(route: '2912'),
        // 6층
        '1964' : (context) => Hint_state(route: '1964'), '5762' : (context) => Hint_state(route: '5762'),
        // 이스터에그
        '1022' : (context) => Hint_state(route: '1022'), '0729' : (context) => Hint_state(route: '0729'),
        '0822' : (context) => Hint_state(route: '0822'), '0312' : (context) => Hint_state(route: '0312'),
      }
    );
  }
}

class Hint_state extends StatefulWidget {
  Hint_state({super.key, required this.route});

  final String route;

  @override
  State<Hint_state> createState() => _Hint_pageState(route);
}

class _Hint_pageState extends State<Hint_state> {
  _Hint_pageState(String route);

  // Future<void> _calculation = Future<void>.delayed(
  //   Duration(seconds: 0),
  //       (){},
  // );

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _hintCount;

  @override
  void initState() {
    super.initState();
    _hintCount = _prefs.then((SharedPreferences prefs) => prefs.getInt('hint') ?? 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('HINT', style: TextStyle(fontSize: 20),),
        leading: FutureBuilder(
            future: _hintCount,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              else {
                return Center(child: Text(
                  '${snapshot.data}', style: TextStyle(fontSize: 16),)
                );
              }
            }),
        centerTitle: true,
        actions: [IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
            MyHomePage())), icon: Icon(Icons.home))],
      ),
      body: Container(
        height: 1000,
        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/login.png'), colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)),),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FutureBuilder(
                  future: _hintCount,
                  builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                    if(snapshot.connectionState != ConnectionState.done){
                      return Center(child: CircularProgressIndicator(color: Colors.lightGreenAccent,));
                    }
                    else{
                      // B1층
                      if(widget.route == '2839'){
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(30,100,30,100),
                            child: Wrap(
                              direction: Axis.horizontal,
                                alignment: WrapAlignment.start,
                                runSpacing: 5,
                                children: [
                                  Text('소그룹실 복도로 들어가기 전에 '),
                                  Text('오른쪽 벽', style: TextStyle(color: Colors.yellow)),
                                  Text('에 보면 '),
                                  Text('소그룹실 사용 기준', style: TextStyle(color: Colors.yellow)),
                                  Text('이란'), Text(' 표지가 붙어있을거야.'),
                                ]
                            ),
                          )
                        );
                      }
                      else if(widget.route == '3417'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('번호에 가려진 것들을 "'),
                                    Text('숫자', style: TextStyle(color: Colors.yellow)),
                                    Text('" 로 '), Text('바라보면'), Text(' 어떻게 보일까?'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '8253'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('중보기도실 방의 이름들 '),
                                    Text('위치', style: TextStyle(color: Colors.yellow)),
                                    Text('를'), Text(' 잘 봐봐. '),
                                    Text('위치 관계', style: TextStyle(color: Colors.yellow)),
                                    Text('와'), Text(' 관련되어 있어.'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '5861'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('한글', style: TextStyle(color: Colors.yellow)),
                                    Text('로 된 모든 '),
                                    Text('숫자', style: TextStyle(color: Colors.yellow)),
                                    Text('들을 찾아야해. "'),
                                    Text('하나 둘 셋 넷"', style: TextStyle(color: Colors.yellow)),
                                    Text(' 처럼 셀 수도 있고, "'),
                                    Text('일 이 삼 사', style: TextStyle(color: Colors.yellow)),
                                    Text('" 처럼 셀 수도 있지.'),
                                  ]
                              ),
                            )
                        );
                      }
                      // 1층
                      else if(widget.route == '7851'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('왼쪽에 쓰레기통이 있는 벽면에 보면 문 하나가 있을거야. '
                                        '그 문에 뭐라고 적혀있어?'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '2984'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('1층 Studio에는 '),
                                    Text('편집실', style: TextStyle(color: Colors.yellow)),
                                    Text('이'), Text(' 5곳이 있어. '), Text('각 편집실마다 '),
                                    Text('이름', style: TextStyle(color: Colors.yellow)),
                                    Text('도 적혀있지.'), Text(' 그 '),
                                    Text('이름', style: TextStyle(color: Colors.yellow)),
                                    Text('과 가려진 문구에 나온 '),
                                    Text('순서', style: TextStyle(color: Colors.yellow)),
                                    Text('와 '), Text('관련지어봐.'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '8695'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('점자를 보면 '),
                                    Text('6칸', style: TextStyle(color: Colors.yellow)),
                                    Text('으로 나눠서 볼 수 있어. 해당 '),
                                    Text('번호를 점이라 생각', style: TextStyle(color: Colors.yellow)),
                                    Text('하고'), Text(' 방향을 참고해서'), Text(' 조합해보면 '),
                                    Text('글자', style: TextStyle(color: Colors.yellow)),
                                    Text('가 '), Text('완성될거야.'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '0852'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('검은 색의 모양들이 염광비전 선언문에 나와있는 '),
                                    Text('문단', style: TextStyle(color: Colors.yellow)),
                                    Text('의 모양과 '), Text('비슷한 걸 찾아봐.'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '8942'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('단서에 나와있는 숫자는 단서에 나와있는 장소부터 교회까지'
                                        ' 카운트한 숫자야.'),
                                  ]
                              ),
                            )
                        );
                      }
                      // 2층
                      else if(widget.route == '9353'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('왼쪽의 숫자는 '),
                                        Text('녹색 ', style: TextStyle(color: Colors.greenAccent)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('오른쪽의 숫자는 '),
                                        Text('빨간색', style: TextStyle(color: Colors.redAccent)),
                                      ],
                                    )

                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '6359'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('교회를 순서대로 선을 그려 연결해봐. 어떤 모양이 보여?'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '7834'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('괄호안에 숫자는 몇번째 해당하는 알파벳인지를 의미해.'
                                        ' 적혀있지 않다면 그건 전부를 가리키는 것이겠지? '
                                        '방향대로 알파벳을 잘 돌려보기도 해봐.'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '8560'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('벽면에 있는 "'),
                                    Text('축복합니다', style: TextStyle(color: Colors.yellow)),
                                    Text('" 을'), Text(' 이용해 '), Text('색깔과 순서를 '), Text('조합해봐.'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '2960'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('방향이 다른 의자들을 크게 보면 어떤 글씨를 띄고 있을까?'),
                                  ]
                              ),
                            )
                        );
                      }
                      // 3층
                      else if(widget.route == '3486'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('인터넷에 아들의 귀환을 검색해봐. 아마 "'),
                                    Text('아들', style: TextStyle(color: Colors.yellow)),
                                    Text('" 이 '), Text(' 다른 단어일거야. ')
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '6846'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('시계에 있는 숫자들 주변을 눈 크게 뜨고 잘 살펴봐. 어느 곳에 위치한 숫자인지 보일거야.'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '0855'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('이어진 별들을 하나하나 그려보면 '),
                                    Text('한자', style: TextStyle(color: Colors.yellow)),
                                    Text('가 '), Text('보이지 않아?'), Text('거꾸로'), Text(' 된 것에'),
                                    Text('주의해!'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '3843'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('시편133:1에 나오는 사람을 지칭하는 단어가 있어. '
                                        '그 단어에 해당하는 사람을 선택해봐.'),
                                  ]
                              ),
                            )
                        );
                      }
                      // 4층
                      else if(widget.route == '7634'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('이어진 별들을 하나하나 그려보면 '),
                                    Text('한자', style: TextStyle(color: Colors.yellow)),
                                    Text('가 '), Text('보이지 않아?'), Text('거꾸로'), Text(' 된 것에'),
                                    Text('주의해!'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '5073'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('이어진 별들을 하나하나 그려보면 '),
                                    Text('한자', style: TextStyle(color: Colors.yellow)),
                                    Text('가 '), Text('보이지 않아?'), Text('거꾸로'), Text(' 된 것에'),
                                    Text('주의해!'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '8566'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('이어진 별들을 하나하나 그려보면 '),
                                    Text('한자', style: TextStyle(color: Colors.yellow)),
                                    Text('가 '), Text('보이지 않아?'), Text('거꾸로'), Text(' 된 것에'),
                                    Text('주의해!'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '4583'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('이어진 별들을 하나하나 그려보면 '),
                                    Text('한자', style: TextStyle(color: Colors.yellow)),
                                    Text('가 '), Text('보이지 않아?'), Text('거꾸로'), Text(' 된 것에'),
                                    Text('주의해!'),
                                  ]
                              ),
                            )
                        );
                      }
                      // 5층
                      else if(widget.route == '7863'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('이어진 별들을 하나하나 그려보면 '),
                                    Text('한자', style: TextStyle(color: Colors.yellow)),
                                    Text('가 '), Text('보이지 않아?'), Text('거꾸로'), Text(' 된 것에'),
                                    Text('주의해!'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '2912'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('이어진 별들을 하나하나 그려보면 '),
                                    Text('한자', style: TextStyle(color: Colors.yellow)),
                                    Text('가 '), Text('보이지 않아?'), Text('거꾸로'), Text(' 된 것에'),
                                    Text('주의해!'),
                                  ]
                              ),
                            )
                        );
                      }
                      // 6층
                      else if(widget.route == '1964'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('이어진 별들을 하나하나 그려보면 '),
                                    Text('한자', style: TextStyle(color: Colors.yellow)),
                                    Text('가 '), Text('보이지 않아?'), Text('거꾸로'), Text(' 된 것에'),
                                    Text('주의해!'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '5762'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 5,
                                  children: [
                                    Text('이어진 별들을 하나하나 그려보면 '),
                                    Text('한자', style: TextStyle(color: Colors.yellow)),
                                    Text('가 '), Text('보이지 않아?'), Text('거꾸로'), Text(' 된 것에'),
                                    Text('주의해!'),
                                  ]
                              ),
                            )
                        );
                      }
                      // 이스터에그
                      else if(widget.route == '1022'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child:  Column(
                                children: [
                                  Text('치즈케이크 태어난 날', style: TextStyle(color: Colors.cyanAccent)),
                                  Text(''),
                                  Text('치즈케이크 원래 잘 안먹는데'),
                                  Text('치즈케이크 먹으러 갈래?'),
                                  Text(''),Text(''),Text(''),Text(''),Text(''),
                                  Text('치즈케이크 보고싶다..'),
                                ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '0729'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Column(
                                  children: [
                                    Text('나에게 한번더 기회가 있다면'),
                                    Text('그 때로 돌아가'),
                                    Text('좋은 사람을 놓치고 싶지 않다.'),
                                    Text(''),
                                    Text('처음으로 나에게'),
                                    Text('어른스러운 연애의 모습과'),
                                    Text('내 마음 속 진심어린 사랑을'),
                                    Text('느끼게 해주었다.'),
                                    Text(''),
                                    Text('나의 모습들을'),
                                    Text('하나하나 알아주고 이해해주려는'),
                                    Text('사람이었다.'),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text('이런 사랑, 이런 사람'),
                                    Text('너무 귀하기에'),
                                    Text('이 날의 고백이 후회되지 않는다.'),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text('지금도 그 마음이 진심인걸 아니까.'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '0822'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Column(
                                  children: [
                                    Text('못해줘서 미안하다는 말보단'),
                                    Text('잘해주고 싶은 마음이 더 크다.'),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text('뚝딱거리던 나의 시절'),
                                    Text('다 지나가고'),
                                    Text('이제서야 널 제대로 볼 수 있는데...'),
                                    Text('행복하게만 해주고 싶은데...'),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text('지금 내가 정말 사랑하는 사람에게'),
                                    Text('힘들 때 옆에 있어주고 싶고'),
                                    Text('도움이 필요할 땐 도움이 되고싶다.'),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text('은주야'),
                                    Text(''),
                                    Text('잘 못해줄 것 같단 마음으로'),
                                    Text('자신없어 하지마.'),
                                    Text('옆에 있어주는 거'),
                                    Text('그거면 충분해.'),
                                    Text(''),
                                    Text('이미 너의 존재 자체가'),
                                    Text('나에게 가장 큰 행복이자'),
                                    Text('나에게 가장 소중한 존재야.'),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text('그러니까 언제든지 와.'),
                                    Text('누가 뭐라고 하던'),
                                    Text('난 언제나 너의 편이니까.'),
                                    Text(''),
                                    Text('하고싶은 얘기 다 들어줄게.'),
                                    Text('우직하게 너의 곁을 지킬게.'),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text(''), Text(''), Text(''), Text(''),
                                    Text('사랑해'),
                                    Text('아주 많이'),
                                  ]
                              ),
                            )
                        );
                      }
                      else if(widget.route == '0312'){
                        return const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30,100,30,100),
                              child: Column(
                                  children: [
                                    Text('내가 태어난 날', style: TextStyle(color: Colors.cyanAccent)),
                                    Text(''),
                                    Text('누군가 생일을 기억해준다는 건'),
                                    Text('정말 행복한 일이야~'),
                                  ]
                              ),
                            )
                        );
                      }
                      else{
                        return Text('ERROR');
                      }
                    }
                  }
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                  width: 300, height: 100,
                  child: ElevatedButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                      MyHomePage())),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[800]),
                    child: Text('확인'),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                //   child: Text('Produced by Poszer Kim', style: TextStyle(color: Colors.white),),
                // )
              ],
            ),
          )
        ),
      )
    );
  }
}