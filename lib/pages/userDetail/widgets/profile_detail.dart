import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/core/constant/app_color.dart';

import '../../Registorpage.dart';
import '../edit_user_detail.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  MyUser currentUser = MyUser(uname: "User Name", email: "abc@xyz", contact_no: 0, address: " ", city: " ", cnic: 0, isLogin: true,isVerified: true,rating: 0);
    Future<void> myCurrentUser() async{  
      
      final docUser = await FirebaseFirestore.instance.collection('/users').doc(FirebaseAuth.instance.currentUser!.uid);
      final doc = await docUser.get();
      if(doc.exists)
      {        
        currentUser = MyUser.fromMap(doc.data() as Map<String, dynamic>);
      }
      else
      {
       currentUser = MyUser(uname: "User name", email: "Email", contact_no: 0, address: "MyAddress", city: "city", cnic: 0, isLogin: true,isVerified: true,rating: 0);
       
        
      }
      setState(() {
         
       }); 
    }
    void initState()  {
      super.initState();
       myCurrentUser();
      setState(() {
        
      });
    }
  @override
  Widget build(BuildContext context) {
    myCurrentUser();
    
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            color: AppColors.chatColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentUser.uname,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    currentUser.email,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditUserDetailView(
                        name: currentUser.uname,
                        email: currentUser.email,
                        phone: currentUser.contact_no.toString(),
                        address: currentUser.address,
                        city: currentUser.city,                        
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}




