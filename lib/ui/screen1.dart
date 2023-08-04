import 'dart:io';

import 'package:flightradar/bloc/flight_bloc.dart';
import 'package:flightradar/repositry/modelclass/Flightmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

late Flightmodel flight;

class _screen1State extends State<screen1> {
  @override
  void initState() {
    BlocProvider.of<FlightBloc>(context).add(Fetchflight());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          toolbarHeight: 80,
          title: Text(
            "Flight radar",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
          actions: [
            Container(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage("asset/1.png"),
                )),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.black45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: 400,
                child: Image.asset(
                  "asset/flight.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<FlightBloc, FlightState>(builder: (context, state) {
          if (state is FlightLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FlightError) {
            return RefreshIndicator(
              onRefresh: () async {
                return BlocProvider.of<FlightBloc>(context).add(Fetchflight());
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * .9,
                    // color: Colors.red,
                    child:
                        const Center(child: Text('Oops something went wrong'))),
              ),
            );
          }
          if (state is FlightLoaded) {
            flight = BlocProvider.of<FlightBloc>(context).flightmodel;
            return ListView.builder(
              itemCount: flight.rows!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 278,
                  width: 375,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white38)),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Container(
                          height: 260,
                          width: 375,
                          color: Colors.black,
                          child: ListView.builder(itemCount: flight.rows![index].models!.length,
                            itemBuilder: (BuildContext context, int index1) {
                             return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                             Text(
                             "Discription :${flight.rows![index].description.toString()}",
                              style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                              ),
                                  Text(
                                    "NAME :${flight.rows![index].models![index1].name.toString()}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.white),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      "CODE :${flight.rows![index].models![index1].code.toString()}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              );

                            }
                            ),
                        ),
                      ),
                    ],
                  ),
                );

              },
            );

          }else {
            return SizedBox();}
        }
        )
    );
  }
}
