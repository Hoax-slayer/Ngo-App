import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:csscngo/Screens/dashboard.dart';
import 'package:csscngo/Screens/home/login.dart';

class AuthService{
//  String phoneNo;
//  String verificationId;
//  String smsCode;

//  final FirebaseAuth _auth = FirebaseAuth.instance;

//create user obj based on FirebaseUser

//  User _userFromFirebaseUser(FirebaseUser user){
//
//
//    return user != null ? User(uid: user.uid): null;
//  }


// auth change user stream
//  Stream<User> get user{
//    return _auth.onAuthStateChanged
//    //.map((FirebaseUser user) =>  _userFromFirebaseUser(user));
//        .map(_userFromFirebaseUser);
//
//  }

//  Future<String> currentUser() async {
//    FirebaseUser user = await _auth.currentUser();
//    return user != null ? user.uid : null;
//  }

  //sign in anon
//  Future signInAnon() async{
//    try{
//      AuthResult result = await _auth.signInAnonymously();
//      FirebaseUser user = result.user;
//      return _userFromFirebaseUser(user);
//
//    }
//    catch(e){
//      print(e.toString());
//      return null;
//    }
//  }

//
//  Future getId() async {
//    final FirebaseUser user = await _auth.currentUser();
//    return user.uid;
//    // here you write the codes to input the data into firestore
//  }






//sign in with phone number

//Future<void> verifyPhone(phoneNo) async{
//
//    final PhoneCodeAutoRetrievalTimeout autoRetrieve= (String verId){
//      this.verificationId=verId;
//    };
//
//    final PhoneCodeSent smsCodesent= (String verId,[int forceCodeResend]){
//      this.verificationId=verId;
//    };
//
//    final PhoneVerificationCompleted  verifiedSuccess= (AuthCredential authResult) {
//      AuthService().signin(authResult);
//      print('verified');
//    };
//    final PhoneVerificationFailed verifiFailed = (AuthException authException){
//      print('${authException.message}');
//    };
//
//    await FirebaseAuth.instance.verifyPhoneNumber(
//        phoneNumber: this.phoneNo,
//        timeout: const Duration(seconds: 10),
//        verificationCompleted: verifiedSuccess,
//        verificationFailed: verifiFailed,
//        codeSent: smsCodesent,
//        codeAutoRetrievalTimeout: autoRetrieve,   );
//}

  handleAuth() {
    return StreamBuilder (
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot ){
          if(snapshot.hasData){
            return Third();
          }
          else{
            return MyHomePage();
          }
        }
    );
  }


//sign out

  Future signout() async{
    await FirebaseAuth.instance.signOut();
  }
//sign in


// Future signin(AuthCredential authCreds) async{
//
//    await FirebaseAuth.instance.signInWithCredential(authCreds);
//
// }
//
// Future signInwithOTP(smscode,verId) {
//    AuthCredential authCreds=PhoneAuthProvider.getCredential(
//        verificationId: verId,
//        smsCode: smscode);
//    signin(authCreds);
// }

//  signIn() async {
//    try {
//      final AuthCredential credential = PhoneAuthProvider.getCredential(
//        verificationId: verificationId,
//        smsCode: smsCode,
//      );
//       await FirebaseAuth.instance.signInWithCredential(credential);
//    }catch(e){
//    print(e.toString());}
//  }

//      Future<bool> smsOTPDialog(BuildContext context){
//    return showDialog(
//        context: context,
//      barrierDismissible: false,
//        builder:(context) {
//          return SingleChildScrollView(
//              child: AlertDialog(
//                elevation: 5.0,
//                 title: Text('Enter OTP'),
//                 content:Container(
//                  height: 85,
//                   child: TextFormField(
//                         keyboardType: TextInputType.number,
//                          onChanged: (val){
//                                   this.smsCode=val;},
//                         decoration: InputDecoration(
//                            enabledBorder: UnderlineInputBorder(
//                              borderSide: BorderSide(color:Color.fromRGBO(255, 124, 92, 1) ,
//                                width: 2.0, ),
//                                      ),
//                           focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color:Color.fromRGBO(255, 124, 92, 1) ,
//                                 width: 2.0, )
//                                    ),
//                                  ) ,
//                              ),
//                                ),
//                 actions: <Widget>[
//                    Center(
//                      child: MaterialButton(
//                        color: Color.fromRGBO(255, 124, 92, 1),
//                        textColor: Colors.white,
//                        shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(8.0),
//                                      ),
//                        onPressed: () async {
//                          await signIn();
//                          },
//                        child: Text('Verify',
//                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
//
//                      ),
//                    )
//                  ],
//
//              )
//          );
//        }
//    );
//
}

