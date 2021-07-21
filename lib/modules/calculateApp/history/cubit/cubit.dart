import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/calculateApp/history/cubit/state.dart';

class HistoryCubit extends Cubit<HistoryStates> {
  HistoryCubit() : super(HistoryInitial());

  static HistoryCubit get(context) => BlocProvider.of(context);

  List<dynamic> model = [];
  getInbodyData({uId}) async {
    emit(HistoryLoading());
    FirebaseFirestore.instance
        .collection('inBody')
        .orderBy('time')
        .get()
        .then((QuerySnapshot querySnapshot)  {
      querySnapshot.docs.forEach((doc) {
        model = querySnapshot.docs;
        emit(HistorySuccess());
      });
    }).catchError((e) {
      emit(HistoryError(e.toString()));
      print(e.toString());
    });
  }
}
