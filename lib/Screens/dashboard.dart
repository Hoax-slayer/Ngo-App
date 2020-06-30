import 'package:flutter/material.dart';
import 'package:csscngo/Screens/home/login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:csscngo/Services/auth.dart';
import 'package:csscngo/Previous Data/historydata.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:csscngo/Services/sizeconfig.dart';




class Third extends StatefulWidget {
  @override
  _ThirdState createState() => _ThirdState();
}



class _ThirdState extends State<Third> {
  String _name='';
  bool pressed = true;
  bool pressed1 =true;
  bool pressed2 =true;


  @override
  void initState(){
    super.initState();
    loaddata().then(updateName);
  }


  @override
  Widget build(BuildContext context) {
    Sizeconfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(

          width: Sizeconfig.screenWidth,
          height: Sizeconfig.screenHeight,
          //padding: EdgeInsets.fromLTRB(10.0,120.0,0,0),
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Container(
                  width: Sizeconfig.blockSizeHorizontal * 86.12,
                  margin: EdgeInsets.fromLTRB(
                    Sizeconfig.blockSizeHorizontal * 6.67,
                    Sizeconfig.blockSizeVertical * 5.9375,
                    0,0),
                  //Sizeconfig.blockSizeVertical * 6.875,
                  //color: Colors.blue,
                  child: AutoSizeText('नमस्कार',
                    style: TextStyle(fontSize: 34,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(66, 33, 11, 1),
                    ),
                    maxLines: 1,
                    //presetFontSizes: [32,33,34],
                  ),
//                child: InkWell(
//                  onTap: (){
//                    setState(() {
//                      pressed1=!pressed1;
//                      //getCurrentLocation();
//                    });
//                    //Navigator.pushNamed(context, '/register');
//                  },
//                  child: Container(
//
//                    //color: Colors.green,
//                    //margin: EdgeInsets.fromLTRB(0,0, 10.0, 40.0),
//                    padding: EdgeInsets.all(10.0),
//
//
//                    child: Text.rich(
//                        TextSpan(
//                          text:'Create new survey application',
//
//                          style: pressed1 ? TextStyle(fontSize: 18.0,
//                            fontWeight: FontWeight.bold,
//                            color: Colors.blue[800],)
//                              : TextStyle(fontSize: 18.0,
//                            fontWeight: FontWeight.bold,
//                            color: Colors.indigo[900],
//                          ),
//                        )
//                    ) ,
//
//                  ),
//                ),
                ),
                Container(
                  //color: Colors.black,
                  width: Sizeconfig.blockSizeHorizontal * 86.12,
                  margin: EdgeInsets.fromLTRB(
                      Sizeconfig.blockSizeHorizontal * 6.67,
                      Sizeconfig.blockSizeVertical * 0.15625,
                      0,
                      0),
                  //margin: EdgeInsets.fromLTRB(24,1,0,0),
                  //color: Colors.blue,
                  child: AutoSizeText(_name,
                    style: TextStyle(fontSize: 38,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(66, 33, 11, 1),
                    ),
                    presetFontSizes: [38,37,36],
                    maxLines: 1,
                  ),
                ),
                Container(
                  width: Sizeconfig.blockSizeHorizontal * 86.12,
                  margin: EdgeInsets.fromLTRB(
                      Sizeconfig.blockSizeHorizontal * 6.67,
                      Sizeconfig.blockSizeVertical * 1.25,
                      0,
                      0),
//Sizeconfig.blockSizeVertical * 1.25,
                 // margin: EdgeInsets.fromLTRB(24,8,0,0),
                  //color: Colors.blue,
                  child: AutoSizeText('आपले कार्य निवडा',
                    style: TextStyle(fontSize: 34,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(66, 33, 11, 1),
                    ),
                    maxLines: 1,
                    presetFontSizes: [34,33,32],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical * 3.75),
                  //margin: EdgeInsets.only(top: 24),
                  //margin: EdgeInsets.fromLTRB(26,22,0,0),
                  height: Sizeconfig.blockSizeVertical * 13.125,
                  width: Sizeconfig.blockSizeHorizontal * 86.12,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.0),
                      ),
                      border: Border.all(
                        color: Color.fromRGBO(255, 124, 92, 1),
                        width: 3,
                      )
                  ),

                  child: Stack(
                    children: <Widget>[

                      Row(
                        children: <Widget>[
                          Flexible(
                            flex:1,
                            child: Container(
                              //  color: Colors.black,
                              alignment: Alignment.center,
                              child: SvgPicture.asset('assets/survey.svg'),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  Navigator.pushNamed(context, '/survey');
                                });
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,

                                child: AutoSizeText('नवीन सर्वेक्षण करा',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(255, 124, 92, 1),
                                  ),
                                  maxLines: 1,
                                  //presetFontSizes: [17,16],
                                  maxFontSize: 19,
                                  minFontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child:SvgPicture.asset('assets/stars.svg'),
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                      )
                    ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical * 3.75),
                 // margin: EdgeInsets.only(top: 24),
                  //margin: EdgeInsets.fromLTRB(26,22,0,0),
                  height: Sizeconfig.blockSizeVertical * 13.125,
                  width: Sizeconfig.blockSizeHorizontal * 86.12,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.0),
                      ),
                      border: Border.all(
                        color: Color.fromRGBO(255, 124, 92, 1),
                        width: 3,
                      )
                  ),


                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex:1,
                        child: Container(
                          //color: Colors.black,
                          alignment: Alignment.center,
                          child: SvgPicture.asset('assets/member.svg'),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              Navigator.pushNamed(context, '/issuesform');
                            });
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            //color: Colors.black,
                            child: AutoSizeText('कुटुंबात सदस्य जोडा',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(255, 124, 92, 1),
                              ),
                              //presetFontSizes:[17,16] ,
                              maxFontSize: 19,
                              minFontSize: 17,

                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical * 3.75),
                  //margin: EdgeInsets.only(top: 24),
                  height: Sizeconfig.blockSizeVertical * 13.125,
                  width: Sizeconfig.blockSizeHorizontal * 86.12,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.0),
                      ),
                      border: Border.all(
                        color: Color.fromRGBO(255, 124, 92, 1),
                        width: 3,
                      )
                  ),

                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex:1,
                        child: Container(
                          alignment: Alignment.center,
                          child: SvgPicture.asset('assets/history.svg'),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              Navigator.pushNamed(context,'/history');
                            });
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText('मागील भेट तपासा',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(255, 124, 92, 1),
                              ),
                              maxLines: 1,
                              maxFontSize: 19,
                              minFontSize: 17,
                              //presetFontSizes:[19,17,16] ,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: Sizeconfig.blockSizeVertical*6.25,
                  //height: 40,
                ),
                Divider(
                  thickness: 2,
                  color: Color.fromRGBO(245, 215, 196, 1),
                  height: 0,
                ),

                InkWell(
                  onTap: () async {
                    await AuthService().signout();
                    print('signned out');
                  },

                  child: Container(
                    //color: Colors.black,
                    alignment: Alignment.center,

                    //margin: EdgeInsets.only(top:40),
                    height: Sizeconfig.blockSizeVertical*12.5,
                    //Sizeconfig.blockSizeVertical*12.5,
                    //height: 80,
                    child: Text(
                      'साइन आउट करा',
                      style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold,
                        color:Color.fromRGBO(255, 124, 92, 1), ),
                    ),
                    //margin: EdgeInsets.only(bottom: ),
                  ),
                )
              ]
          ),

        ),
      ),
      backgroundColor: const Color.fromRGBO(255,233,217,1),
    );
  }
  void updateName(String name){
    setState(() {
      this._name=name;
    });
  }

}

