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

class B1_page extends StatefulWidget {
  const B1_page({super.key, required this.title});

  final String title;

  @override
  State<B1_page> createState() => _B1_pageState();
}

Future showErrorMessage(BuildContext context) async{
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('틀렸습니다.'),
        duration: Duration(seconds: 1),
      ),
  );
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
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('먼저 이곳으로 가보자!',),
                      Text('이곳은 성도들의 모임을 위한 장소 같아'),
                      Text('이곳을 사용하려면 기준을 준수해야하는데..'),
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

class B1_second_page extends StatefulWidget {
  B1_second_page({super.key});

  @override
  State<B1_second_page> createState() => _B1_second_pageState();
}

class _B1_second_pageState extends State<B1_second_page> {
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
                // const Image(
                //   image: AssetImage('assets/b1_sogroup.jpg'),
                //   color: Colors.black38,
                //   colorBlendMode: BlendMode.darken,
                // ),
                Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('먼저 이곳으로 가보자!',),
                          Text('이곳은 성도들의 모임을 위한 장소 같아'),
                          Text('이곳을 사용하려면 기준을 준수해야하는데..'),
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
                Container(
                  padding: EdgeInsets.all(20),
                  width: 300, height: 100,
                  child: ElevatedButton(onPressed: (){},
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