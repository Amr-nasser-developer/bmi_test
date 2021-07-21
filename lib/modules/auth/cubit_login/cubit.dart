import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/auth/cubit_login/state.dart';


class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  login({email , password}){
    emit(LoginLoading());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
   print(value.user!.email);
   print(value.user!.uid);
   emit(LoginSuccess(value.user!.uid));
 }).catchError((e){
   emit(LoginError(e.toString()));
 });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(ShopChangePasswordVisibilityState());
  }
}