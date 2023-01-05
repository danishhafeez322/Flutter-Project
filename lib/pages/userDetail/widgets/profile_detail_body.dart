import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/main.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                
                const Icon(
                  Icons.person,
                  color: AppColors.chatColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'User Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black87,
              thickness: 1,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(

              children: [
                const Icon(
                  Icons.email,
                  color: AppColors.chatColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'User Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black87,
              thickness: 1,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: AppColors.chatColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'User Phone',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black87,
              thickness: 1,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_city,
                  color: AppColors.chatColor,
                ),

                const SizedBox(
                  width: 10,
                ),
                const Text(

                  'User Address',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black87,
              thickness: 1,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.chatColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'User City',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black87,
              thickness: 1,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap:  () async{
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                  return WelcomePage();
                }), (r){
                  return false;
                });
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.logout,
                    color: AppColors.chatColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      
                    ),
                  ),
                ],
              ),
            ),
]
))
);
}
}