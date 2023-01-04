import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/core/constant/app_text.dart';
import 'package:mad_project/product/widget/custom_elevated_button.dart';
import 'package:mad_project/product/widget/custom_textfield.dart';

import 'login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }
  SizedBox _body(BuildContext context) {    
  final controllerName = TextEditingController();
  final controllerAddress = TextEditingController();
  final controllerCity = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerContact = TextEditingController();
  final controllerCnic = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirm = TextEditingController();

  

    return SizedBox(
      height: context.height * 1,
      width: context.width * 1,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // context.emptySizedHeightBoxLow3x,
            topImage(context),
            // context.emptySizedHeightBoxLow3x,
            topText(context),
            context.emptySizedHeightBoxLow3x,
            CustomTextField(
              controller: controllerName,
              height: context.height * 0.07,
              width: context.width * 0.8,
              hinttext: AppText.uname,
              prefixIcon: const Icon(
                Icons.person,
                color: AppColors.loginColor,
              ),
            ),
            context.emptySizedHeightBoxLow,
            CustomTextField(
              controller: controllerAddress,
              height: context.height * 0.07,
              width: context.width * 0.8,
              hinttext: AppText.address,
              prefixIcon: const Icon(
                Icons.location_city,
                color: AppColors.loginColor,
              ),
            ),
            context.emptySizedHeightBoxLow,
            CustomTextField(
              controller: controllerCity,
              height: context.height * 0.07,
              width: context.width * 0.8,
              hinttext: AppText.city,
              prefixIcon: const Icon(
                Icons.home,
                color: AppColors.loginColor,
              ),
            ),
            context.emptySizedHeightBoxLow,
            CustomTextField(
              controller: controllerEmail,
              height: context.height * 0.07,
              width: context.width * 0.8,
              hinttext: AppText.email,
              prefixIcon: const Icon(
                Icons.email,
                color: AppColors.loginColor,
              ),
            ),
            context.emptySizedHeightBoxLow,            
            CustomTextField(
              controller: controllerContact,
              height: context.height * 0.07,
              width: context.width * 0.8,
              hinttext: AppText.contact,
              prefixIcon: const Icon(
                Icons.phone,
                color: AppColors.loginColor,
              ),
            ),
            context.emptySizedHeightBoxLow,
            CustomTextField(
              controller: controllerCnic,
              height: context.height * 0.07,
              width: context.width * 0.8,
              hinttext: AppText.cnic,
              prefixIcon: const Icon(
                Icons.card_membership,
                color: AppColors.loginColor,
              ),
            ),
            context.emptySizedHeightBoxLow,
            CustomTextField(
              controller: controllerPassword,
              height: context.height * 0.07,
              width: context.width * 0.8,
              hinttext: AppText.password,
              prefixIcon: const Icon(
                Icons.lock,
                color: AppColors.loginColor,
              ),
              suffixIcon: const Icon(Icons.remove_red_eye),
            ),
            context.emptySizedHeightBoxLow,
            CustomTextField(
              controller: controllerConfirm,
              height: context.height * 0.07,
              width: context.width * 0.8,
              hinttext: AppText.confirm,
              prefixIcon: const Icon(
                Icons.lock,
                color: AppColors.loginColor,
              ),
              suffixIcon: const Icon(Icons.remove_red_eye),
            ),
            context.emptySizedHeightBoxLow3x,
            CustomElevatedButton(
              onPressed: (){                
                final user = User(
                  id: controllerName.text,
                  name: controllerName.text,
                  address: controllerAddress.text,
                  city: controllerCity.text,
                  email: controllerEmail.text,
                  contact_no: int.parse(controllerContact.text),
                  cnic: int.parse(controllerCnic.text),
                  password: controllerPassword.text,
                  isLogin: false,
                  isVerified: false,
                  rating: 5,
                  );
                // final user = User(
                //   id: "my id",
                //   name: "my name",
                //   address: "my address",
                //   city: "my city",
                //   email: "my email",
                //   contact_no: 789456123,
                //   cnic: 6789456123,
                //   password: " my password",
                //   isLogin: false,
                //   isVerified: false,
                //   rating: 5,
                //   );
                if(controllerPassword.text == controllerConfirm.text){
                  createUser(user:user);
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()));
                }
                else{
                  print("password not match");
                }
                
              },
              child: Text(
                AppText.signUp.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
              borderRadius: 20,
              color: AppColors.loginColor,
              height: context.height * 0.07,
              width: context.width * 0.6,
            ),
            // context.emptySizedHeightBoxLow3x,
            bottomText(context),
          ],
        ),
      ),
    );
  }

  SizedBox topImage(BuildContext context) {
    return SizedBox(
      // height: context.height * 0.2,
      child: Image.asset('assets/images/register.png'),
    );
  }

  
  Container topText(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      height: context.height * 0.06,
      width: context.width * 1,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: AppColors.loginColor,
      ),
      alignment: Alignment.center,

      child: Text(
        AppText.signUp.toUpperCase(),
        style: context.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  SizedBox bottomText(BuildContext context) {
    return SizedBox(
      width: context.width * 0.7,
      height: context.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            AppText.already,
          ),
          TextButton(
            child: const Text(
              AppText.login,
              style: TextStyle(color: AppColors.loginColor),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
              );
            },
          )
        ],
      ),
    );
  }
  
  Future createUser({required User user}) async{
    final docUser = await FirebaseFirestore.instance.collection('/users').doc("${AppText.count}");
    AppText.count++;
    
    // if(docUser.exists){
    //   count++;
    // }
    final json = user.toMap();
    await docUser.set(json);
    // await docUser.set(json);

    
  }
  Stream<List<User>> getUsers(){
    final ref = FirebaseFirestore.instance.collection('/users');
    final snapshots = ref.snapshots();
    return snapshots.map((snapshot) => snapshot.docs.map((doc) => User.fromMap(doc.data())).toList());
  } 


}

class User{
  String id;
  final String name;
  final String email;
  final String address;
  final String city;
  final int contact_no;
  final int cnic;
  final int rating;
  final String password;
  final bool isLogin;
  final bool isVerified;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.city,
    required this.contact_no,
    required this.cnic,
    required this.rating,
    required this.password,
    required this.isLogin,
    required this.isVerified,
  });

  Map<String, dynamic> toMap(){
    
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'contact_no': contact_no,
      'cnic': cnic,
      'password': password,
      'isLogin': isLogin,
      'isVerified': isVerified,
      'rating': rating,
    };
  }
  static User fromMap(Map<String, dynamic> map) => User(
    address: map['address'],
    city: map['city'],
    cnic: map['cnic'], 
    contact_no: map['contact_no'], 
    email: map['email'], 
    id: map['id'], 
    isLogin: map['isLogin'], 
    isVerified: map['isVerified'], 
    name: map['name'], 
    password: map['password'], 
    rating: map['rating'],
    );


}


