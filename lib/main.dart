import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Lan.dart';
import 'Wan.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(

      statusBarColor: Colors.transparent,/* set Status bar color in Android devices. */

      statusBarIconBrightness: Brightness.dark,/* set Status bar icons color in Android devices.*/

      statusBarBrightness: Brightness.dark  /* set Status bar icon color in iOS. */


  )
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.white,
    ),
    home: MyApp(),

    routes: {
      '/wan' : (context)=> Wan(),
      '/lan' : (context)=> Lan(),

    },

  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      future: Firebase.initializeApp(),

        builder: (context, snapshot) {

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: AppBar(

                  backgroundColor: Colors.white,
                  brightness: Brightness.light,
                  elevation: 0,
                  title: Text(
                    'Smart Home',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(0, 14, 0, 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed('/lan');
                    },

                    child: Container(

                      height: (MediaQuery.of(context).size.height*0.5)-(MediaQuery.of(context).padding.top/2)-(MediaQuery.of(context).padding.bottom/2)-7-30-20-7,
                      width: MediaQuery.of(context).size.width-40,
                      margin: EdgeInsets.fromLTRB(0, 9, 0, 9),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.amberAccent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 9,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(13),
                            child: Column(
                              children: [
                                Container(
                                  child: Text('Local Area Network',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  alignment: Alignment.topLeft,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0,5,0,5),
                                  child: Text('Control your appliances through your home wifi network.',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  alignment: Alignment.topLeft,
                                ),
                                Container(
                                  height: ((MediaQuery.of(context).size.height*0.5)-(MediaQuery.of(context).padding.top/2)-(MediaQuery.of(context).padding.bottom/2)-7-30-20-7)-107,
                                  width: MediaQuery.of(context).size.width-40,
                                  child: Image.asset('assets/lan.png',height:((MediaQuery.of(context).size.height*0.5)-(MediaQuery.of(context).padding.top/2)-(MediaQuery.of(context).padding.bottom/2)-7-30-20-7)-30-13-13-5,),
                                  alignment: Alignment.center,

                                ),

                              ],
                            ),

                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed('/wan');
                    },
                    child: Container(

                      height: (MediaQuery.of(context).size.height*0.5)-(MediaQuery.of(context).padding.top/2)-(MediaQuery.of(context).padding.bottom/2)-7-30-20-7,
                      width: MediaQuery.of(context).size.width-40,
                      margin: EdgeInsets.fromLTRB(0, 9, 0, 9),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.amberAccent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 9,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(13),
                            child: Column(
                              children: [
                                Container(
                                  child: Text('Wide Area Network',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  alignment: Alignment.topLeft,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0,5,0,5),
                                  child: Text('Control your appliances through Internet from anywhere in the world.',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  alignment: Alignment.topLeft,
                                ),
                                Container(
                                  height: ((MediaQuery.of(context).size.height*0.5)-(MediaQuery.of(context).padding.top/2)-(MediaQuery.of(context).padding.bottom/2)-7-30-20-7)-107,
                                  width: MediaQuery.of(context).size.width-40,
                                  child: Image.asset('assets/wan.png',height:((MediaQuery.of(context).size.height*0.5)-(MediaQuery.of(context).padding.top/2)-(MediaQuery.of(context).padding.bottom/2)-7-30-20-7)-30-13-13-5,),
                                  alignment: Alignment.center,

                                ),

                              ],
                            ),

                          )
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ),
          );

        }
    );
  }
}

