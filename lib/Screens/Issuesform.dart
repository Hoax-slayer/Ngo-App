import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csscngo/Screens/home/login.dart';
import 'package:flutter/material.dart';
import 'package:csscngo/Services/database.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:csscngo/Services/sizeconfig.dart';

class Issues extends StatefulWidget {
  @override
  _IssuesState createState() => _IssuesState();
}

class _IssuesState extends State<Issues> {
  String _name;
  DbService Dbref = new DbService();
  final _formKey = GlobalKey<FormState>();
  String Vname;
  String Vnum;
  String Age;
  var _Issues = [
    'दारू पिणे व्यसन',
    'घरगुती हिंसा',
    'विधवा आणि घटस्फोटाचे मुद्दे',
    'ज्येष्ठ नागरिकांचे प्रश्न',
    'कुपोषण',
    'शून्य कचरा',
    'सुशिक्षित बेरोजगार',
    'शाळा सोडले'
  ];
  var prob;
  var controller = TextEditingController();

  var now = new DateTime.now();
  DateFormat obj = new DateFormat("dd-MM-yyyy hh:mm:ss");

  @override
  void initState() {
    super.initState();
    loaddata().then(updateName);
  }

  @override
  Widget build(BuildContext context) {
    Sizeconfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Sizeconfig.blockSizeHorizontal * 5.56),
        width: Sizeconfig.screenWidth,
        height: Sizeconfig.screenHeight,
        color: const Color.fromRGBO(255, 233, 217, 1),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*6.25),
                    child: Text(
                      'रुग्णाची समस्या निवडा',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(66, 33, 11, 1),
                      ),
                    ),
                  ),
                  DropdownButtonFormField<dynamic>(
                    value: prob,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 27,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.black,
                      )),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
                    items: _Issues.map((label) => DropdownMenuItem<String>(
                          child: Text(
                            label,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          value: label,
                        )).toList(),
                    onChanged: (val) {
                      setState(() => this.prob = val);
                    },
                    validator: (val) {
                      if (val == null) {
                        return 'आवश्यक फील्ड';
                      }
                      return null;
                    },
                    hint: Text(
                      'समस्या प्रविष्ट करा',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    isExpanded: true,
                  ),

//                  DropdownButton<String>(
//                    items: _Issues.map((String dropDownStringItem) {
//                      return DropdownMenuItem<String>(
//                        value: dropDownStringItem,
//                        child: Text(
//                          dropDownStringItem,
//                          style: TextStyle(
//                            fontWeight: FontWeight.w300,
//                          ),
//                        ),
//                      );
//                    }).toList(),
//                    onChanged: (String valueSelected) {
//                      setState(() {
//                        this.prob = valueSelected;
//                      });
//                    },
//                    value: prob,
//                    underline: Container(
//                      height: 2,
//                      color: Colors.black,
//                    ),
//                    isExpanded: true,
//                    hint: Text('समस्या प्रविष्ट करा'),
//                  ),

//
                  Container(
                    margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*3.125),
                    //color: Colors.blue,
                    child: Text(
                      'महिल कुटुंब प्रमुखाचे नाव',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(66, 33, 11, 1),
                      ),
                    ),
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: controller,
                    decoration: InputDecoration(
                      //border: UnderlineInputBorder
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0)),
                      hintText: 'नाव निवडा',
                      hintStyle: TextStyle(fontWeight: FontWeight.w200),
                      contentPadding: EdgeInsets.all(0),
                      errorStyle:
                          TextStyle(fontSize: 13.0, color: Colors.red[900]),
                    ),
//                    onChanged: (val){
//
//                        controller.text = val;
//
//                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'आवश्यक फील्ड';
                      }
                      return null;
                    },

                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*3.125),
                    //color: Colors.blue,
                    child: Text(
                      'रुग्णाचे नाव',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(66, 33, 11, 1),
                      ),
                    ),
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      //border: UnderlineInputBorder
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0)),
                      hintText: 'नाव निवडा',
                      hintStyle: TextStyle(fontWeight: FontWeight.w200),
                      contentPadding: EdgeInsets.only(bottom: 0),
                      errorStyle:
                          TextStyle(fontSize: 13.0, color: Colors.red[900]),
                    ),
                    onChanged: (val) {
                      this.Vname = val;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'आवश्यक फील्ड';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Container(
                    //color: Colors.blue,
                    margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*3.125),
                    //margin: EdgeInsets.only(top: 26.0),
                    //color: Colors.blue,
                    child: Text(
                      'रुग्णाचा मोबाईल नंबर',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(66, 33, 11, 1),
                      ),
                    ),
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      //border: UnderlineInputBorder
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0)),
                      hintText: 'फोन प्रविष्ट करा',
                      contentPadding: EdgeInsets.only(bottom: 0),
                      errorStyle:
                          TextStyle(fontSize: 13.0, color: Colors.red[900]),
                    ),
                    onChanged: (val) {
                      this.Vnum = val;
                    },
                    validator: (value) {
                      if (value.length != 10) {
                        return 'Number Should be a 10 digit number';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Container(
                    //color: Colors.blue,
                    margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*3.125),
                    //margin: EdgeInsets.only(top: 26.0),
                    //color: Colors.blue,
                    child: Text(
                      'रुग्णाचे वय',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(66, 33, 11, 1),
                      ),
                    ),
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.go,
                    autovalidate: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      //border: UnderlineInputBorder
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0)),
                      hintText: 'वय प्रविष्ट करा',
                      contentPadding: EdgeInsets.only(bottom: 0),
                      errorStyle:
                          TextStyle(fontSize: 13.0, color: Colors.red[900]),
                    ),
                    onChanged: (val) {
                      this.Age = val;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'आवश्यक फील्ड';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    //color: Colors.blue,
                    margin: EdgeInsets.fromLTRB(0,Sizeconfig.blockSizeVertical * 3.125, 0,Sizeconfig.blockSizeVertical*3.125),
                    child: RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          print('${controller.text}');

                          Map<String, dynamic> Sdata = {
                            'रुग्णाचे नाव': this.Vname,
                            'सरुग्णाचा मोबाईल नंबर': this.Vnum,
                            'रुग्णाचे वय': this.Age,
                            'रुग्णाची समस्या निवडा': this.prob,
                            'Timestamp': obj.format(now),
                          };

                          print(now);
                          await Dbref.addtoissue(_name, controller.text, Sdata);
//                              .whenComplete(() {
//                            Fluttertoast.showToast(
//                              msg: 'यशस्वीरित्या जोडले',
//                              gravity: ToastGravity.BOTTOM,
//                              toastLength: Toast.LENGTH_SHORT,
//                              backgroundColor: Colors.black,
//                              textColor: Colors.white,
//                              fontSize: 15,
//                            );
//                          });

                          Future.delayed(Duration(seconds: 2), () {
                            switch (this.prob) {
                              case 'विधवा आणि घटस्फोटाचे मुद्दे':
                                Navigator.pushNamed(context, '/widows')
                                    .then((_) {
                                  Navigator.pop(context);
                                });
                                break;
                              case 'दारू पिणे व्यसन':
                                Navigator.pop(context);
                                break;
                              case 'घरगुती हिंसा':
                                Navigator.pop(context);
                                break;
                              case 'ज्येष्ठ नागरिकांचे प्रश्न':
                                Navigator.pop(context);
                                break;
                              case 'कुपोषण':
                                Navigator.pop(context);
                                break;
                              case 'शून्य कचरा':
                                Navigator.pop(context);
                                break;
                              case 'सुशिक्षित बेरोजगार':
                                Navigator.pop(context);
                                break;
                              case 'शाळा सोडले':
                                Navigator.pop(context);
                                break;
                              //default:
                            }

//                            if (this.prob == 'विधवा आणि घटस्फोटाचे मुद्दे') {
//                              Navigator.pushNamed(context, '/widows');
//                            } else
//                              Navigator.pop(context);
                          });
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(66, 33, 11, 1),
                        ),
                      ),
                    ),
                  ),
                ]))),
      ),
    );
  }

  void updateName(String name) {
    setState(() {
      this._name = name;
    });
  }
}
