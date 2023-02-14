// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/core/constant/app_text.dart';
import 'package:mad_project/main.dart';
import 'package:mad_project/product/widget/custom_elevated_button.dart';
import 'package:mad_project/product/widget/custom_textfield.dart';
import 'package:mad_project/widgets/AppBar.dart';

import 'dart:io';

import '../core/constant/app_color.dart';
import '../pages/categorybottombar.dart';
import 'categorybottombar.dart';

class UploadView extends StatefulWidget {
  const UploadView({Key? key}) : super(key: key);
  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  final controllerTitle = TextEditingController();
  final controllerMainCategory = TextEditingController();
  final controllerSubCategory = TextEditingController();
  final controllerDescription = TextEditingController();
  final controllerPrice = TextEditingController();
  final controllerGuaranteePrice = TextEditingController();
  final controllerQuantity = TextEditingController();
  int documents = 0;

  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      // ignore: unnecessary_null_comparison
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  Future<void> getCount() async {
    int count = await FirebaseFirestore.instance
        .collection('/Items')
        .get()
        .then((value) => value.size);
    setState(() {
      documents = count;
      print(documents);
      // AppText.count = documents + 1;
    });
  }

  @override
  void initState() {
    getCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: CategoryBottomBar(),
      body: _body(context),
    );
  }

  Stack _body(BuildContext context) {
    String dropdownValue = AppText.list.first;
    String dropdownSubValue = AppText.fashion_sub_list.first;

    return Stack(
      children: [
        SizedBox(
          height: context.height * 1,
          width: context.width * 1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                topText(context),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      //open button ----------------
                      ElevatedButton.icon(
                        icon: Icon(
                          Icons.upload,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        label: Text('Choose Images'),
                        onPressed: () {
                          openImages();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.uploadColor),
                        ),
                      ),
                      Divider(),
                      Text("Picked Files:"),
                      Divider(),

                      (imagefiles != null)
                          ? Wrap(
                              children: imagefiles!.map((imageone) {
                                return Container(
                                    child: Card(
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.file(File(imageone.path)),
                                  ),
                                ));
                              }).toList(),
                            )
                          : Container(),
                    ],
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                CustomTextField(
                  controller: controllerTitle,
                  height: context.height * 0.07,
                  width: context.width * 0.8,
                  hinttext: AppText.title,
                  text: controllerTitle.text,
                  prefixIcon: const Icon(
                    Icons.title,
                    color: AppColors.uploadColor,
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                // Padding(
                //   padding: const EdgeInsets.only(left: 50, right: 50),
                //   child: Row(
                //     children: [
                      // MyDropdownButton(controller: controllerMainCategory ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 20,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 4,
                          color: AppColors.uploadColor,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                          controllerMainCategory.text = dropdownValue;
                          // dropdownValue == AppText.list[0] ? dropdownSubValue = AppText.fashion_sub_list[0] : dropdownSubValue = AppText.electronics_sub_list[0];
                        },
                        items: AppText.list
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      // Spacer(),
                      // // MyDropdownButtonSubCategory(subCategory: widget.subCategory,),
                      // DropdownButton<String>(
                      //   value: dropdownSubValue,
                      //   icon: const Icon(Icons.arrow_downward),
                      //   elevation: 16,
                      //   style: const TextStyle(color: Colors.black),
                      //   underline: Container(
                      //     height: 2,
                      //     color: AppColors.uploadColor,
                      //   ),
                      //   onChanged: (String? value) {
                      //     // This is called when the user selects an item.
                      //     setState(() {
                      //       dropdownSubValue = value!;
                      //     });
                      //     controllerSubCategory.text = dropdownSubValue;
                      //   },
                      //   items: AppText.fashion_sub_list
                      //       .map<DropdownMenuItem<String>>((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),
                      // Spacer(),
                      // MyDropdownButtonSubCategory(controller: controllerSubCategory),
                //     ],
                //   ),
                // ),
                context.emptySizedHeightBoxLow,
                CustomTextField(
                  controller: controllerDescription,
                  height: context.height * 0.1,
                  width: context.width * 0.8,
                  hinttext: AppText.description,
                  text: controllerDescription.text,
                  prefixIcon: const Icon(
                    Icons.description,
                    color: AppColors.uploadColor,
                  ),
                ),
                context.emptySizedHeightBoxLow,
                CustomTextField(
                  controller: controllerPrice,
                  height: context.height * 0.07,
                  width: context.width * 0.8,
                  hinttext: AppText.price,
                  text: controllerPrice.text,
                  prefixIcon: const Icon(
                    Icons.price_change,
                    color: AppColors.uploadColor,
                  ),
                ),
                context.emptySizedHeightBoxLow,
                CustomTextField(
                  controller: controllerGuaranteePrice,
                  height: context.height * 0.07,
                  width: context.width * 0.8,
                  hinttext: AppText.guaranteeprice,
                  text: controllerGuaranteePrice.text,
                  prefixIcon: const Icon(
                    Icons.price_check,
                    color: AppColors.uploadColor,
                  ),
                ),
                context.emptySizedHeightBoxLow,
                CustomTextField(
                  controller: controllerQuantity,
                  height: context.height * 0.07,
                  width: context.width * 0.8,
                  hinttext: AppText.quantity,
                  text: controllerQuantity.text,
                  prefixIcon: const Icon(
                    Icons.production_quantity_limits,
                    color: AppColors.uploadColor,
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                CustomElevatedButton(
                  onPressed: () {
                    final item = MyItem(
                      id: (documents + 1).toString(),
                      title: controllerTitle.text.trim(),
                      category_id: controllerMainCategory.text.trim(),
                      description: controllerDescription.text.trim(),
                      price: int.parse(controllerPrice.text.trim()),
                      guarantee_price:
                          int.parse(controllerGuaranteePrice.text.trim()),
                      quantity: int.parse(controllerQuantity.text.trim()),
                      user_id: "${FirebaseAuth.instance.currentUser?.uid}",
                      images: [''],
                      status: 0,
                      date: DateTime.now().toString(),
                    );
                    if (item.title != "" &&
                        item.category_id != "" &&
                        item.description != "" &&
                        item.price != 0 &&
                        item.guarantee_price != 0 &&
                        item.quantity != 0 &&
                        item.images != null) {
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                          msg: "Adding Items...",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.yellow,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      UploadItemToDatabase(
                          item: item, context: context, imagefiles: imagefiles);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Fill the form correctly",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      // print("password not match");
                    }
                  },
                  child: Text(
                    AppText.upload.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  borderRadius: 20,
                  color: AppColors.uploadColor,
                  height: context.height * 0.07,
                  width: context.width * 0.6,
                ),
                context.emptySizedHeightBoxLow,
                context.emptySizedHeightBoxLow3x,
                context.emptySizedHeightBoxLow3x,
                context.emptySizedHeightBoxLow3x,
              ],
            ),
          ),
        ),
      // ),
      // Positioned(
      //     bottom: 0,
      //     left: 0,
      //     right: 0,
      //     child: CategoryBottomBar(),
      //   )
    ],
  );
}

  Container topText(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      height: context.height * 0.06,
      width: context.width * 1,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: AppColors.uploadColor,
      ),
      alignment: Alignment.center,
      child: Text(
        AppText.upload.toUpperCase(),
        style: context.textTheme.headline5!
            .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

List<String> imagesUrl = [];
Future<String> uploadImage(File file) async {
  final fileName = "${DateTime.now()}.jpeg";
  final destination = 'images/$fileName';
  final storageReference = FirebaseStorage.instance.ref().child(destination);
  final uploadTask = storageReference.putFile(file);
  final snapshot = await uploadTask.whenComplete(() => null);
  final urlDownload = await snapshot.ref.getDownloadURL();
  return urlDownload;
}

Future getImagesUrl(List<XFile>? images) async {
  imagesUrl.clear();
  for (int i = 0; i < images!.length; i++) {
    final url = await uploadImage(File(images[i].path));
    imagesUrl.add(url);
  }
}

Future UploadItemToDatabase(
    {required MyItem item,
    required BuildContext context,
    List<XFile>? imagefiles}) async {
  // showDialog(
  //   context: context,
  //   barrierDismissible: false,
  //   builder: (context) => const Center(child: CircularProgressIndicator())
  // );
  try {
    int count = await FirebaseFirestore.instance
        .collection('/Items')
        .get()
        .then((value) => value.size);
    if (item.images == null) {
      Fluttertoast.showToast(
          msg: "Please Select Images",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    } else {
      await getImagesUrl(imagefiles);

      item.images = imagesUrl;
      final docitem = await FirebaseFirestore.instance
          .collection('/Items')
          .doc((count + 1).toString());
      // item.id = (count + 1).toString();

      final json = item.toMap();
      await docitem.set(json);
      AppText.count++;
      Fluttertoast.showToast(
          msg: "Item Added Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomePage()));
    }
  } catch (e) {
    Fluttertoast.showToast(
        msg: "" + e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    print(e);
  }
  // navigatorKey.currentState!.popUntil((!'login')=>route.isFirst());
}

class MyItem {
  String id;
  final String title;
  final String category_id;
  final String? user_id;
  final String description;
  final int price;
  final int guarantee_price;
  final int quantity;
  var images;
  final int status;
  var date;

  MyItem(
      {required this.id,
      required this.title,
      required this.category_id,
      required this.user_id,
      required this.description,
      required this.price,
      required this.guarantee_price,
      required this.quantity,
      required this.images,
      required this.status,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category_id': category_id,
      'user_id': user_id,
      'description': description,
      'price': price,
      'guarantee_price': guarantee_price,
      'quantity': quantity,
      'images': images,
      'status': status,
      'date': date,
    };
  }

  static MyItem fromMap(Map<String, dynamic> map) => MyItem(
        id: map['id'],
        title: map['title'],
        category_id: map['category_id'],
        user_id: map['user_id'],
        description: map['description'],
        price: map['price'],
        guarantee_price: map['guarantee_price'],
        quantity: map['quantity'],
        images: map['images'],
        status: map['status'],
        date: map['date'],
      );
}
