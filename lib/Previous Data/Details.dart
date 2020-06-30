
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Details extends StatefulWidget {
  final DocumentSnapshot get;

  Details({this.get});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255,233,217,1),
      appBar: AppBar(
        title: Text(
            widget.get.data['महिल कुटुंब प्रमुखाचे नाव'] ?? 'default value'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: ListView(
          shrinkWrap: true,
          //cacheExtent: 300,
          scrollDirection: Axis.vertical,
          controller: ScrollController(),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              //color: Colors.cyanAccent,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.get.data['कुटुंबातील व्यक्तींची संख्या']
                          .toString() ??
                      'default value'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(widget.get.data['Location'] ?? 'default value',
                      style: TextStyle(
                          color: Color.fromRGBO(46, 77, 92, 1), fontSize: 17)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(widget.get.data['घरचा पत्ता'] ?? 'default value',
                      style: TextStyle(
                          color: Color.fromRGBO(46, 77, 92, 1), fontSize: 17)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(widget.get.data['Unique no'].toString() ??
                      'default value'),
                  SizedBox(height: 20,),

                  Text('Members Details',style: TextStyle(fontSize: 20 ),),



                  FutureBuilder<QuerySnapshot>(
                    future:widget.get.reference.collection('members').getDocuments(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                      if(snapshot.connectionState == ConnectionState.none && snapshot.hasData == null){
                        return Container(
                          child: Center(
                            child: Text("No Members"),
                          )
                        );
                      }
                     else if (!snapshot.hasData) {
                        return Container(
                          child: Center(child: CircularProgressIndicator(),),
                        );
                      } else if (snapshot.hasError) {
                        return Container(
                          child: Icon(
                            Icons.error,
                            size: 35,
                            color: Colors.red,
                          ),
                        );
                      }

                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.documents.length,
                          itemExtent: 40,
                          itemBuilder: (BuildContext context, index) {
                            DocumentSnapshot doc =
                            snapshot.data.documents[index];
                            return ListTile(

                              title: Text(doc['रुग्णाचे नाव']),
                              subtitle: Text(doc['रुग्णाची समस्या निवडा']),
                            );
                          }

                      );
                    }),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }

  Future getissues(String Name, String Fname) async {
    final CollectionReference ref = Firestore.instance.collection("testdata");

    var data = await ref
        .reference()
        .where("आरोग्य सेविकेचे नाव", isEqualTo: Name)
        .where("महिल कुटुंब प्रमुखाचे नाव", isEqualTo: Fname)
        .getDocuments()
        .then((query) {
      query.documents.forEach((res) {
        ref
            .document(res.documentID)
            .collection("members")
            .getDocuments();
//            .then((snap) {
//          snap.documents.forEach((val) {
//            print("Executing");
//
//          });
//        });
      });
    });
    return data;
  }

}
