// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_logic_in_create_state, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:nutrition_app/Mukul/WaterBottomModalSheet.dart';

class waterTracker extends StatefulWidget {
  waterTracker({
    Key? key,
    required this.body,
    required this.date,
    required this.totalWater,
  }) : super(key: key);
  var body;
  var date;
  var totalWater;

  @override
  State<waterTracker> createState() => _waterTrackerState(
        body: body,
        date: date,
        totalWater: totalWater,
      );
}

class _waterTrackerState extends State<waterTracker> {
  _waterTrackerState({
    required this.body,
    required this.date,
    required this.totalWater,
  });

  var body;
  var date;
  var totalWater;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
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
                            "Today's Intake",
                            style: TextStyle(
                                fontSize: 15, color: Colors.deepOrangeAccent),
                          ),
                          Text(
                            "$totalWater L",
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
                            "Daily goal",
                            style: TextStyle(
                                fontSize: 15, color: Colors.deepOrangeAccent),
                          ),
                          Text("4 L",
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
                            "Today's remaining",
                            style: TextStyle(
                                fontSize: 15, color: Colors.deepOrangeAccent),
                          ),
                          Text(
                            "${4.00- totalWater }L",
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
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemCount: body.data().toString().contains('Water Track')
                      ? body['Water Track'].length
                      : 0,
                  itemBuilder: (context, int index) {
                    if (body.data().toString().contains('Water Track')) {
                      if (body['Water Track'][index]['Date'] == date) {
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                color: Colors.lightGreen,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(body['Water Track'][index]['Time']),
                                  Text(
                                      "${body['Water Track'][index]['Intake Amount']} mL"),
                                  Text(
                                      "${double.parse(body['Water Track'][index]['Intake Amount']) / 1000.00} L"),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
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
                return waterBottomModalSheet();
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
