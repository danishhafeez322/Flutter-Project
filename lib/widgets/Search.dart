import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'SearchDetail.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SearchPage());
}

class SearchPage extends StatefulWidget {
  //String query;
  //const SearchPage({super.key} this.query);

  @override
  State<SearchPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SearchPage> {
  String name = '';
  TextEditingController cont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        title: Container(
          decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(30)),
          child: TextField(
            controller: cont,
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(15),
                enabledBorder: InputBorder.none,
                //suffixIcon: Icon(Icons.cancel),
                suffixIcon: (name.isNotEmpty)
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            cont.text = "";
                            name = "";
                          });
                        },
                        icon: Icon(
                          Icons.cancel,
                        ),
                      )
                    : null,
                hintText: 'Search'),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Items").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 20, right: 5, left: 5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, index) {
                  var data =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;

                  if (data["title"]
                          .toLowerCase()
                          .toString()
                          .contains(name.toLowerCase()) ||
                      name
                          .toLowerCase()
                          .contains(data["title"].toLowerCase().toString()) ||
                      data["price"].toString().startsWith(name.toLowerCase()) ||
                      data["description"]
                          .toString()
                          .contains(name.toLowerCase()) ||
                      data["guarantee_price"]
                          .toString()
                          .startsWith(name.toLowerCase())) {
                    // return Card(
                    //   child: ListTile(
                    //     title: Text(
                    //       snapshot.data!.docChanges[index].doc['title'],
                    //     ),
                    //   ),
                    // );
                    return SearchDetails(item: data);
                  }
                  return Container();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
