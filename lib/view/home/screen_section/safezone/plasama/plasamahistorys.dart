// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hmo/model/plasamahistory.dart';

import 'package:hmo/utils/colors.dart';
import 'package:hmo/view/home/screen_section/safezone/plasama/ppoppup.dart';

class VPlasamaHestory extends StatefulWidget {
  const VPlasamaHestory({Key? key}) : super(key: key);

  @override
  _VPlasamaHestoryState createState() => _VPlasamaHestoryState();
}

class _VPlasamaHestoryState extends State<VPlasamaHestory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'Plasma Donor History',
          style: TextStyle(color: Color(COLOR.coustomColors('#303030'))),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: plasamahistory.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return PPoppub(
                                  image: '${plasamahistory[index].image}',
                                  hospitalname:
                                      '${plasamahistory[index].hospitalname}',
                                  bloodgroup:
                                      '${plasamahistory[index].bloodgroup}',
                                  date: '${plasamahistory[index].date}',
                                  name: '${plasamahistory[index].name}',
                                  location: '${plasamahistory[index].location}',
                                );
                              });
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: kElevationToShadow[4],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 1.5,
                                                  color: Color(
                                                    COLOR.coustomColors(
                                                        '#FF4C4C'),
                                                  ),
                                                ),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${plasamahistory[index].image}'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Container(
                                              child: Text(
                                                '${plasamahistory[index].name}'
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                  color: Color(
                                                    COLOR.coustomColors(
                                                        '#00B27A'),
                                                  ),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: CircleAvatar(
                                          backgroundColor: Color(
                                              COLOR.coustomColors('#FF4C4C')),
                                          child: Center(
                                            child: Text(
                                              '${plasamahistory[index].bloodgroup}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      1 /
                                      1.5,
                                  child: Text(
                                    '${plasamahistory[index].hospitalname}',
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1 /
                                                1.5,
                                        child: Text(
                                          '${plasamahistory[index].location}',
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                            color: Color(
                                                COLOR.coustomColors('#707070')),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          '${plasamahistory[index].date}',
                                          style: TextStyle(
                                            color: Color(
                                              COLOR.coustomColors('#FF4C4C'),
                                            ),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
