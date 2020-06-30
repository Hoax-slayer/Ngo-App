import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dart:async';

class DbService {
  final Firestore obj = Firestore.instance;

  Future<void> addData(Vdata) async {
    try {
      await obj.collection('testdata').add(Vdata);

//      Firestore.instance.runTransaction((Transaction crudTransaction) async {
//        CollectionReference reference =
//          await Firestore.instance.collection('basicInfo');
//        reference.add(Vdata);

    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addtoissue(String Name, String text, Sdata) async {
    CollectionReference ref =
        Firestore.instance.collection("testdata").reference();

    try {
      await ref
          .where("आरोग्य सेविकेचे नाव", isEqualTo: Name)
          .where("महिल कुटुंब प्रमुखाचे नाव", isEqualTo: text)
          .getDocuments()
          .then((value) {
            print(value.documents.length);
            if(value.documents.length!=0){
              value.documents.forEach((res) {
                obj
                    .collection("testdata")
                    .document(res.documentID)
                    .collection("members")
                    .add(Sdata)
//                    .catchError((e){
//                  print(e);
//                  return Align(alignment:Alignment.bottomCenter,child: Text('Invalid Family Name'));
//                });
                    .then((_) {
                  print("Success");
                });
              });
            }
            return Container(alignment: Alignment.bottomCenter,child: Text('Invalid Family Name'),);


//           await obj.collection("testdata")
//                .document(value.documentID)
//                .collection("members")
//                .add(Sdata);
      });
//

//      await obj.collection('testdata1').add(dt);

    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> userdata(dt) async {
    try {
      await obj.collection('Users').add(dt).then((value) {
        print(value.documentID);
        print('Success');
      });
    } catch (e) {
      print(e.toString());
    }
  }

  gettestData(String Name) {
    try {

      Stream<QuerySnapshot > test = Firestore.instance
          .collection("testdata")
          .reference()
          .where("आरोग्य सेविकेचे नाव", isEqualTo: Name)
          .snapshots();
           return test;
//          .listen((result) {
//        result.documents.forEach((result) {
//          print(result.data);
//        });
//      });

//      then((event){
//        if(event.documents.isNotEmpty){
//
//        }
//      };
    }  catch (e) {
      print(e.toString());
    }
  }

  getSurvey(String Name) {
    Stream<QuerySnapshot> name = Firestore.instance
        .collection("masterdata")
        .reference()
        .where('आरोग्य  सेविकेचे  नाव', isEqualTo: Name)
        .snapshots();
    return name;

    // .orderBy('Timestamp',descending: true).snapshots();
  }

//  Future getnum(String Name) async {
//
//    String count= await reference.where('आरोग्य  सेविकेचे  नाव',isEqualTo:Name).getDocuments().then((mydoc){
//      return '${mydoc.documents.length.toString()}';
//    });
//    print('$count');
//
////    await obj.collection('masterdata').where('आरोग्य  सेविकेचे  नाव',isEqualTo:Name).getDocuments().then((mydoc){
////      return'${mydoc.documents.length}' ;
////    });
//  }

//  getSurvey(String Name)  {
//    return  Firestore.instance.
//    collection('masterdata').where('आरोग्य  सेविकेचे  नाव',isEqualTo:Name).snapshots();
//    // .orderBy('Timestamp',descending: true).snapshots();
//  }

}
