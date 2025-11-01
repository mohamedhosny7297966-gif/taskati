import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/widget/custom_button.dart';
import 'package:taskati/feature/auth/models/user_model.dart';
import 'package:taskati/feature/auth/presentation/cubit/auth_cubit.dart';

import '../../../core/routes/routes.dart';
import '../../../gen/assets.gen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;
  XFile? image;
  var nameController = TextEditingController();

  openCamera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {

    });
  }

  openGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {

    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: photo != null,
              child: CircleAvatar(
                radius: 80,
                backgroundImage: Image
                    .file(File(photo?.path ?? ""))
                    .image,
              ),
              replacement: Image.asset(
                Assets.images.user.path,
                width: 200,
                height: 200,
              ),
            ),

            SizedBox(height: 20,),
            CustomButton(
              onTap: () {
                openCamera();
              },
              title: "Upload From Camera",
            ),
            SizedBox(height: 20,),
            CustomButton(
              onTap: () {
                openGallery();
              },
              title: "Upload From Gallery",
            ),
            Divider(
              height: 50,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if(state is SaveUserSuccess){
                  Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen , (e)=> false);

                }
              },
              child: CustomButton(
                  onTap: () {
                    context.read<AuthCubit>().saveUserData(UserModel(name: nameController.text, image: photo?.path??""));

                  }
                  , title: "Save"),
            ),
          ],
        ),
      ),
    );
  }
}
