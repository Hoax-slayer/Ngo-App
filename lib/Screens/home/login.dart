import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csscngo/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:csscngo/Services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:csscngo/Services/sizeconfig.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class Myname{
  String mn;
  String mid;
  Myname({this.mn,this.mid});
}



class _MyHomePageState extends State<MyHomePage> {

  String namekey;
  List<Myname> myname;
  TextEditingController controller= TextEditingController();
  Myname selected;
  Firestore db= Firestore.instance;

  String  Hnum;
  bool codeSent =false;
  String verificationId;
  String smsCode;
  AuthService obj1= new AuthService();
  DbService dbref = new DbService();
  bool loading= false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();

    myname=[ Myname(mn: 'उर्मिला देवाडिगा',mid: '01'), Myname(mn: 'निकिता राघव',mid: '02'), Myname(mn:'शुभांगी देसाई',mid: '03'),
      Myname(mn: 'मेहताबी शेरव' ,mid: '04'), Myname(mn: 'सुगंधा घवाळी',mid: '05'), Myname(mn: 'सुनिता कदम',mid: '06'),
      Myname(mn: 'आबिदा शेख',mid: '07'), Myname(mn: 'प्रणिता घुमे',mid: '08'), Myname(mn: 'विजया साळवी',mid: '09'),
      Myname(mn: 'शोभा कांबळे',mid: '10'), Myname(mn: 'नुतन बर्डे',mid: '11'), Myname(mn: 'भाग्यश्री बाबरेकर',mid: '12'),
      Myname(mn: 'स्मिता कदम',mid: '13'), Myname(mn: 'नम्रता देवळेकर',mid: '14'), Myname(mn: 'रोहिणी साळवी',mid: '15'),
      Myname(mn: 'वर्षा आंब्रे', mid: '16'), Myname(mn:  'चित्रा कदम',mid: '17'), Myname(mn: 'वैशाली चव्हाण',mid: '18'),
      Myname(mn:'सविता शिरोडकर',mid: '19'), Myname(mn: 'जयश्री तांबे',mid: '20'), Myname(mn: 'आरती मोहिते',mid: '21'),
      Myname(mn: 'सुषमा भोसले',mid: '22'), Myname(mn: 'विजया शेलार',mid: '23'), Myname(mn:'श्वेता गमरे',mid: '24'),
      Myname(mn: 'सूरेखा कोडते',mid: '25'), Myname(mn:'कुसुम भारतीया',mid: '26'), Myname(mn: 'वनिता धायफुले',mid: '27'),
      Myname(mn: 'रजिया शेख',mid: '28'), Myname(mn: 'प्रणाली सावंत',mid: '29'), Myname(mn: 'शांता दारोळे',mid: '30'),
      Myname(mn: 'जयश्री पवाल',mid: '31'), Myname(mn: 'रशिदा शेख',mid: '32'), Myname(mn: 'सुगंधा कानडे',mid: '33'),
      Myname(mn: 'वैशाली मोरे',mid: '34'), Myname(mn: 'सरिता तेली',mid: '35'), Myname(mn: 'रागिणी चिंदरकर',mid: '36'),
      Myname(mn:'चंद्रकला प्रभू',mid: '37'), Myname(mn: 'रजनी जाधव',mid: '38'), Myname(mn: 'महानंदा कदम',mid: '39'),
      Myname(mn: 'मनिषा निकम',mid: '40'), Myname(mn: 'दिपाली कानडे',mid: '41'), Myname(mn:'मीना श्रीवास्तव',mid: '42'),
      Myname(mn: 'शालीनी नाकती',mid: '43'), Myname(mn: 'सुवर्णा गोरक्ष' ,mid: '44'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Sizeconfig().init(context);
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(

          width: Sizeconfig.screenWidth,
          height: Sizeconfig.screenHeight,

          child: Stack(

            children:<Widget> [
              Container(
                //color: Colors.black,
                width: Sizeconfig.screenWidth,
                height: Sizeconfig.blockSizeVertical*40.938,
                margin: EdgeInsets.only(top: Sizeconfig.safeBlockVertical*13.983),
                child: SvgPicture.asset('assets/BG_Art.svg', fit: BoxFit.fill),
              ),
              Container(
                height: Sizeconfig.safeBlockVertical * 23.089 ,
                //color: Colors.black,
                alignment: Alignment.center,
                child: SvgPicture.asset('assets/Welcome.svg'),
              ),


//        Padding(
//              padding: EdgeInsets.only(bottom: 318.0),
//            ),
//
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(

                  margin: EdgeInsets.only(bottom:Sizeconfig.blockSizeVertical*5.468),
                  width: Sizeconfig.blockSizeHorizontal*89.45,
                  height: Sizeconfig.blockSizeVertical*44.219,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  ),
                  //padding: ,
                  child: Form(
                    key:_formKey ,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("चला शुरू करा",
                              style: TextStyle(fontSize: 28,
                              //Sizeconfig.safeBlockHorizontal*7.78,
                                color: Color.fromRGBO(46, 77, 92, 1) ,
                                //letterSpacing: 0.5,

                              ),
                            )
                          ],
                        ),
                        Divider(
                          color: Color.fromRGBO(238, 238, 238, 1),
                          height: 0,
                          thickness: 2,

                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: Sizeconfig.blockSizeHorizontal*69.45,
                              child: DropdownButtonFormField<dynamic>(
                                value: selected,
                                icon: Icon(Icons.arrow_drop_down,size: 30,color: Color.fromRGBO(255, 124, 92, 1) ,),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1.0,
                                      color:Color.fromRGBO(255, 124, 92, 1))
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color:Color.fromRGBO(255, 124, 92, 1) ,
                                      width: 2.0, ),
                                  ),
                                ),

                                items: myname.map((label)=>DropdownMenuItem<Myname>(
                                  child: Text(label.mn,style: TextStyle(fontSize: 18),),
                                  value: label,)).toList(),
                                onChanged: (val){
                                  setState(()=> this.selected=val);
                                },
                                validator: (val){
                                  if (val==null) {

                                    return 'आवश्यक फील्ड';
                                  }
                                  return null;
                                },
                                hint: Text('नाव प्रविष्ट करा',style: TextStyle(color: Color.fromRGBO(255, 124, 92, 1),
                                    fontSize: 20,fontWeight: FontWeight.w300),
                                ),
                                isExpanded: true,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              width: Sizeconfig.blockSizeHorizontal*69.45,
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color:Color.fromRGBO(255, 124, 92, 1) ,
                                      width: 1.0, ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color:Color.fromRGBO(255, 124, 92, 1) ,
                                      width: 2.0, ),

                                  ),
                                  hintText:'मोबाइल नंबर प्रविष्ट करा',
                                  hintStyle: (TextStyle(color: Color.fromRGBO(255, 124, 92, 1),
                                      fontSize: 20)),
                                      //Sizeconfig.safeBlockHorizontal*5.56 )),

                                  contentPadding: EdgeInsets.only(bottom: 0) ,
                                  errorStyle: TextStyle(
                                      fontSize: 13.0, color: Colors.red[900]),
                                ) ,

                                onChanged: (val){
                                  this.Hnum = val;
                                },
                                validator: (val){
                                  if (val.length<=10){
                                    return 'संख्या दहा अंकी जास्तीत जास्त असावी';

                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 70),
                            ),

                            SizedBox(
                              width: Sizeconfig.blockSizeHorizontal*58.34,
                              height: Sizeconfig.blockSizeVertical*6.72,
                              child: RaisedButton(
                                elevation: 0,
                                color: Color.fromRGBO(255, 124, 92, 1),
                                textColor: Colors.white,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),

                                onPressed: () async {
                                  if (_formKey.currentState.validate()){
                                    print(selected.mid);
                                    print(selected.mn);
                                    savename();
                                    Map<String, dynamic> Userdata={'Name':selected.mn,'Id':selected.mid,
                                      'phone':this.Hnum, };

                                    await verifyPhone();

                                  }

                                },
                                child: Text(
                                  'साइन इन करा',
                                  style: TextStyle(fontSize: 27,
                                  //Sizeconfig.safeBlockVertical*4.39,
                                      fontWeight: FontWeight.bold),
                                ),
                                focusElevation: 20.0,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(255,233,217,1),
    );
  }


  Future<void> verifyPhone() async {

    final PhoneCodeSent smsCodesent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsOTPDialog(context).then((value){
        //print("signed in");
      });
//      setState(() {
//        this.codeSent = true;
//      });
    };

    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };

    final PhoneVerificationCompleted verifiedSuccess =
        (AuthCredential credential){
      print('Enter Otp');
    };
//       ( AuthCredential authResult) {
//      AuthService().signin(authResult);
//      print('verified');
//    };
    final PhoneVerificationFailed verifiFailed = (AuthException authException) {
      print('${authException.message}');
    };
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.Hnum.trim(),
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodesent,
        timeout: const Duration(seconds: 20),
        verificationCompleted: verifiedSuccess,
        verificationFailed: verifiFailed,

      );
    }
    catch(e){
      print(e.toString());
    }

  }
  signIn() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      print('siggned in');
    }catch(e){
      print(e.toString());}
  }
  Future<bool> smsOTPDialog(BuildContext context){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder:(context) {
          return SingleChildScrollView(
              child: AlertDialog(
                elevation: 5.0,
                title: Text('Enter OTP'),
                content:Container(
                  height: Sizeconfig.blockSizeVertical*13.281,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (val){
                      this.smsCode=val;},
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:Color.fromRGBO(255, 124, 92, 1) ,
                          width: 2.0, ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Color.fromRGBO(255, 124, 92, 1) ,
                            width: 2.0, )
                      ),
                    ) ,
                  ),
                ),
                actions: <Widget>[
                  Center(
                    child: MaterialButton(
                      color: Color.fromRGBO(255, 124, 92, 1),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      onPressed: () async {
                        loading=true;
                        Navigator.pop(context);
                        await signIn();


                      },
                      child: Text('Verify',
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),

                    ),
                  )
                ],

              )
          );
        }
    );
  }

  void savename(){
    String Name= selected.mn;
    String Id=selected.mid;
    saveData(Name);
    saveId(Id);
  }
}

Future<bool> saveData(String Name) async{
  SharedPreferences preferences= await SharedPreferences.getInstance();
  return await preferences.setString('name', Name);
}

Future<String> loaddata() async{
  SharedPreferences preferences= await SharedPreferences.getInstance();
  String Name= preferences.getString('name');
  return Name ;
}

Future<bool> saveId(String Id) async{
  SharedPreferences preferences= await SharedPreferences.getInstance();
  return await preferences.setString('id', Id);
}

Future<String> loadid() async{
  SharedPreferences preferences= await SharedPreferences.getInstance();
  String Id= preferences.getString('id');
  return Id ;
}

