import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


final fref=FirebaseDatabase.instance.reference();

var a={'fan':false,'light1':false,'light2':false,'light3':false,'light4':false};
var b={'light1':false,'light2':false,'light3':false,'light4':false,'light5':false};
var c={'fan':false,'light1':false,'light2':false,'light3':false,'light4':false};
var d={'fan':false,'light1':false,'light2':false,'light3':false,'light4':false};
var lr,cr,sr,br,initially;




class Wan extends StatefulWidget {
  @override
  _WanState createState() => _WanState();
}





class _WanState extends State<Wan> {


  check_status() async {

    await fref.once().then((snap) => {


      initially=snap.value['IOT'],

      lr=initially['Living Room'],

      if(lr!=null) {
        a['fan'] = lr['fan'],
        a['light1'] = lr['light1'],
        a['light2'] = lr['light2'],
        a['light3'] = lr['light3'],
        a['light4'] = lr['light4'],
      },

      cr = initially['Common Area'],

      if(cr!=null) {
        b['light1'] = cr['light1'],
        b['light2'] = cr['light2'],
        b['light3'] = cr['light3'],
        b['light4'] = cr['light4'],
        b['light5'] = cr['light5'],
      },

      sr = initially['Study Room'],

      if(sr!=null) {
        c['fan'] = sr['fan'],
        c['light1'] = sr['light1'],
        c['light2'] = sr['light2'],
        c['light3'] = sr['light3'],
        c['light4'] = sr['light4'],
      },


      br = initially['Bedroom'],

      if(br!=null) {
        d['fan'] = br['fan'],
        d['light1'] = br['light1'],
        d['light2'] = br['light2'],
        d['light3'] = br['light3'],
        d['light4'] = br['light4'],
      },


    });
    setState(() {
      
    });


  }

  void initState(){
    super.initState();
    check_status();

  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(




      body: StreamBuilder(

        stream: fref.onChildChanged,


        builder: (Context,snap){



            if (snap.data != null){

                  lr=snap.data.snapshot.value['Living Room'];

                  if(lr!=null) {
                    a['fan'] = lr['fan'];
                    a['light1'] = lr['light1'];
                    a['light2'] = lr['light2'];
                    a['light3'] = lr['light3'];
                    a['light4'] = lr['light4'];
                  }

                  cr = snap.data.snapshot.value['Common Area'];

                  if(cr!=null) {

                    b['light1'] = cr['light1'];
                    b['light2'] = cr['light2'];
                    b['light3'] = cr['light3'];
                    b['light4'] = cr['light4'];
                    b['light5'] = cr['light5'];
                  }

                  sr = snap.data.snapshot.value['Study Room'];

                  if(sr!=null) {
                    c['fan'] = sr['fan'];
                    c['light1'] = sr['light1'];
                    c['light2'] = sr['light2'];
                    c['light3'] = sr['light3'];
                    c['light4'] = sr['light4'];
                  }

                  br = snap.data.snapshot.value['Bedroom'];

                  if(br!=null) {
                    d['fan'] = br['fan'];
                    d['light1'] = br['light1'];
                    d['light2'] = br['light2'];
                    d['light3'] = br['light3'];
                    d['light4'] = br['light4'];
                  }


                  print(snap.data.snapshot.value);


            }



          return ScrollConfiguration(

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

                                      fref.child('IOT/Living Room/fan').set(value).then((result) => {

                                        setState(() {
                                          a['fan']=value;
                                        })

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

                                      fref.child('IOT/Living Room/light1').set(value).then((result) => {

                                        setState(() {
                                          a['light1']=value;
                                        })

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

                                      fref.child('IOT/Living Room/light2').set(value).then((result) => {

                                        setState(() {
                                          a['light2']=value;
                                        })

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

                                      fref.child('IOT/Living Room/light3').set(value).then((result) => {

                                        setState(() {
                                          a['light3']=value;
                                        })

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

                                      fref.child('IOT/Living Room/light4').set(value).then((result) => {

                                        setState(() {
                                          a['light4']=value;
                                        })

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

                                      fref.child('IOT/Common Area/light1').set(value).then((result) => {

                                        setState(() {
                                          b['light1']=value;
                                        })

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

                                      fref.child('IOT/Common Area/light2').set(value).then((result) => {

                                        setState(() {
                                          b['light2']=value;
                                        })

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

                                      fref.child('IOT/Common Area/light3').set(value).then((result) => {

                                        setState(() {
                                          b['light3']=value;
                                        })

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

                                      fref.child('IOT/Common Area/light4').set(value).then((result) => {

                                        setState(() {
                                          b['light4']=value;
                                        })

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
                                Image.asset(b['light5'] ? 'assets/lighton.png' : 'assets/lightoff.png' ,height: 100,width: 100),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Text('Light 05',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),),
                                ),
                                Container(
                                  height: 33,
                                  margin:EdgeInsets.fromLTRB(0, 2, 0, 8),
                                  child: CupertinoSwitch(
                                    value: b['light5'],
                                    onChanged: (value){

                                      fref.child('IOT/Common Area/light5').set(value).then((result) => {

                                        setState(() {
                                          b['light5']=value;
                                        })

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

                                      fref.child('IOT/Study Room/fan').set(value).then((result) => {

                                        setState(() {
                                          c['fan']=value;
                                        })

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

                                      fref.child('IOT/Study Room/light1').set(value).then((result) => {

                                        setState(() {
                                          c['light1']=value;
                                        })

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

                                      fref.child('IOT/Study Room/light2').set(value).then((result) => {

                                        setState(() {
                                          c['light2']=value;
                                        })

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

                                      fref.child('IOT/Study Room/light3').set(value).then((result) => {

                                        setState(() {
                                          c['light3']=value;
                                        })

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

                                      fref.child('IOT/Study Room/light4').set(value).then((result) => {

                                        setState(() {
                                          c['light4']=value;
                                        })

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

                                      fref.child('IOT/Bedroom/fan').set(value).then((result) => {

                                        setState(() {
                                          d['fan']=value;
                                        })

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

                                      fref.child('IOT/Bedroom/light1').set(value).then((result) => {

                                        setState(() {
                                          d['light1']=value;
                                        })

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

                                      fref.child('IOT/Bedroom/light2').set(value).then((result) => {

                                        setState(() {
                                          d['light2']=value;
                                        })

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

                                      fref.child('IOT/Bedroom/light3').set(value).then((result) => {

                                        setState(() {
                                          d['light3']=value;
                                        })

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

                                      fref.child('IOT/Bedroom/light4').set(value).then((result) => {

                                        setState(() {
                                          d['light4']=value;
                                        })

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
          );
        },

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