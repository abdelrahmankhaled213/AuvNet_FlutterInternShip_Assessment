import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/constants/app_color.dart';
import 'package:flutter_task_internship/core/constants/app_router.dart';
import 'package:flutter_task_internship/core/constants/app_style.dart';
import 'package:flutter_task_internship/core/helper/app_regex_helper.dart';
import 'package:flutter_task_internship/core/helper/flutter_toast.dart';
import 'package:flutter_task_internship/core/helper/routing_helper.dart';
import 'package:flutter_task_internship/core/widgets/custom_button_core.dart';
import 'package:flutter_task_internship/core/widgets/text_form_field.dart';
import 'package:flutter_task_internship/features/auth/login/Data/model/login_model.dart';
import 'package:flutter_task_internship/features/auth/login/presentation/view_model/login_bloc.dart';

class LoginForm extends StatefulWidget {

  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  late final TextEditingController email;
  late final TextEditingController password;
  final GlobalKey<FormState>formKey=GlobalKey();

  final ValueNotifier<bool> toggleEyeIconPassword=ValueNotifier<bool>(true);

  @override
  void initState() {

    super.initState();

    password=TextEditingController();
    email=TextEditingController();

  }

  @override
  void dispose() {

    super.dispose();

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

         _buildEmailField(),

         _buildPasswordField(),

            SizedBox(
              height: 17.h,
            ),

            _buildButton(),

            SizedBox(
              height: 7.h,
            ),

            TextButton(

                onPressed: ()=>context.pushReplacementNamed(AppRouter.signUp)

                , child:Text("Don'\t have an account",style: AppStyle.boldDmSans14blue,))

          ],
        )
    );

  }


  Widget _buildEmailField(){
    return SizedBox(
      height: 65.h,
      width: 300.w,
      child: CustomTextFormField(prefixIcon: Icon(Icons.email_outlined,size: 24.sp
        ,color: Colors.grey[400],)
          ,  validator: _validateEmail, hint: 'mail'
          , textEditingController: email),
    );
  }
  Widget _buildPasswordField(){
    return  SizedBox(

      height: 65.h,
      width: 300.w,
      child: ValueListenableBuilder(
        builder: (context, value, child) =>
            CustomTextFormField(obscureText: toggleEyeIconPassword.value,prefixIcon: Icon(Icons.lock,size: 24.sp
              ,color: Colors.grey[400],)
                ,suffixIcon: IconButton(onPressed: (){

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

Widget _buildButton(){
    return SizedBox(
      width: 343.w,
      height: 52.h,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {

          if(state.isLoaded){

            FlutterToastHelper.instance.showToast(message: "login successfully");
context.pushReplacementNamed(AppRouter.homeLayout);

          }
          if(state.isError){

            FlutterToastHelper.instance.showToast(message: state.error.toString(),color: Colors.red);

          }
        },
        listenWhen: (previous, current) {

          return current.isLoaded ||current.isError;

        },

        builder: (context, state) {
          if(state.isLoading){
            return Center(
              child: CircularProgressIndicator(
                color: AppColor.purple,
              ),
            );
          }
          return CustomButtonCore(text: 'Login', onPressed: _onPressedButton
          );
        },

        buildWhen: (previous, current) {
          return current.isLoading|| current.isLoaded || current.isError;
        },
      ),
    );

}
  void _onPressedButton(){
    final login=
    LoginModel( password: password.text, email: email.text);

    final loginBloc=
    BlocProvider.of<LoginBloc>(context);

    if(formKey.currentState!.validate()){

loginBloc.add(LoginButtonPressed(loginModel: login));

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


}


