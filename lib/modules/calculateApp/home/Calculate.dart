import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/auth/login_screen.dart';
import 'package:social_app/modules/calculateApp/history/cubit/cubit.dart';
import 'package:social_app/modules/calculateApp/home/cubit/cubit.dart';
import 'package:social_app/modules/calculateApp/home/cubit/states.dart';
import '../result/result.dart';
import 'package:social_app/shared/components.dart';
import 'package:social_app/shared/network/local/cash.dart';


class Calculate extends StatefulWidget {
  @override
  _CalculateState createState() => _CalculateState();
}
class _CalculateState extends State<Calculate> {
  String uId = CashHelper.getData(key: 'uId');
  bool male = true;
  double height = 120;
  double weight = 50;
  int age = 1;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> CalculateCubit(),
      child: BlocConsumer<CalculateCubit, CalculateStates>(
          listener: (context, state){
            if(state is CalculateSuccess){
              print('CalculateSuccess');
            }
            if(state is CalculateLoading){
              print('CalculateLoading');
            }
            if(state is CalculateError){
              print(state.error.toString());
            }
          },
        builder: (context, state){
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: (){
                        CashHelper.removeData(key: 'uId').then((value){
                          navigateAndFinish(context, LoginScreen());
                        }).catchError((e){
                          print(e.toString());
                        });
                      },
                      icon: Icon(Icons.logout_sharp, color: Colors.white,)
                  ),
                ],
                title: Text('BMI CALCULATE'),
                backgroundColor: Colors.black,
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  male = true;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: male ? Colors.blue : Colors.grey
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage('assets/images/male.png'),height: 90.0,width: 70.0,color: Colors.white,),
                                    Text(
                                      'MALE',
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  male = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: !male ? Colors.blue : Colors.grey,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage('assets/images/female.png'),height: 90.0,width: 60.0,color: Colors.white,),
                                    Text(
                                      'FEMALE',
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'HEIGHT',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Row(
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${height.round()}',
                                  style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'CM',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Slider(value: height, min: 80,max: 220,activeColor: Colors.pink,inactiveColor: Colors.white,
                                onChanged: (value){
                                  setState(() {
                                    height = value;
                                  });
                                },),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'WEIGHT',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    '${weight}',
                                    style: TextStyle(
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            weight++;
                                          });
                                        },
                                        child: CircleAvatar(
                                          child: Text('+',style: TextStyle(fontSize: 24.0),),
                                        ),
                                      ),
                                      SizedBox(width: 15.0,),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            weight--;
                                          });
                                        },
                                        child: CircleAvatar(
                                          child: Text('-',style: TextStyle(fontSize: 24.0)),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15.0,),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'AGE',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    '${age}',
                                    style: TextStyle(
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            age++;
                                          });
                                        },
                                        child: CircleAvatar(
                                          child: Text('+',style: TextStyle(fontSize: 24.0)),
                                        ),
                                      ),
                                      SizedBox(width: 15.0,),
                                      GestureDetector(
                                        onLongPress: (){
                                          setState(() {
                                            age--;
                                          });
                                        },
                                        onTap: (){
                                          setState(() {
                                            age--;
                                          });
                                        },
                                        child: CircleAvatar(
                                          child: Text('-',style: TextStyle(fontSize: 24.0)),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        height: 55.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey,
                        ),
                        child:  MaterialButton(
                          onPressed: (){

                            String? status;
                            var dateTime = DateTime.now();
                            var formate = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
                            var result = weight/pow(height/100,2);

                            if(result >= 18.5 && result <= 24.9){
                              status = 'Perfect Weight';
                            }
                            if(result >= 25 && result <= 29.9){
                              status = 'Overweight';
                            }
                            if(result >= 30){
                              status = 'Excessive Obesity';
                            }
                            CalculateCubit.get(context).userBody(
                              weight: weight,
                              time: formate,
                              status: status,
                              height: height,
                              uId: uId,
                            );
                            Navigator.push(context, MaterialPageRoute(builder:(context)=> ResultCalculate(
                              age: age,
                              male: male,
                              result: result.round(),
                              time: formate ,
                              weight: weight,
                              status: status,
                            )));

                          },
                          child: Text(
                            'CALCULATE',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                        ),
                      )
                  ),
                ],
              ),
            );
        },
      ),
    );
  }
}
