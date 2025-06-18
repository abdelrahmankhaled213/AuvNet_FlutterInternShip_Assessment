import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/constants/app_color.dart';
import 'package:flutter_task_internship/core/constants/app_router.dart';
import 'package:flutter_task_internship/core/constants/app_style.dart';
import 'package:flutter_task_internship/core/helper/app_regex_helper.dart';
import 'package:flutter_task_internship/core/helper/flutter_toast.dart';
import 'package:flutter_task_internship/core/helper/routing_helper.dart';
import 'package:flutter_task_internship/core/helper/supa_base_helper.dart';
import 'package:flutter_task_internship/core/widgets/custom_button_core.dart';
import 'package:flutter_task_internship/core/widgets/text_form_field.dart';
import 'package:flutter_task_internship/features/Home/presentation/view_model/home_bloc.dart';
import 'package:flutter_task_internship/features/auth/signup/data/model/sign_up_request.dart';
import 'package:flutter_task_internship/features/auth/signup/presentation/view_model/sign_up_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

late final TextEditingController name;
late final TextEditingController email;
late final TextEditingController password;
final GlobalKey<FormState>formKey=GlobalKey();

File? selectedImage;
String urlImage='';
SignUpRequest? signUpRequest;

final ValueNotifier<bool> toggleEyeIconPassword=ValueNotifier<bool>(true);

@override
void initState() {

  super.initState();

  name = TextEditingController();
  password = TextEditingController();
  email = TextEditingController();

}

@override
  void dispose() {

  super.dispose();

    name.dispose();
    password.dispose();
    email.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Form(

      key: formKey,

        child: Column(

          spacing: 7.h,

          children: [

            _uploadImage(),

           _buildNameTextForm(),

            _buildEmailTextForm(),

            _buildPasswordTextForm(),

SizedBox(
  height: 17.h,
),

         _buildButton(),

            SizedBox(
              height: 5.h,
            ),

              TextButton(
                  onPressed: () {
                    context.pushReplacementNamed(AppRouter.login);
              }, child:Text("Already have an account",style: AppStyle.boldDmSans14blue,))

          ],
    )
    );

  }





void _onPressedButton() async {
  final signUpCubit = BlocProvider.of<SignUpBloc>(context);

  if (signUpCubit.state.urlImage == null) {
    FlutterToastHelper.instance.showToast(
      message: "The image is empty",
      color: Colors.red,
    );
    return;
  }

  if (formKey.currentState!.validate()) {

    final user = Supabase.instance.client.auth.currentUser;

    print("userrr aho $user");


     signUpRequest = SignUpRequest(

      password: password.text.trim(),
      name: name.text.trim(),
      email: email.text.trim(),
      urlImage: signUpCubit.state.urlImage!,
    );

    BlocProvider.of<SignUpBloc>(context).add(
      SignUpSubmitted(signUpRequest: signUpRequest!),
    );
  }
}

String? _validateEmail(String? value){


  if(value==null||value.isEmpty){

    return 'please enter your mail';
  }


  return null;

}
String? _validatePassword(String? value){


  if(value==null||value.isEmpty){

    return 'please enter your password';
  }

  if(!AppRegexHelper.isPasswordValid(value)){

    return 'please enter a valid password';

  }

  return null;

}
String? _validateName(String? value){


  if(value==null||value.isEmpty){

    return 'please enter your name';
  }


  return null;

}

Widget _buildNameTextForm(){

  return SizedBox(

      height: 65.h,
      width: 300.w,
      child:  CustomTextFormField(
        validator: _validateName, hint: 'name'
        , textEditingController: name, ),

    );
}

Widget _buildEmailTextForm(){

  return SizedBox(
    height: 65.h,
    width: 300.w,
    child: CustomTextFormField(prefixIcon: Icon(Icons.email_outlined,size: 24.sp
      ,color: Colors.grey[400],)
        ,  validator: _validateEmail, hint: 'mail'
        , textEditingController: email),
  );

}

Widget _buildPasswordTextForm(){

  return SizedBox(

    height: 65.h,
    width: 300.w,
    child: ValueListenableBuilder(
      builder: (context, value, child) =>
          CustomTextFormField(prefixIcon: Icon(Icons.lock,color:Colors.grey[400],size: 24.sp,),obscureText: toggleEyeIconPassword.value,
              suffixIcon: IconButton(onPressed: (){

                toggleEyeIconPassword.value=!toggleEyeIconPassword.value;

              }, icon: Icon(toggleEyeIconPassword.value?Icons.visibility:Icons.visibility_off
                ,size: 24.sp
                ,color: Colors.grey[400],)
              )
              ,  validator: _validatePassword, hint: 'password'
              , textEditingController: password),

      valueListenable:toggleEyeIconPassword ,
    ),
  );


}

Widget _uploadImage() {

  return BlocListener<SignUpBloc,SignUpState>(
    listener: (context, state) {
      if(state.isSignUpLoadedImage){
        FlutterToastHelper.instance.showToast(message: "image uploaded");
      }

      if(state.isSignUpErrorImage){
        FlutterToastHelper.instance.showToast(message: state.error.toString(),color: Colors.red);
      }

    },
    listenWhen: (previous, current) {

      return current.isSignUpErrorImage ||current.isSignUpLoadedImage;
    },
    child: GestureDetector(
      onTap: pickImage,
      child: selectedImage != null
          ? CircleAvatar(
        radius: 40.r,
        backgroundImage: FileImage(selectedImage!),
      )
          : Icon(
            Icons.account_circle_rounded,
            size: 80.sp,
            color: AppColor.purple,
          ),
    ),

  );
}


Future<void> pickImage() async {

  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedFile != null && mounted) {
    setState(() {
      selectedImage = File(pickedFile.path);
    });

    BlocProvider.of<SignUpBloc>(context).add(UploadImageEvent(file: selectedImage));

  }
}


Widget _buildButton(){

  return SizedBox(
    width: 343.w,
    height: 52.h,
    child: BlocConsumer<SignUpBloc, SignUpState>(

      listener: (context, state) async {

        if(state.isSignUpLoaded){

          FlutterToastHelper.instance.showToast(message: "sign up successfully");

          context.pushReplacementNamed(AppRouter.login);

        }

        if(state.isSignUpError){
          FlutterToastHelper.instance.showToast(message: state.error.toString(),color: Colors.red);
        }


      },
      listenWhen: (previous, current) {

        return current.isSignUpLoaded ||current.isSignUpError;

      },
      builder: (context, state) {

        if(state.isSignUpLoading){
          return Center(
            child: CircularProgressIndicator(
              color: AppColor.purple,
            ),
          );
        }
        return CustomButtonCore(text: 'Sign up', onPressed: _onPressedButton
        );
      },

      buildWhen: (previous, current) {
        return current.isSignUpLoading|| current.isSignUpLoaded || current.isSignUpError;
      },
    ),
  );

}

}
