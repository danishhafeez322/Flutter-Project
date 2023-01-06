import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/core/constant/app_text.dart';
import 'package:mad_project/product/widget/custom_elevated_button.dart';
import 'package:mad_project/product/widget/custom_textfield.dart';
import 'package:mad_project/widgets/AppBar.dart';

import '../pages/categorybottombar.dart';


class EditDetailView extends StatefulWidget {  
  final title, category, subCategory, description, price, guaranteePrice, days, quantity;
  const EditDetailView(
    {Key? key, this.title, this.category, this.subCategory, this.description, this.price, this.guaranteePrice, this.days, this.quantity}) : super(key: key);

  @override
  State<EditDetailView> createState() => _EditDetailViewState();
}

class _EditDetailViewState extends State<EditDetailView> {
  final controllerTitle = TextEditingController();
  final controllerCategory = TextEditingController();
  final controllerSubCategory = TextEditingController();
  final controllerDescription = TextEditingController();
  final controllerPrice = TextEditingController();
  final controllerGuaranteePrice = TextEditingController();
  final controllerDays = TextEditingController();
  final controllerQuantity = TextEditingController();
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  openImages() async {
    try {
        var pickedfiles = await imgpicker.pickMultiImage();
        //you can use ImageCourse.camera for Camera capture
        if(pickedfiles != null){
            imagefiles = pickedfiles;
            setState(() {
            });
        }else{
            print("No image is selected.");
        }
    }catch (e) {
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

  Stack _body(BuildContext context) {
    String dropdownValue = "";
    String dropdownSubValue = "";
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
                            backgroundColor: MaterialStateProperty.all<Color>(AppColors.uploadColor),
                          ),
                        ),
                        Divider(),
                        Text("Picked Files:"),
                        Divider(),

                        imagefiles != null?Wrap(
                          children: imagefiles!.map((imageone){
                              return Container(
                                child:Card( 
                                    child: Container(
                                      height: 100, width:100,
                                      child: Image.file(File(imageone.path)),
                                    ),
                                )
                              );
                          }).toList(),
                        ):Container()
                    ],
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                CustomTextField(
                  controller: controllerTitle,
                  height: context.height * 0.07,
                  width: context.width * 0.8,
                  hinttext: AppText.title,
                  text:widget.title,
                  prefixIcon: const Icon(
                    Icons.title,
                    color: AppColors.uploadColor,
                  ),                        
                ),
                context.emptySizedHeightBoxLow3x,
                Padding(
                  padding: const EdgeInsets.only(left:50,right:50),
                  child: Row(
                    children: [            
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
                          controllerCategory.text = dropdownValue;
                          dropdownValue == AppText.list[0] ? dropdownSubValue = AppText.fashion_sub_list[0] : dropdownSubValue = AppText.electronics_sub_list[0];

                        },
                        items: AppText.list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      Spacer(),
                      // MyDropdownButtonSubCategory(subCategory: widget.subCategory,),
                      DropdownButton<String>(
                        value: widget.subCategory,
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
                            dropdownSubValue= value!;
                          });
                          controllerSubCategory.text = dropdownSubValue;
                        },
                        items: AppText.fashion_sub_list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
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
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CategoryBottomBar(),
        )
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
        AppText.edit.toUpperCase(),
        style: context.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}








// class MyDropdownButton extends StatefulWidget {
//   final category;
//   const MyDropdownButton({super.key,this.category});

//   @override
//   State<MyDropdownButton> createState() => _DropdownButtonState();
// }

// class _DropdownButtonState extends State<MyDropdownButton> {
//   String dropdownValue = "";

//   @override
//   Widget build(BuildContext context) {
//     dropdownValue = widget.category;
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.black),
//       underline: Container(
//         height: 2,
//         color: AppColors.uploadColor,
//       ),
//       onChanged: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: AppText.list.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }
// class MyDropdownButtonSubCategory extends StatefulWidget {
//   final subCategory;
//   const MyDropdownButtonSubCategory({super.key,this.subCategory});

//   @override
//   State<MyDropdownButtonSubCategory> createState() => _DropdownButtonSubState();
// }

// class _DropdownButtonSubState extends State<MyDropdownButtonSubCategory> {
//   String dropdownValue = "";

//   @override
//   Widget build(BuildContext context) {
//     dropdownValue = widget.subCategory;
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.black),
//       underline: Container(
//         height: 2,
//         color: AppColors.uploadColor,
//       ),
//       onChanged: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue= value!;
//         });
//       },
//       items: AppText.fashion_sub_list.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }

