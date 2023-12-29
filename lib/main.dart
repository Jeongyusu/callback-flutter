import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// StatefulWidget -> 상태가 있는 위젯이다.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String childMessageContent = "여기는 부모 위젯 영역이야";

  // 자식들에게 함수를 전달하자
  // 매개변수를 받을 수 있도록 설계하자.
  // 함수에 설계 모양이 변경됨
  // (msg) {}, --> String
  // (context) {} --> BuildContext
  void onCallbackPressed(String msg){
    print("111111");
    //화면을 렌더링 하려면 -->
    //setState --> build()함수 다시 실행해!!
    setState(() {
      childMessageContent = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('부모 위젯에 빌드 함수가 다시 호출되니?');
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(child: Center(child: Text(childMessageContent))),
              Expanded(flex: 1,child: ChildA(onCallback: onCallbackPressed,)),
              Expanded(flex: 1,child: ChildB(onCallback: onCallbackPressed,)),
            ],
          ),
        ),
      ),
    );
  }
}

class ChildA extends StatelessWidget {

  final Function(String msg) onCallback;

  const ChildA({required this.onCallback, super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: (){
          onCallback('안녕 여기는 A');
        },
        child: Container(
          width: double.infinity,
          color: Colors.orange,
          child: const Center(
            child: Text('CHILD A'),
          ),
        ),
      ),
    );
  }
}

class ChildB extends StatelessWidget {
  final Function(String msg) onCallback;
  const ChildB({required this.onCallback, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: (){
          onCallback('하이 여기는 어딜까?');
        },
        child: Container(
          width: double.infinity,
          color: Colors.red,
          child: const Center(
            child: Text('CHILD A'),
          ),
        ),
      ),
    );
  }
}
