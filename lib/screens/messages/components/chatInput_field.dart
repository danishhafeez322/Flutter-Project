import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mad_project/core/constant/app_color.dart';

import '../../../core/constant/constants.dart';
import '../../../models/Chat.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({Key? key, required this.chat}) : super(key: key);
  final Chat chat;
  static const double myopacity = 0.08;

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  
  var controllerMessage = TextEditingController();
  var message = '';

  void sendMessage() async{

    if(message.trim().isEmpty){
      return;
    }
    FocusScope.of(context).unfocus();
    setState(() {
      controllerMessage.text = '';
    });
    // await FirebaseFirestore.instance.collection('chat').add({
    //   // 'text': message,
    //   // 'createdAt': Timestamp.now(),
    //   // 'senderId': FirebaseAuth.instance.currentUser!.uid,
    //   // 'receiverId': FirebaseAuth.instance.currentUser!.displayName,
    // });
    // Future<MyUser> myCurrentUser() async{        
    //   final docUser = await FirebaseFirestore.instance.collection('/users').doc(FirebaseAuth.instance.currentUser!.uid);
    //   final doc = await docUser.get();
    //   return MyUser.fromMap(doc.data() as Map<String, dynamic>);      
    // }
      // MyUser currentUser = myCurrentUser() as MyUser;
      try{
        // await FirebaseFirestore.instance.collection('chat').doc(FirebaseAuth.instance.currentUser!.uid).set({
        //   'lastMessage': message,
        //   'createdAt': Timestamp.now(),
        //   'senderId': FirebaseAuth.instance.currentUser!.uid,
        //   'senderName': FirebaseAuth.instance.currentUser!.uid,
        //   'receiverName': widget.chat.name, 
        //   'receiverId': widget.chat.uid
        // });
        // await FirebaseFirestore.instance.collection('chat').doc(FirebaseAuth.instance.currentUser!.uid).collection('chatMessages').add({ 
        //   'message': message, 
        //   'createdAt': Timestamp.now()
        // });
      // await FirebaseFirestore.instance.collection('chat').doc(FirebaseAuth.instance.currentUser!.uid).set({
        
      // });
      // await FirebaseFirestore.instance.collection('chat').doc(FirebaseAuth.instance.currentUser!.uid).collection('receiver').doc(widget.chat.uid).set({
      //   'lastMessage': message,
      //   'createdAt': Timestamp.now(),
      //   'senderId': FirebaseAuth.instance.currentUser!.uid,
      //   'senderName': FirebaseAuth.instance.currentUser!.uid,
      //   'receiverName': widget.chat.name, 
      //   'receiverId': widget.chat.uid
      // });
      // await FirebaseFirestore.instance.collection('chat').doc(FirebaseAuth.instance.currentUser!.uid).collection('receiver').doc(widget.chat.uid).collection('chatMessages').add({ 
      //   'message': message, 
      //   'createdAt': Timestamp.now()
      // });

      // RvntAQgt4LMNHU5tp7O38dFMqYH2
      // if(FirebaseAuth.instance.currentUser!.uid == 'RvntAQgt4LMNHU5tp7O38dFMqYH2'){      
          await FirebaseFirestore.instance.collection('chat').doc(FirebaseAuth.instance.currentUser!.uid).set({
            
          });
          await FirebaseFirestore.instance.collection('chat').doc(FirebaseAuth.instance.currentUser!.uid).collection('receiver').doc('gcCAe7QW6HUuEk0RCRcGDqFuLXy2').set({
            'lastMessage': message,
            'createdAt': Timestamp.now(),
            'senderId': FirebaseAuth.instance.currentUser!.uid,
            'senderName': FirebaseAuth.instance.currentUser!.uid,
            'receiverName': widget.chat.name, 
            'receiverId': widget.chat.uid
          });
          await FirebaseFirestore.instance.collection('chat').doc(FirebaseAuth.instance.currentUser!.uid).collection('receiver').doc('gcCAe7QW6HUuEk0RCRcGDqFuLXy2').collection('chatMessages').add({ 
            'message': message, 
            'createdAt': Timestamp.now()
          });
      // }
      // else{
          await FirebaseFirestore.instance.collection('chat').doc(FirebaseAuth.instance.currentUser!.uid).set({
            
          });
          await FirebaseFirestore.instance.collection('chat').doc(FirebaseAuth.instance.currentUser!.uid).collection('receiver').doc('RvntAQgt4LMNHU5tp7O38dFMqYH2').set({
            'lastMessage': message,
            'createdAt': Timestamp.now(),
            'senderId': FirebaseAuth.instance.currentUser!.uid,
            'senderName': FirebaseAuth.instance.currentUser!.uid,
            'receiverName': widget.chat.name, 
            'receiverId': widget.chat.uid
          });
          await FirebaseFirestore.instance.collection('chat').doc(FirebaseAuth.instance.currentUser!.uid).collection('receiver').doc('RvntAQgt4LMNHU5tp7O38dFMqYH2').collection('chatMessages').add({ 
            'message': message, 
            'createdAt': Timestamp.now()
          });
      // }
    }catch(e){      
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 32,
              color: AppColors.chatTextColor.withOpacity(0.08),
            ),
          ]),
      child: SafeArea(
        child: Row(
          children: [
            
            Expanded(
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.chatTextColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controllerMessage,
                        style: TextStyle(color:AppColors.chatTextColor),
                        decoration: InputDecoration(
                          hintText: "Type Message",
                          border: InputBorder.none,
                        ),
                        onChanged: (myVal) => setState(() {
                          message = myVal;  
                        })
                        
                      ),
                    ),
                    
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.color
                          ?.withOpacity(0.64),
                    ),
                  ],
                ),
              ),
            ),
            
            GestureDetector(
              onTap: sendMessage,
              
              child:
               Icon(
                Icons.send,
                color: AppColors.chatColor.withOpacity(0.64),
              ),
            ),
          ],
        ),
      ),
    );
  }
}