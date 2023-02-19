import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/core/constant/app_text.dart';
import 'package:mad_project/product/widget/custom_elevated_button.dart';
import 'package:mad_project/product/widget/custom_textfield.dart';
import 'package:mad_project/widgets/AppBar.dart';

import '../pages/WelcomePage.dart';
import '../pages/categorybottombar.dart';
import '../pages/upload.dart';


class EditDetailView extends StatefulWidget {  
  final title, category, description, price, guaranteePrice, days, quantity, id;
  const EditDetailView(
    {Key? key, this.title, this.category, this.description, this.price, this.guaranteePrice, this.days, this.quantity, this.id}) : super(key: key);

  @override
  State<EditDetailView> createState() => _EditDetailViewState();
}

class _EditDetailViewState extends State<EditDetailView> {
  final ImagePicker imgpicker = ImagePicker();

  List<XFile>? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    
  final controllerTitle = TextEditingController();
  final controllerMainCategory = TextEditingController();
  final controllerDescription = TextEditingController();
  final controllerPrice = TextEditingController();
  final controllerGuaranteePrice = TextEditingController();
  final controllerDays = TextEditingController();
  final controllerQuantity = TextEditingController();
  
  controllerTitle.text = widget.title;
  controllerMainCategory.text = widget.category;
  controllerDescription.text = widget.description;
  controllerPrice.text = widget.price;
  controllerGuaranteePrice.text = widget.guaranteePrice;
  controllerDays.text = widget.days;
  controllerQuantity.text = widget.quantity;
  

    String dropdownValue = "";
    return StatefulBuilder(builder: (context,setState)=>Stack(
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

                      imagefiles != null
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
                          : Container()
                    ],
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                CustomTextField(
                  controller: controllerTitle,
                  height: context.height * 0.07,
                  width: context.width * 0.8,
                  hinttext: AppText.title,
                  text: widget.title,
                  prefixIcon: const Icon(
                    Icons.title,
                    color: AppColors.uploadColor,
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                        
                      DropdownButton<String>(
                        value: widget.category,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: AppColors.uploadColor,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                          controllerMainCategory.text = dropdownValue;
                        },
                        items: AppText.list
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                context.emptySizedHeightBoxLow,
                CustomTextField(
                  controller: controllerDescription,
                  height: context.height * 0.1,
                  width: context.width * 0.8,
                  hinttext: AppText.description,
                  text: widget.description,
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
                  text: widget.price,
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
                  text: widget.guaranteePrice,
                  prefixIcon: const Icon(
                    Icons.price_check,
                    color: AppColors.uploadColor,
                  ),
                ),
                context.emptySizedHeightBoxLow,
                CustomTextField(
                  controller: controllerDays,
                  height: context.height * 0.07,
                  width: context.width * 0.8,
                  hinttext: AppText.days,
                  text: widget.days,
                  prefixIcon: const Icon(
                    Icons.lock_clock,
                    color: AppColors.uploadColor,
                  ),
                ),
                context.emptySizedHeightBoxLow,
                CustomTextField(
                  controller: controllerQuantity,
                  height: context.height * 0.07,
                  width: context.width * 0.8,
                  hinttext: AppText.quantity,
                  text: widget.quantity,
                  prefixIcon: const Icon(
                    Icons.production_quantity_limits,
                    color: AppColors.uploadColor,
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                CustomElevatedButton(
                  onPressed: (){
                    final item = MyItem(
                        id: widget.id,
                        title: controllerTitle.text.trim(),
                        category_id: controllerMainCategory.text.trim(),
                        description: controllerDescription.text.trim(),
                        price: int.parse(controllerPrice.text.trim()),
                        guarantee_price:
                            int.parse(controllerGuaranteePrice.text.trim()),
                        quantity: int.parse(controllerQuantity.text.trim()),
                        user_id: "${FirebaseAuth.instance.currentUser?.uid}",
                        images: [''],
                        status: '0',
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
                            msg: "Updateing Items...",
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
                      }

                  },
                  child: Text(
                    "Save".toUpperCase(),
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
      ],
    ));
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
        AppText.edit.toUpperCase(),
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
    // int count = await FirebaseFirestore.instance
    //     .collection('/Items')
    //     .get()
    //     .then((value) => value.size);
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
          .doc(item.id.toString());
      // item.id = (count + 1).toString();

      final json = item.toMap();
      await docitem.set(json);
      AppText.count++;
      Fluttertoast.showToast(
          msg: "Item Updated Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pop(context);
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
}