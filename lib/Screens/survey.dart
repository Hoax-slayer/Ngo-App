import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csscngo/Screens/home/login.dart';
import 'package:flutter/material.dart';
import 'package:csscngo/Services/database.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:csscngo/Services/sizeconfig.dart';

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class MyLocation {
  String Lnm;
  String Lid;

  MyLocation({this.Lnm, this.Lid});
}

class _MyCustomFormState extends State<MyCustomForm> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  final _formKey = GlobalKey<FormState>();

  Position _currentPosition;
  String currentAddress;
  MyCustomForm obj1 = new MyCustomForm();
  DbService dbref = new DbService();
  StreamSubscription<QuerySnapshot> streamSub;

  var now = new DateTime.now();
  DateFormat obj = new DateFormat("dd-MM-yyyy hh:mm:ss");
  List<MyLocation> location;
  MyLocation select;
  String loc;
  String id;
  var count;
  var infcount;
  String uniquenum;

  String _item;
  var _Name = ['अंजना सोनटक्के', "अक्षता उमळकर"];
  var _itemselected;

//  var _LName=['ज्ञानेश्वर नगर','तीन बंगला','बेहराम नगर','इंदिरा नगर','खेरवाडी','गुलशन नगर','दीपकवाडी','नेहरू नगर',
//      'बहराम पाडा','भारत नगर','वाल्मिकी नगर','विजय नगर','शांतीलाल कंपाउंड','हनुमान टेकडी'];

  String Vadd;
  String Mnum;
  String Fnum;
  String Hname;
  String timestamp;

  @override
  void initState() {
    super.initState();

    location = [
      MyLocation(Lnm: 'ज्ञानेश्वर नगर', Lid: '04'),
      MyLocation(Lnm: 'तीन बंगला', Lid: '17'),
      MyLocation(Lnm: 'बेहराम नगर', Lid: '09'),
      MyLocation(Lnm: 'इंदिरा नगर', Lid: '16'),
      MyLocation(Lnm: 'खेरवाडी', Lid: '10'),
      MyLocation(Lnm: 'गुलशन नगर', Lid: '02'),
      MyLocation(Lnm: 'दीपकवाडी', Lid: '12'),
      MyLocation(Lnm: 'नेहरू नगर', Lid: '15'),
      MyLocation(Lnm: 'बहराम पाडा', Lid: '07'),
      MyLocation(Lnm: 'भारत नगर', Lid: '01'),
      MyLocation(Lnm: 'वाल्मिकी नगर', Lid: '03'),
      MyLocation(Lnm: 'विजय नगर', Lid: '28'),
      MyLocation(Lnm: 'शांतीलाल कंपाउंड', Lid: '13'),
      MyLocation(Lnm: 'हनुमान टेकडी', Lid: '19'),
    ];
    loadid().then((String Value) {
      this.id = Value;
    });

    loaddata().then(updateName);
  }

  @override
  Widget build(BuildContext context) {
    Sizeconfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
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
//                    Container(
//                      margin: EdgeInsets.only(top: 20),
//                      //margin: EdgeInsets.only(top: 26.0),
//                      //color: Colors.blue,
//                      child: Text('आरोग्य सेविकेचे नाव',
//                        style: TextStyle(fontSize: 16,
//                          fontWeight: FontWeight.w600,
//                          color: Color.fromRGBO(66, 33, 11, 1),
//                        ),
//                      ),
//                    ),
//                    DropdownButton<String>(
//                      items: _Wname.map((String dropDownStringItem){
//                        return DropdownMenuItem<String>(
//                          value: dropDownStringItem,
//                          child: Text(dropDownStringItem,
//                            style: TextStyle(
//                              fontWeight: FontWeight.w300,
//                            ),),
//                        );
//                      }).toList(),
//                      onChanged: (String valueSelected){
//                        setState(() {
//                          this._item= valueSelected;
//
//                        });
//                      },
//                      value:_item ,
//                      underline:Container(
//                        height:2 ,
//                        color: Colors.black,
//                      ) ,
//                      isExpanded: true,
//
//                      hint: Text('नाव निवडा'),
//
//                    ),

                    Container(
                      //color: Colors.blue,
                      margin: EdgeInsets.only(
                          top: Sizeconfig.blockSizeVertical * 3.125),
                      //margin: EdgeInsets.only(top: 26.0),
                      //color: Colors.blue,
                      child: Text(
                        'सुपरवाइजर चे नाव',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(66, 33, 11, 1),
                        ),
                      ),
                    ),
                    DropdownButtonFormField<dynamic>(
                      value: _itemselected,
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
                      items: _Name.map((label) => DropdownMenuItem<String>(
                            child: Text(
                              label,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            value: label,
                          )).toList(),
                      onChanged: (val) {
                        setState(() => this._itemselected = val);
                      },
                      validator: (val) {
                        if (val == null) {
                          return 'आवश्यक फील्ड';
                        }
                        return null;
                      },
                      hint: Text(
                        'नाव निवडा',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                      isExpanded: true,
                    ),

//                    DropdownButton<String>(
//                      items: _Name.map((String dropDownStringItem) {
//                        return DropdownMenuItem<String>(
//                          value: dropDownStringItem,
//                          child: Text(
//                            dropDownStringItem,
//                            style: TextStyle(
//                              fontWeight: FontWeight.w300,
//                            ),
//                          ),
//                        );
//                      }).toList(),
//                      onChanged: (String valueSelected) {
//                        setState(() {
//                          this._itemselected = valueSelected;
//                        });
//                      },
//                      value: _itemselected,
//                      underline: Container(
//                        height: 2,
//                        color: Colors.black,
//                      ),
//                      isExpanded: true,
//                      hint: Text('नाव निवडा'),
//                    ),

                    Container(
                      //color: Colors.blue,
                      margin: EdgeInsets.only(
                          top: Sizeconfig.blockSizeVertical * 3.125),
                      //margin: EdgeInsets.only(top: 26.0),
                      //color: Colors.blue,
                      child: Text(
                        'वस्तीचे नाव ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(66, 33, 11, 1),
                        ),
                      ),
                    ),
                    DropdownButtonFormField<dynamic>(
                      value: select,
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
                      items: location
                          .map((label) => DropdownMenuItem<MyLocation>(
                                child: Text(
                                  label.Lnm,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                value: label,
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() => this.select = val);
                      },
                      validator: (val) {
                        if (val == null) {
                          return 'आवश्यक फील्ड';
                        }
                        return null;
                      },
                      hint: Text(
                        'क्षेत्र निवडा',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                      isExpanded: true,
                    ),

                    Container(
                      //color: Colors.blue,
                      margin: EdgeInsets.only(
                          top: Sizeconfig.blockSizeVertical * 3.125),
                      //margin: EdgeInsets.only(top: 26.0),
                      //color: Colors.blue,
                      child: Text(
                        'महिल कुटुंब प्रमुखाचे नाव ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(66, 33, 11, 1),
                        ),
                      ),
                    ),

                    TextFormField(
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
                        this.Hname = val;
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
                      margin: EdgeInsets.only(
                          top: Sizeconfig.blockSizeVertical * 3.125),
                      //margin: EdgeInsets.only(top: 26.0),
                      //color: Colors.blue,
                      child: Text(
                        'घरचा पत्ता',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(66, 33, 11, 1),
                        ),
                      ),
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        //border: UnderlineInputBorder
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2.0)),
                        hintText: 'पत्ता प्रविष्ट करा',
                        contentPadding: EdgeInsets.only(bottom: 0),
                        errorStyle:
                            TextStyle(fontSize: 13.0, color: Colors.red[900]),
                      ),
                      onChanged: (val) {
                        this.Vadd = val;
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
                      margin: EdgeInsets.only(
                          top: Sizeconfig.blockSizeVertical * 3.125),
                      //margin: EdgeInsets.only(top: 26.0),
                      //color: Colors.blue,
                      child: Text(
                        'कुटुंबातील व्यक्तींची संख्या',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(66, 33, 11, 1),
                        ),
                      ),
                    ),

                    TextFormField(
                      autovalidate: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        //border: UnderlineInputBorder
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2.0)),
                        hintText: 'कुटुंबाची संख्या प्रविष्ट करा',
                        contentPadding: EdgeInsets.only(bottom: 0),
                        errorStyle:
                            TextStyle(fontSize: 13.0, color: Colors.red[900]),
                      ),
                      onChanged: (val) {
                        this.Fnum = val;
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
                      margin: EdgeInsets.only(
                          top: Sizeconfig.blockSizeVertical * 3.125),

                      child: Text(
                        'संपर्क (मोबाइल नंबर)',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(66, 33, 11, 1),
                        ),
                      ),
                    ),

                    TextFormField(
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
                        this.Mnum = val;
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
//                    StreamBuilder<QuerySnapshot>(
//                      stream: dbref.getSurvey(_item),
//                      builder: (context,snapshot) {
//                        if (snapshot.hasData) {
//
//                          var c=snapshot.data.documents.length;
////                           print('$c');
////                          setState(() {
////                            this.count=c;
////
////                          });
//                        }
//                        return Container();
//                      }),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0,
                          Sizeconfig.blockSizeVertical * 3.125,
                          0,
                          Sizeconfig.blockSizeVertical * 5),
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await getnum(_item);
                            await _getCurrentLocation();
                            //await dbref.gettestData(_item);

                            Future.delayed(Duration(seconds: 2), () {
                              GetUid();
                            });

                            Future.delayed(Duration(seconds: 3), () {
                              Map<String, dynamic> Vdata = {
                                'आरोग्य सेविकेचे नाव': this._item,
                                'सुपरवाइजर चे नाव': this._itemselected,
                                'वस्तीचे नाव ': this.select.Lnm,
                                'महिल कुटुंब प्रमुखाचे नाव': this.Hname,
                                'घरचा पत्ता': this.Vadd,
                                'कुटुंबातील व्यक्तींची संख्या': this.Fnum,
                                'संपर्क (मोबाइल नंबर)': this.Mnum,
                                'Timestamp': obj.format(now),
                                'Location': currentAddress,
                                'Unique no': uniquenum
                              };

                              print(now);
                              dbref.addData(Vdata);
                              Navigator.pop(context);
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      if (this.mounted) {
        setState(() {
          currentAddress =
              "${place.name},${place.subLocality},${place.locality},${place.postalCode},${place.country}";
          print(currentAddress);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  GetUid() {
    var now = new DateTime.now().year.toString().substring(2, 4);
    DateTime obj1 = DateTime.now();

    setState(() {
      this.loc = select.Lid;
      this.count = infcount;
      this.count = (count + 1).toString().padLeft(4, '0');
      print('$count');
//      this.count=
//      print('$count');

      this.uniquenum = '$id' +
          '${obj1.year.toString().substring(2, 4)}' +
          '1' +
          '$loc' +
          '$count' +
          '01';
      return uniquenum;
    });
  }

  void updateName(String value) {
    setState(() {
      this._item = value;
      print(_item);
    });
  }

//  void updatenum(Value){
//    setState(() {
//      this.count=Value;
//      print(count);
//    });
//  }

//getnumb() async {
//    QuerySnapshot _mydoc= await reference.where('आरोग्य  सेविकेचे  नाव',isEqualTo:'उर्मिला देवाडिगा').getDocuments();
//    List<DocumentSnapshot> _myDocCount=_mydoc.documents;
//    print(_myDocCount.length);
//}

  getnum(String Name) {
    streamSub = Firestore.instance
        .collection("testdata")
        .reference()
        .where("आरोग्य सेविकेचे नाव", isEqualTo: Name)
        .snapshots()
        .listen((doc) {
      setState(() {
        this.infcount = doc.documents.length;
        print('$infcount');
      });

      return infcount;
    });

//    this.count= await reference.where('आरोग्य  सेविकेचे  नाव',isEqualTo:Name).getDocuments().then((mydoc){
//      return '${(mydoc.documents.length+1).toString().padLeft(4,'0')}';
//    });
//    print('$count');
//
  }

  @override
  void dispose() {
    streamSub?.cancel();
    super.dispose();
  }
}

