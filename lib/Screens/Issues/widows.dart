import 'dart:collection';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:csscngo/Services/sizeconfig.dart';
import 'package:flutter/material.dart';

class Widow extends StatefulWidget {
  @override
  _WidowState createState() => _WidowState();
}

class _WidowState extends State<Widow> {
  final _formKey = GlobalKey<FormState>();
  int sum=0;
  var caste = {'अनुसूचित जाती / जमाती': 3, 'दलित': 5, 'अनुसूचित जात नाही': 1};
  var yn = {'Yes': 0, 'No': 0};
  var yns = {'Yes': 5, 'No': 0};
  var js = {'तीव्र': 5, 'मध्यम': 3, 'सौम्य': 1, 'No': 0};

  var Ch, c, F, J, j, L, l, V, v, S, H, cas;
  var dys = {'तीव्र': 5, 'मध्यम': 3, 'सौम्य': 1};
  var tough = {'सहज': 1, 'कठिण': 3, 'खुप कठिण': 5};
  var viol = {'तीव्र': 5, 'मध्यम': 4, 'सौम्य': 2};
  bool Debt = false;
  bool violence = false;
  bool child = false;
  //bool job = false;
  var dysF = {'तीव्र': 5, 'मध्यम': 4, 'सौम्य': 2, 'नाही': 0};
  var Hope = {'वेळ नाही': 5, 'रस नाही': 3, 'मुलांची काळजी': 2, 'होय': 0};

  @override
  Widget build(BuildContext context) {
    Sizeconfig().init(context);
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 233, 217, 1),
        appBar: AppBar(
          title: Text('Questionares for Widows'),
          backgroundColor: Color.fromRGBO(255, 124, 92, 1),
        ),
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
                        margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*4.6875),
                        child: Text(
                          'जाती / उपजाती',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(66, 33, 11, 1),
                          ),
                        ),
                      ),
                      DropdownButtonFormField<dynamic>(
                        value: cas,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: 27,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          //labelText: "Select Pet Type",
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
                        items: caste.keys
                            .toList()
                            .map((label) => DropdownMenuItem<String>(
                                  child: Text(
                                    label,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() => this.cas = val);
                          Sum(caste[this.cas]);
                        },
                        validator: (val) {
                          if (val == null) {
                            return 'आवश्यक फील्ड';
                          }
                          return null;
                        },
//                        hint: Text('नाव निवडा',style: TextStyle(
//                            fontSize: 14, fontWeight: FontWeight.w300),
//                        ),
                        isExpanded: true,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*3.125),
                        child: Text(
                          'तुला मुलं आहेत का?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(66, 33, 11, 1),
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        value: Ch,
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
                        items: yn.keys
                            .toList()
                            .map((label) => DropdownMenuItem<String>(
                                  child: Text(
                                    label,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            this.Ch = val;
                            if (this.Ch == 'Yes') {
                              child = true;
                            }
                            Sum(yn[this.Ch]);
                          });
                        },
                        validator: (val) {
                          if (val == null) {
                            return 'आवश्यक फील्ड';
                          }
                          return null;
                        },
                        isExpanded: true,
                      ),
                      child
                          ? Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*3.125),
                                  //margin: EdgeInsets.only(top: 26.0),
                                  //color: Colors.blue,
                                  child: Text(
                                    'वय 10 वर्षांखालील आहे काय?',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(66, 33, 11, 1),
                                    ),
                                  ),
                                ),
                                DropdownButtonFormField(
                                  value: c,
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
                                  items: yns.keys
                                      .toList()
                                      .map((label) => DropdownMenuItem<String>(
                                            child: Text(
                                              label,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            value: label,
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() => this.c = val);
                                    Sum(yns[this.c]);
                                  },
                                  validator: (val) {
                                    if (val == null) {
                                      return 'आवश्यक फील्ड';
                                    }
                                    return null;
                                  },
                                  isExpanded: true,
                                ),
                              ],
                            )
                          : Container(),
                      Container(
                        margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*3.125),
                        child: Text(
                          'कुटुंब अकार्यक्षम आहे?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(66, 33, 11, 1),
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        value: F,
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
                        items: dys.keys
                            .toList()
                            .map((label) => DropdownMenuItem<String>(
                                  child: Text(
                                    label,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() => this.F = val);
                          Sum(dys[this.F]);
                        },
                        validator: (val) {
                          if (val == null) {
                            return 'आवश्यक फील्ड';
                          }
                          return null;
                        },
                        isExpanded: true,
                      ),

                      Container(
                        margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*3.125),
                        child: Text(
                          'जर आपण एखादे काम करत असाल तर आपण दु:खी आहात?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(66, 33, 11, 1),
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        value: J,
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
                        items: js.keys
                            .toList()
                            .map((label) => DropdownMenuItem<String>(
                                  child: Text(
                                    label,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (val) {

                          setState(() => this.J = val);
                          print(this.J);
                          Sum(js[this.J]);
                        },
                        validator: (val) {
                          if (val == null) {
                            return 'आवश्यक फील्ड';
                          }
                          return null;
                        },
                        isExpanded: true,
                      ),

                      Container(
                        margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*3.125),
                        child: Text(
                          'तुमच्यावर कर्ज आहे का?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(66, 33, 11, 1),
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        value: L,
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
                        items: yn.keys
                            .toList()
                            .map((label) => DropdownMenuItem<String>(
                                  child: Text(
                                    label,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() => this.L = val);
                          if (L == 'Yes') {
                            Debt = true;
                          }
                          Sum(yn[this.L]);
                        },
                        validator: (val) {
                          if (val == null) {
                            return 'आवश्यक फील्ड';
                          }
                          return null;
                        },
                        isExpanded: true,
                      ),

                      Debt
                          ? Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*3.125),
                                  //margin: EdgeInsets.only(top: 26.0),
                                  //color: Colors.blue,
                                  child: Text(
                                    'कर्ज फेडणे किती कठीण आहे?',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(66, 33, 11, 1),
                                    ),
                                  ),
                                ),
                                DropdownButtonFormField(
                                  value: l,
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
                                  items: tough.keys
                                      .toList()
                                      .map((label) => DropdownMenuItem<String>(
                                            child: Text(
                                              label,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            value: label,
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() => this.l = val);
                                    Sum(tough[this.l]);
                                  },
                                  validator: (val) {
                                    if (val == null) {
                                      return 'आवश्यक फील्ड';
                                    }
                                    return null;
                                  },
                                  isExpanded: true,
                                ),
                              ],
                            )
                          : Container(),
                      Container(
                        margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*3.125),
                        child: Text(
                          'आपण कुटुंबात शारीरिक हिंसा अनुभवता ?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(66, 33, 11, 1),
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        value: V,
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
                        items: yn.keys
                            .toList()
                            .map((label) => DropdownMenuItem<String>(
                                  child: Text(
                                    label,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() => this.V = val);
                          if (V == 'Yes') {
                            violence = true;
                          }
                          Sum(yn[this.V]);
                        },
                        validator: (val) {
                          if (val == null) {
                            return 'आवश्यक फील्ड';
                          }
                          return null;
                        },
                        isExpanded: true,
                      ),
//
                      violence
                          ? Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*3.125),
                                  //margin: EdgeInsets.only(top: 26.0),
                                  //color: Colors.blue,
                                  child: Text(
                                    'कोणत्या डिग्री पर्यंत?',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(66, 33, 11, 1),
                                    ),
                                  ),
                                ),
                                DropdownButtonFormField(
                                  value: v,
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
                                  items: viol.keys
                                      .toList()
                                      .map((label) => DropdownMenuItem<String>(
                                            child: Text(
                                              label,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            value: label,
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() => this.v = val);
                                    Sum(viol[this.v]);
                                  },
                                  validator: (val) {
                                    if (val == null) {
                                      return 'आवश्यक फील्ड';
                                    }
                                    return null;
                                  },
                                  isExpanded: true,
                                ),
                              ],
                            )
                          : Container(),
                      Container(
                        margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*3.125),
                        child: Text(
                          'आपण कुटुंबातील लैंगिक हिंसा अनुभवता?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(66, 33, 11, 1),
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        value: S,
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
                        items: dysF.keys
                            .toList()
                            .map((label) => DropdownMenuItem<String>(
                                  child: Text(
                                    label,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() => this.S = val);
                          Sum(dysF[this.S]);
                        },
                        validator: (val) {
                          if (val == null) {
                            return 'आवश्यक फील्ड';
                          }
                          return null;
                        },
                        isExpanded: true,
                      ),

                      Container(
                        margin: EdgeInsets.only(top: Sizeconfig.blockSizeVertical*3.125),
                        child: Text(
                          'आपण महिलांचे जीवन आणि उत्पन्न निर्मितीच्या विविध पैलूंचे प्रशिक्षण देण्यास तयार आहात का?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(66, 33, 11, 1),
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        value: H,
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
                        items: Hope.keys
                            .toList()
                            .map((label) => DropdownMenuItem<String>(
                                  child: Text(
                                    label,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() => this.H = val);
                          Sum(Hope[this.H]);
                        },
                        validator: (val) {
                          if (val == null) {
                            return 'आवश्यक फील्ड';
                          }
                          return null;
                        },
                        isExpanded: true,
                      ),
//
                      Container(
                        alignment: Alignment.center,
                        //color: Colors.blue,
                        margin: EdgeInsets.fromLTRB(0, Sizeconfig.blockSizeVertical*4.6875, 0,Sizeconfig.blockSizeVertical*3.125),
                        child: RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              print('Good Job');
                              print('${yn[this.Ch]}');
//                              int sum = caste[this.cas] +
//                                  yn[this.Ch] +
//                                  yns[this.c] +
//                                  dys[this.F] +
//                                  js[this.J] +
//                                  tough[this.l] +
//                                  viol[this.v ] +
//                                  dysF[this.S] +
//                                  Hope[this.H];
                              print('$sum');

                              if(sum>=0){
                                Fluttertoast.showToast(
                              msg: 'स्कोअर आहे: $sum',
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.black,
                              timeInSecForIosWeb: 3,
                              textColor: Colors.white,
                              fontSize: 15,
                            );

                              }
                              Future.delayed(Duration(seconds: 3), (){
                                Navigator.pop(context);
                              });

//
////
//                             Map<String,dynamic> Sdata={'रुग्णाचे नाव':this.Vname,'सरुग्णाचा मोबाईल नंबर': this.Vnum,'रुग्णाचे वय':this.Age,
//                               'रुग्णाची समस्या निवडा':this.prob,'जाती / उपजाती':this.cas,'Timestamp':obj.format(now),};
//
//                             print(now);
//                             await Dbref.addtoissue(Sdata);
//
//                             if(this.prob=='विधवा आणि घटस्फोटाचे मुद्दे'){
//                               Navigator.pushNamed(context, '/widows');
//                             }
//                             else Navigator.pop(context);
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
                    ]),
              ),
            )
        )
    );
  }

  Sum(int val){
    sum=sum+val;
    return sum;
  }
}
