import 'dart:io';
import 'dart:math';

import 'package:controlpanel/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show basename;

class ImgPicker extends StatefulWidget {
  final void Function(File? imgData, String? imgName) getImgData;
  final bool isCountry;
  final IconData? icon;
  final Color? iconColor;
  bool? isUploadImg;

  ImgPicker({
    super.key,
    this.icon,
    this.iconColor,
    required this.getImgData,
    required this.isCountry,
    this.isUploadImg,
  });

  @override
  State<ImgPicker> createState() => _ImgUserState();
}

class _ImgUserState extends State<ImgPicker> {
  String? imgName;
  String imgUser = "assets/images/user1.png";
  String imgCountry = "assets/images/squar.png";
  File? imgData;

  uploadImage2Screen({
    required ImageSource source,
    required BuildContext context,
  }) async {
    Navigator.pop(context);
    final pickedImg = await ImagePicker().pickImage(source: source);

    try {
      if (pickedImg != null) {
        imgName = basename(pickedImg.path);
        int random = Random().nextInt(9999999);
        imgName = "$random$imgName";
        setState(() {
          widget.isUploadImg = true;
          imgData = File(pickedImg.path);
          widget.getImgData(imgData, imgName);
        });
        // getImageBinary();
      } else {
        print('NO img selected');
      }
    } catch (e) {
      print('Error => $e');
    }
  }

  // getImageBinary() async{
  //   final byte = await file!.readAsBytes();
  //   imgData = base64Encode(byte);
  //   widget.getImgData(imgData, imgName);
  // }

  showmodel({
    required BuildContext context,
  }) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(10),
          height: 230.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                onTap: () async {
                  await uploadImage2Screen(
                      source: ImageSource.camera, context: context);
                },
                leading: const Icon(Icons.photo_camera),
                title: const Text('التقط صورة من الكاميرا'),
              ),
              ListTile(
                onTap: () async {
                  await uploadImage2Screen(
                      source: ImageSource.gallery, context: context);
                },
                leading: const Icon(Icons.photo),
                title: const Text('إختر صورة من المعرض'),
              ),
              const SizedBox(height: kTextTabBarHeight),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: widget.isCountry
          ? Stack(
              children: [
                widget.isUploadImg!
                    ? customCountryImg(true, imgFile: imgData)
                    : customCountryImg(false, urlImg: imgCountry),
                Positioned(
                  top: 5.h,
                  right: 5.w,
                  child: IconButton(
                    onPressed: () async {
                      await showmodel(context: context);
                    },
                    icon: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      child: Icon(
                        widget.isUploadImg!
                            ? Icons.edit
                            : Icons.add_circle_outlined,
                        size: 18,
                        color: ColorsManager.darkBlue,
                      ),
                    ),
                  ),
                )
              ],
            )
          : Stack(
              children: [
                widget.isUploadImg!
                    ? customUserImg(true, imgFile: imgData)
                    : customUserImg(false, urlImg: imgUser),
                Positioned(
                  top: 5.h,
                  right: 5.w,
                  child: InkWell(
                    onTap: () async {
                      await showmodel(context: context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 20.h,
                      width: 20.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        widget.isUploadImg!
                            ? Icons.edit
                            : Icons.add_circle_outlined,
                        size: 15,
                        color: widget.iconColor ?? ColorsManager.lightGray,
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}

Widget customUserImg(bool isFull, {String? urlImg, File? imgFile}) {
  return Container(
    height: 110.h,
    width: 110.w,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
          image: isFull ? FileImage(imgFile!) : AssetImage(urlImg!),
          fit: BoxFit.contain),
    ),
  );
}

Widget customCountryImg(bool isFull, {String? urlImg, File? imgFile}) {
  return Container(
    width: 242.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: DecorationImage(
          image: isFull ? FileImage(imgFile!) : AssetImage(urlImg!),
          fit: BoxFit.contain),
    ),
    alignment: Alignment.topRight,
  );
}
