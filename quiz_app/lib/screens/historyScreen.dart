import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Home());
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizQuest',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         width: double.maxFinite,
    height: double.maxFinite,
    decoration: BoxDecoration(
      color: Color(0xD9D9D9
      ),
    ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Text('History',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32.0,
            fontWeight: FontWeight.w400,
          ),),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 344.0,
            height: 71.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

              Text('5th attempt: Pass',
               style: TextStyle(color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w700),),
              SizedBox(height: 14,),
             FloatingActionButton(onPressed: (){},
                child: Text('6/10',
                style: TextStyle(color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w700)),)
            ]),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 344.0,
            height: 71.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

             Text('5th attempt: Pass',
               style: TextStyle(color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w700),),
              SizedBox(height: 14,),
             FloatingActionButton(onPressed: (){},
                child: Text('6/10',
                style: TextStyle(color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w700)),)
            ]),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 344.0,
            height: 71.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

             Text('5th attempt: Pass',
               style: TextStyle(color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w700),),
              SizedBox(height: 14,),
             FloatingActionButton(onPressed: (){},
                child: Text('6/10',
                style: TextStyle(color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w700)),)
            ]),
          ),
          SizedBox(height: 10,),

          Container(
            height: 382.0,
            width: 342.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(205)
              )
            ),
          
          )
          
      ],)),
    );
  }
}
