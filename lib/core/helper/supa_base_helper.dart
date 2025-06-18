import 'dart:io';

import 'package:flutter_task_internship/core/constants/supa_base_constants.dart';
import 'package:flutter_task_internship/features/Home/Data/model/restraunt_model.dart';
import 'package:flutter_task_internship/features/auth/login/Data/model/login_model.dart';
import 'package:flutter_task_internship/features/auth/signup/data/model/sign_up_request.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseHelper{

  SupaBaseHelper._();

static SupaBaseHelper instance=SupaBaseHelper._();

  SupabaseClient get _supabase => Supabase.instance.client;

Future<void>init() async {

await Supabase
    .initialize(url: supabaseUrl, anonKey: supabaseKey);
}

  bool get isLoggedIn => Supabase.instance.client.auth.currentUser != null;

  Future<void> signUp(SignUpRequest signUpRequest) async {
    final response = await _supabase.auth.signUp(
      password: signUpRequest.password,
      email: signUpRequest.email,
    );

    final user = response.user;

    if (user == null) {
      print("Signup failed: No user returned.");
      return;
    }

    final userId = user.id;

    await _supabase.from('users').insert({
      'id': userId,
      'name': signUpRequest.name,
      'image_url': signUpRequest.urlImage,
      'email': signUpRequest.email,
    });

    print("Profile inserted for userId: $userId");
  }

  Future<void>login(LoginModel login)async{

  await _supabase.auth.signInWithPassword(password: login.password,email: login.email);

  }



  Future<String>uploadAvatar(File file)async{

    final fileName = '${DateTime.now().millisecondsSinceEpoch}.png';

    final bytes=await file.readAsBytes();

  await Supabase.instance.client.storage.from('avatars').uploadBinary(fileName, bytes);

    return Supabase.instance.client.storage
        .from('avatars')
        .getPublicUrl(fileName);
}

  Future<Map<String, dynamic>> getProfile() async {

    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;

    print("user:${user?.id.toString()}");


    final response = await supabase
        .from('users')
        .select()
        .eq('id', user!.id)
        .single(); // This returns just one record directly



    return response;

  }

  Future<dynamic>getServices() async {

 final data= await _supabase.from('Services').select();
return data;
  }

  Future<dynamic>getShortCuts() async {

    final data= await _supabase.from('shortcuts').select();

    return data;

  }


  Future<List<Restaurant>>getRest() async {

    final response= await _supabase.from('restraunt').select();

    final List<Restaurant>rest=(response as List<dynamic>).map((e) {
      return Restaurant.fromJson(e);
    },).toList();

    return rest;
  }
  Future<void>_insertUserProfile(SignUpRequest signUpRequest)async{

  await _supabase.from('users').insert(signUpRequest.toJson());

}

}