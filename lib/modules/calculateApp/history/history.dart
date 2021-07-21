import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/calculateApp/history/cubit/cubit.dart';
import 'package:social_app/modules/calculateApp/history/cubit/state.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context)=> HistoryCubit()..getInbodyData(),
      child: BlocConsumer<HistoryCubit, HistoryStates>(
           listener: (context , state){},
        builder: (context, state){
             return Scaffold(
               backgroundColor: Colors.black,
               appBar: AppBar(
                 title: Text('History'),
                 backgroundColor: Colors.black,
               ),
               body: Center(
                 child: SingleChildScrollView(
                   scrollDirection: Axis.vertical,
                   child: Container(
                      padding: EdgeInsets.all(10.0),
                     height: height * 0.50,
                     width: width * 0.90,
                     color: Colors.grey,
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Row(
                           children: [
                             Text('Date'),
                             Spacer(),
                             Text('Weight')
                           ],
                         ),
                         Divider(height: 15,),
                         Container(
                           height: height * 0.43,
                           width: width * 0.90,
                           child: ListView.builder(
                             shrinkWrap: true,
                               itemBuilder: (context, index)=> viewHistory(context, HistoryCubit.get(context).model[index]),
                             itemCount: HistoryCubit.get(context).model.length,
                           ),
                         )
                       ],
                     ),
                   ),
                 ),
               ),
             );
        },
      )
    );
  }
  Widget viewHistory(context, model )=>
    Row(
      children: [
        Text('${model['time']}'),
        Spacer(),
        Text('${model['weight']}')
      ],
    );

}
