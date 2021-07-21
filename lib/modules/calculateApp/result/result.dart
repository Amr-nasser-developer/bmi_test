import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_app/modules/calculateApp/history/history.dart';
import 'package:social_app/shared/components.dart';


class ResultCalculate extends StatelessWidget {
  @required final int? age;
  @required final double? weight;
  @required final bool male;
  @required var result ;
  @required var time ;
  @required String? status;
  ResultCalculate({this.age , required this.male, this.result , this.time , this.weight, this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: (){
                navigateTo(context, History());
              },
              child: Text('History')
          )
        ],
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gender : ${(male) ? 'Male' : 'Female'}',style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 32,color: Colors.white),),
            Text('Age : $age',style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 32,color: Colors.white),),
            Text('Weight : $weight',style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 32,color: Colors.white),),
            Text('Result : $result',style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 32,color: Colors.white),),
            Row(
              children: [
                Text('Status : ',style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 30,color: Colors.white)),
                Text('$status',style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 30,color: Colors.white)),
              ],
            ),
            Row(
              children: [
                Text('Date : ',style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 32,color: Colors.white)),
                Text('$time',style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 32,color: Colors.white)),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
