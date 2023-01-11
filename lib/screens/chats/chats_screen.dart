
import 'package:flutter/material.dart';
import 'package:mad_project/pages/categorybottombar.dart';
import 'package:mad_project/widgets/AppBar.dart';
import '../chats/components/body.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body:  Body(),
      bottomNavigationBar: CategoryBottomBar(),
    );
  }
}
