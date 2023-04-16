// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, no_logic_in_create_state, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:nutrition_app/Mukul/CaloriesBottomModalSheet.dart';

class CaloriesInfo extends StatefulWidget {
  CaloriesInfo({
    Key? key,
    required this.body,
    required this.date,
    required this.totalProtein,
    required this.totalCalories,
    required this.totalFat,
    required this.totalCarbs,
  }) : super(key: key);


  var body;
  var date;
  var totalProtein;
  var totalCalories;
  var totalFat;
  var totalCarbs;

  @override
  State<CaloriesInfo> createState() => _CaloriesInfoState(
        body: body,
        date: date,
        totalCalories: totalCalories,
        totalCarbs: totalCarbs,
        totalFat: totalFat,
        totalProtein: totalProtein,
      );
}

class _CaloriesInfoState extends State<CaloriesInfo> {
  _CaloriesInfoState({
    required this.body,
    required this.date,
    required this.totalProtein,
    required this.totalCalories,
    required this.totalFat,
    required this.totalCarbs,
  });

  var body;
  var date;
  var totalProtein;
  var totalCalories;
  var totalFat;
  var totalCarbs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${date}",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.08),
              ),
              Container(
                width: (MediaQuery.of(context).size.width) * 1,
                height: (MediaQuery.of(context).size.height) * 0.15,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE1B6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Protein",
                            style: TextStyle(
                                fontSize: 25, color: Colors.deepOrangeAccent),
                          ),
                          Text(
                            "${totalProtein}g",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Calories",
                            style: TextStyle(
                                fontSize: 25, color: Colors.deepOrangeAccent),
                          ),
                          Text("${totalCalories}g",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrangeAccent)),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Fat",
                            style: TextStyle(
                                fontSize: 25, color: Colors.deepOrangeAccent),
                          ),
                          Text(
                            "${totalFat}g",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Carbs",
                            style: TextStyle(
                                fontSize: 25, color: Colors.deepOrangeAccent),
                          ),
                          Text(
                            "${totalCarbs}g",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: (MediaQuery.of(context).size.height) * 0.7,
                child: ListView.builder(
                  itemCount: body.data().toString().contains('Food Track')? body['Food Track'].length : 0,
                  itemBuilder: (context, int index) {
                    if (body['Food Track'][index]["Date"] == date) {
                      return Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Time: ${body['Food Track'][index]["Time"]}",
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8 *
                                          0.5,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2 *
                                              0.7,
                                      child: Center(
                                        child: Text(
                                          "${body['Food Track'][index]["Food Name"]}"
                                              .toUpperCase(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8 *
                                          0.4,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2 *
                                              0.7,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Protein : ${body['Food Track'][index]["Protein"]}g",
                                          ),
                                          Text(
                                            "Calories : ${body['Food Track'][index]["Calories"]}g",
                                          ),
                                          Text(
                                            "Fat : ${body['Food Track'][index]["Fat"]}g",
                                          ),
                                          Text(
                                            "Carbs : ${body['Food Track'][index]["Carbohydrates"]}g",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              context: context,
              builder: (BuildContext context) {
                return CaloriesBottomModalSheet();
              },
            );
          },
          backgroundColor: Colors.green,
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
