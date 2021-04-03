import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:toast/toast.dart';

Timer timer;
// import 'package:flutter_dialogflow/dialogflow_v2.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final messageInsert = TextEditingController();
  final String check = "just checking";
  final int time = 30;
  List<Map> messsages = List();
  String tex = "";
  bool pressed1 = false;

  int btn = 2;
  int i = 0;
  int btn2 = 3;

  changeText() {
    setState(() {
      tex = 'sub category 1';
    });
  }

  @override
  void initState() {
    setState(() {
      btn = 1;
      messsages.insert(0,
          {"data": 0, "message": "Hello user"});

      messsages.insert(0,
          {"data": 0, "message": "Hope you are doing well..."});
      messsages.insert(0,
          {"data": 0, "message": "Select your category"});

      Future.delayed(Duration(seconds: 2), () {
        print(" This line is execute after 5 seconds");
            for(i==0;i<8;i++) {
              messsages.insert(0, {
                "data": 1,
                "message": "category " + (i+1).toString(),
                "btn": 0
              });
            }
      });
    });
    // response(messageInsert.text);
    messageInsert.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat Bot",
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        // margin: const EdgeInsets.only(left: 10.0),
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                  reverse: true,
                  itemCount: messsages.length,
                  itemBuilder: (context, index) =>
                      chat(messsages[index]["message"].toString(),
                          messsages[index]["data"], messsages[index]["btn"],
                          messsages[index]["btn2"])

              ),
            ),
            // Bubble(
            //   margin: BubbleEdges.only(bottom: 10),
            //   alignment: Alignment.topLeft,
            //   color: Color.fromRGBO(77, 229, 182, 1.0),
            //   nip: BubbleNip.leftTop,
            //   child: Text('Hi, We are here to help you!'),
            // ),

            // InkWell(
            //   child: Container(
            //     margin: EdgeInsets.all(2.0),
            //     child: Center(
            //         child: FutureBuilder(
            //             future: Future.delayed(Duration(seconds: 2)),
            //             builder: (c, s) => s.connectionState ==
            //                     ConnectionState.done
            //                 ? Container(
            //                     padding:
            //                         EdgeInsets.only(left: 10.0, right: 15.0),
            //                     margin:
            //                         const EdgeInsets.symmetric(horizontal: 0.0),
            //                     alignment: Alignment.centerLeft,
            //                     // ignore: deprecated_member_use
            //                     child: RaisedButton(
            //                       child: Text(
            //                         "category 1",
            //                         style: TextStyle(fontSize: 20),
            //                       ),
            //                       //
            //                       // crossAxisAlignment: CrossAxisAlignment.start,
            //                       onPressed: () {
            //                         this.setState(() {
            //                           Bubble(
            //                             margin: BubbleEdges.only(bottom: 10),
            //                             alignment: Alignment.topLeft,
            //                             color:
            //                                 Color.fromRGBO(77, 229, 182, 1.0),
            //                             nip: BubbleNip.leftTop,
            //                             child: Text(
            //                                 'Hi, We are here to help you!'),
            //                           );
            //                         });
            //                       },
            //                       color: Colors.red,
            //                       textColor: Colors.black,
            //                       padding: EdgeInsets.all(13.0),
            //                       splashColor: Colors.grey,
            //                     ),
            //                   )
            //                 : Text(''))),
            //   ),
            //   onTap: () {},
            // ),
            SizedBox(
              height: 8,
              width: 8,
            ),
            Divider(
              height: 5.0,
              color: Colors.black,
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(
                        controller: messageInsert,
                        decoration: InputDecoration.collapsed(
                            hintText: "Send your message",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0)),
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.send,
                          size: 30.0,
                          color: Colors.deepOrange,
                        ),
                        onPressed: () {
                          if (messageInsert.text == "shopping") {
                            print("empty message");
                            setState(() {
                              btn = 1;
                              messsages.insert(0,
                                  {"data": 1, "message": messageInsert.text});
                              messageInsert.clear();

                              // btn = 0

                              messsages.insert(0,
                                  {"data": 1, "message": "category", "btn": 0});
                            });
                            messageInsert.clear();
                          } else {
                            setState(() {
                              btn = 1;
                              messsages.insert(0,
                                  {"data": 1, "message": messageInsert.text});
                              // btn = false;
                            });
                            //response(messageInsert.text);
                            messageInsert.clear();
                          }
                        }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  //for better one i have use the bubble package check out the pubspec.yaml

  delay() {
    Future.delayed(Duration(seconds: 5), () {
      print(" This line is execute after 5 seconds");
    });
  }

  Widget dyn() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {},
        child: Bubble(
          stick: true,
          color: Color.fromRGBO(212, 234, 244, 1.0),
          child: Text("hello",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
        ),
      ),
    );
  }


  Widget chat(String message, int data, int btn, int btn2) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          print("clicked");
          setState(() {
            if (btn2 == 1) {
              Toast.show(
                  "Showing product of subcategory 1 \n product 1 \n product 2",
                  context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
            }
            else {
              messsages.insert(0,
                  {
                    "data": 1,
                    "message": "Now select your sub categories",
                    "btn": 0
                  });
              messsages.insert(0,
                  {
                    "data": 1,
                    "message": "sub category 1",
                    "btn": 0,
                    "btn2": 1
                  });
              messsages.insert(0,
                  {
                    "data": 1,
                    "message": "sub category 2",
                    "btn": 0,
                    "btn2": 1
                  });
            }
          });
          messageInsert.clear();
        },
        child: Bubble(
            radius: btn == 0 ? Radius.circular(1.0) : Radius.circular(15.0),
            color: btn == 0 ? Colors.blue : data == 0
                ? Colors.deepOrange
                : Colors.orangeAccent,
            elevation: 0.0,
            alignment: btn == 0 ? Alignment.topLeft : data == 0 ? Alignment
                .topLeft : Alignment.topRight,
            nip: btn == 0 ? BubbleNip.no : data == 0
                ? BubbleNip.leftTop
                : BubbleNip.rightTop,
            child: Padding(
              padding: EdgeInsets.all(1.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // CircleAvatar(
                  //   backgroundImage: AssetImage(
                  //       data == 0 ? "assets/bot.png" : "assets/user.png"),
                  // ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                    child: Text(
                      message,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
