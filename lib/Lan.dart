import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


var a={'fan':false,'light1':false,'light2':false,'light3':false,'light4':false};
var b={'light1':false,'light2':false,'light3':false,'light4':false,'light5':false};
var c={'fan':false,'light1':false,'light2':false,'light3':false,'light4':false};
var d={'fan':false,'light1':false,'light2':false,'light3':false,'light4':false};
var lr,cr,sr,br;
http.Response response1,response2,response3,response4;
String url = 'http://192.168.1.184/';

class Lan extends StatefulWidget {

  @override
  _LanState createState() => _LanState();
}

class _LanState extends State<Lan> {



  check_status(){


      Timer.periodic(Duration(milliseconds: 500), (timer) async{

        response1 = await http.get(url);


        lr = jsonDecode(response1.body);

        if (lr != null) {
          a['fan'] = lr['fan'];
          a['light1'] = lr['light1'];
          a['light2'] = lr['light2'];
          a['light3'] = lr['light3'];
          a['light4'] = lr['light4'];
        }

        //      cr = initially['Common Area'];
        //
        //      if(cr!=null) {
        //        b['light1'] = cr['light1'];
        //        b['light2'] = cr['light2'];
        //        b['light3'] = cr['light3'];
        //        b['light4'] = cr['light4'];
        //        b['light5'] = cr['light5'];
        //      }

        //      sr = initially['Study Room'];
        //
        //      if(sr!=null) {
        //        c['fan'] = sr['fan'];
        //        c['light1'] = sr['light1'];
        //        c['light2'] = sr['light2'];
        //        c['light3'] = sr['light3'];
        //        c['light4'] = sr['light4'];
        //      }


        //      br = initially['Bedroom'];
        //
        //      if(br!=null) {
        //        d['fan'] = br['fan'];
        //        d['light1'] = br['light1'];
        //        d['light2'] = br['light2'];
        //        d['light3'] = br['light3'];
        //        d['light4'] = br['light4'];
        //      }


        setState(() {

        });
      });


  }

  void initState(){
    super.initState();
    check_status();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: ScrollConfiguration(

        behavior: MyBehavior(),

        child: ListView(
          children: [

            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Living Room',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Container(
              height: 190,
//            color: Colors.deepOrangeAccent,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.fromLTRB(9, 0, 9, 0),
                  children: [

                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(a['fan'] ? 'assets/fanon.png' : 'assets/fanoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Fan',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: a['fan'],
                                onChanged: (value){
                                  http.get(url+"fan");
                                  setState(() {
                                    a['fan']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(a['light1'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 01',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: a['light1'],
                                onChanged: (value){
                                  http.get(url+"light1");
                                  setState(() {
                                    a['light1']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(a['light2'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 02',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: a['light2'],
                                onChanged: (value){
                                  http.get(url+"light2");
                                  setState(() {
                                    a['light2']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(a['light3'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 03',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: a['light3'],
                                onChanged: (value){
                                  http.get(url+"light3");
                                  setState(() {
                                    a['light3']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(a['light4'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 04',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: a['light4'],
                                onChanged: (value){
                                  http.get(url+"light4");
                                  setState(() {
                                    a['light4']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),



                  ],
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Common Area',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Container(
              height: 190,
//            color: Colors.deepOrangeAccent,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.fromLTRB(9, 0, 9, 0),
                  children: [

                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(b['light1'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 01',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: b['light1'],
                                onChanged: (value){
                                  setState(() {
                                    b['light1']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(b['light2'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 02',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: b['light2'],
                                onChanged: (value){
                                  setState(() {
                                    b['light2']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(b['light3'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 03',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: b['light3'],
                                onChanged: (value){
                                  setState(() {
                                    b['light3']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(b['light4'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 04',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: b['light4'],
                                onChanged: (value){
                                  setState(() {
                                    b['light4']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),



                  ],
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Study Room',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Container(
              height: 190,
//            color: Colors.deepOrangeAccent,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.fromLTRB(9, 0, 9, 0),
                  children: [

                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(c['fan'] ? 'assets/fanon.png' : 'assets/fanoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Fan',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: c['fan'],
                                onChanged: (value){
                                  setState(() {
                                    c['fan']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(c['light1'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 01',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: c['light1'],
                                onChanged: (value){
                                  setState(() {
                                    c['light1']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(c['light2'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 02',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: c['light2'],
                                onChanged: (value){
                                  setState(() {
                                    c['light2']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(c['light3'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 03',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: c['light3'],
                                onChanged: (value){
                                  setState(() {
                                    c['light3']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(c['light4'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 04',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: c['light4'],
                                onChanged: (value){
                                  setState(() {
                                    c['light4']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),



                  ],
                ),
              ),
            ),


            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Bedroom',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Container(
              height: 190,
//            color: Colors.deepOrangeAccent,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.fromLTRB(9, 0, 9, 0),
                  children: [

                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(d['fan'] ? 'assets/fanon.png' : 'assets/fanoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Fan',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: d['fan'],
                                onChanged: (value){
                                  setState(() {
                                    d['fan']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(d['light1'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 01',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: d['light1'],
                                onChanged: (value){
                                  setState(() {
                                    d['light1']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(d['light2'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 02',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: d['light2'],
                                onChanged: (value){
                                  setState(() {
                                    d['light2']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(d['light3'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 03',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: d['light3'],
                                onChanged: (value){
                                  setState(() {
                                    d['light3']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(d['light4'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text('Light 04',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),),
                            ),
                            Container(
                              height: 33,
                              margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                              child: CupertinoSwitch(
                                value: d['light4'],
                                onChanged: (value){
                                  setState(() {
                                    d['light4']=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                      ),
                    ),





                  ],
                ),
              ),
            ),



            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              height: 15,
            ),


          ],
        ),
      ),

    );
  }
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}