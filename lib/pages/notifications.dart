import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Notificationd extends StatefulWidget {
  const Notificationd({Key? key}) : super(key: key);

  @override
  State<Notificationd> createState() => _NotificationdState();
}

class _NotificationdState extends State<Notificationd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Rent itt",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 5),
            child: ClipOval(
              child: Image.asset("assets/images/danish.jpeg"),
            ),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            "No Notifications",
            style: TextStyle(color: Colors.redAccent, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
