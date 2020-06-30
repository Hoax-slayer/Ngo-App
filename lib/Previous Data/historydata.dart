import 'dart:collection';

import 'package:csscngo/Screens/home/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csscngo/Services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:csscngo/Previous Data/Details.dart';
import 'dart:async';
import 'package:csscngo/Services/sizeconfig.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final DbService obj2 = new DbService();

  String Name = '';
  String count = '';

  @override
  void initState() {
    super.initState();
    loaddata().then(updateName);
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      //width: 320,
      child: Card(
        color: Colors.white,
        child: Column(
          //mainAxisAlignment: ,
          children: <Widget>[
            ListTile(
              title: Text(
                document['महिल कुटुंब प्रमुखाचे नाव'],
                style: TextStyle(
                    color: Color.fromRGBO(46, 77, 92, 1), fontSize: 20),
              ),
              subtitle: Text(document['Unique no'].toString(),),

              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Color.fromRGBO(255, 124, 92, 1), size: 23.0),
              onTap: () async {
                await NavigatetoDetail(document);
              },
            )
          ],
        ),
      ),

//      ListTile(
//
//
//        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//        title: Text(document['महिल कुटुंब प्रमुखाचे नाव'],
//          style: TextStyle(color: Color.fromRGBO(46, 77, 92, 1) ,fontSize: 20),
//        ),
//        subtitle: Text(document['नवीन कुटुंबाचा युनिक नंबर'].toString(),),
//        onTap: (){
//          NavigatetoDetail(document);
//        },
//        trailing: Icon(Icons.keyboard_arrow_right,color:Color.fromRGBO(255, 124, 92, 1), size: 23.0)),
    );
  }

//      ListView(
//      shrinkWrap: true,
//      //cacheExtent: 300,
//      scrollDirection: Axis.vertical ,
//      controller: ScrollController(),
//      children: <Widget>[
//
//
//        Container(
//          //color: Colors.cyanAccent,
//          width: MediaQuery.of(context).size.width,
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.start,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            //crossAxisAlignment: CrossAxis,
//            children: <Widget>[
//              Flexible(
//                  flex: 3,
//                  child: Container(
//                    color: Colors.blue,
//                    width: 160,
//                      child: Text(document['महिल कुटुंब प्रमुखाचे नाव'])
//                  )
//              ),
//              Flexible(
//                flex: 1,
//                child: Container(
//                  width: 60,
//                  //color: Colors.red,
//                  child: Column(
//                      children:<Widget> [ Text(document['कुटुंबातील व्यक्तींची संख्या'].toString())]
//                  ),
//                ),
//              ),
//              Flexible(
//                flex: 2,
//                child: Container(
//                  color: Colors.green,
//                  width: 120,
//                  child: Column(
//                      children:<Widget> [Text(document['वस्तीचे नाव']),]
//                  ),
//                ),
//              ),
//
//            ],
//          ),
//        ),
//      ],
//    );

  @override
  Widget build(BuildContext context) {
    Sizeconfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Color.fromRGBO(255, 124, 92, 1),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: DataSearch(obj2.gettestData(Name)));
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top:Sizeconfig.blockSizeVertical*3.125 ),
        child: StreamBuilder<QuerySnapshot>(
          stream: obj2.gettestData(Name),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemExtent: Sizeconfig.blockSizeVertical*12.5,
              padding: EdgeInsets.only(left:Sizeconfig.blockSizeHorizontal*2.78),
              itemBuilder: (BuildContext context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            );
          },
        ),
      ),
      backgroundColor: const Color.fromRGBO(255, 233, 217, 1),
    );
  }

  NavigatetoDetail(DocumentSnapshot get) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Details(
                  get: get,
                )));
  }

  void updateName(String name) {
    setState(() {
      this.Name = name;
    });
  }
}

class DataSearch extends SearchDelegate {
  final Stream stream;
  DataSearch(this.stream);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.close,
          size: 25,
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: 25,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if (query.isEmpty) {
      return Container();
    }
    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> results = snapshot.data.documents;
            final List<DocumentSnapshot> suggestion = [];

            print(results.length);
            results.forEach((doc) {
              if (doc.data["महिल कुटुंब प्रमुखाचे नाव"].contains(query) ==
                  true) {
                suggestion.add(doc);
              }
            });
            print(suggestion.length);

            return ListView.builder(
                itemCount: suggestion.length,
                itemExtent: Sizeconfig.blockSizeVertical*12.5,
                padding: EdgeInsets.only(left:Sizeconfig.blockSizeHorizontal*2.78),
                itemBuilder: (BuildContext context, index) =>
                    BuildItem(context, suggestion[index]));
          } else {
            return Center(
              child: Text(
                'No data',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
        });
  }

  BuildItem(BuildContext context, DocumentSnapshot document) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Card(
        color: Colors.white,
        child: Column(
          //mainAxisAlignment: ,
          children: <Widget>[
            ListTile(
              title: Text(
                document['महिल कुटुंब प्रमुखाचे नाव'],
                style: TextStyle(
                    color: Color.fromRGBO(46, 77, 92, 1), fontSize: 20),
              ),
              subtitle: Text(document['Unique no']),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Color.fromRGBO(255, 124, 92, 1), size: 23.0),
              onTap: () {
                close(context, null);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Details(
                              get: document,
                            )));
              },
            )
          ],
        ),
      ),
    );
  }
}
