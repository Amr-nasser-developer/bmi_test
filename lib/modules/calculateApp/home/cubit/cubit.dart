import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/calculateApp/home/cubit/states.dart';

class CalculateCubit extends Cubit<CalculateStates>{
  CalculateCubit() : super(CalculateInitial());

  static CalculateCubit get(context) => BlocProvider.of(context);


  userBody({height , status , time ,weight,uId}){
    emit(CalculateLoading());

    FirebaseFirestore.instance.collection('inBody').add({
          "height" : height,
          "status" : status,
          "time" : time,
        "weight" : weight,
        }).then((value){
      emit(CalculateSuccess());
    }).catchError((e){
      print(e.toString());
      emit(CalculateError(e.toString()));
    });
  }

}