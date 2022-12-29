import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mad_project/widgets/themebutton.dart';

import '../pages/categorybottombar.dart';

class Lessor extends StatefulWidget {
  @override
  State<Lessor> createState() => _LessorState();
}

class _LessorState extends State<Lessor> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool _validate = false;
  bool _validate1 = false;
  @override
  Widget build(Object context) {
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
        child: Stack(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Add login details here",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.redAccent)),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
                  margin: const EdgeInsets.all(10),
                  child: Center(
                    child: Column(
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            // labelText: 'Your Name',
                            hintText: 'Enter Your Name',
                            errorText:
                                _validate ? 'Value can\'t be empty' : null,
                            prefixIcon: const Icon(Icons.person_pin_sharp),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          maxLines: 1,
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            //labelText: 'Email',
                            hintText: 'Enter Your email',
                            errorText:
                                _validate1 ? 'Enter a valid email' : null,
                            prefixIcon: const Icon(Icons.mail_outlined),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ThemeButton(
                            label: 'Login',
                            onClick: () {
                              setState(() {
                                nameController.text.isEmpty
                                    ? _validate = true
                                    : _validate = false;

                                emailController.text.isEmpty ||
                                        !emailController.text.contains("@")
                                    ? _validate1 = true
                                    : _validate1 = false;
                                if (!_validate && !_validate1) {}
                              });
                            },
                            icon: const Icon(Icons.arrow_forward))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CategoryBottomBar(),
          )
        ]),
      ),
    );
  }
}
