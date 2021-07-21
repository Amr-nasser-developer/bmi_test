import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/create_user.dart';
import 'package:social_app/modules/auth/cubit_register/state.dart';


class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  var message;
  register({name , email , password , phone}){
    emit(RegisterLoading());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((value){
      print(value.user!.email);
      print(value.user!.uid);
      createUser(
        uId: value.user!.uid,
        phone: phone,
        password: password,
        name: name,
        email: email
      );
    }).catchError((e){
      emit(RegisterError(e.toString()));
    });
  }
  createUser({name , email , password , phone , uId}){
    emit(CreateUserLoading());
    CreateUser model = CreateUser(
      email: email,
      name: name,
      password: password,
      phone: phone,
      uId: uId,
    );
    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value){
      emit(CreateUserSuccess());
    }).catchError((e){
      print(e.toString());
      emit(CreateUserError(e.toString()));
    });
  }


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(ShopRegisterChangePasswordVisibilityState());
  }
}