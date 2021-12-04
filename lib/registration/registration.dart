// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hmo/registration/chousechip.dart';
import 'package:hmo/registration/contacts.dart';
import 'package:hmo/utils/colors.dart';
import 'package:hmo/widget/appber.dart';
import 'package:hmo/widget/button.dart';
import 'package:hmo/widget/from_field.dart';
import 'package:image_picker/image_picker.dart';

class Registration extends StatefulWidget {
  static const String path = "Registration";
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var formkey = GlobalKey<FormState>();
  String? images;
  TextEditingController datecontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController imagename = TextEditingController();
  Future selecttime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null) {
      datecontroller.text = "${picked.day}-${picked.month}-${picked.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Appbar(
                text: 'Basic Information',
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Image.asset('assets/images/Group_594.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                height: MediaQuery.of(context).size.height * 1 / 2.2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: kElevationToShadow[2],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  margin:
                      EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  'Full name',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(
                                      COLOR.coustomColors('707070'),
                                    ),
                                  ),
                                ),
                              ),
                              TextFromFields(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(25),
                                ],
                                hintText: 'Full name',
                                controller: namecontroller,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  'Date of Birth',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(
                                      COLOR.coustomColors('707070'),
                                    ),
                                  ),
                                ),
                              ),
                              TextFromFields(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(9),
                                ],
                                controller: datecontroller,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Date of Birth';
                                  }
                                },
                                hintText: 'Date of Birth',
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      selecttime(context);
                                    },
                                    icon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gender',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(
                                    COLOR.coustomColors('707070'),
                                  ),
                                ),
                              ),
                              Genterchip(),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  'Be Verified by your NID card',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(
                                      COLOR.coustomColors('707070'),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(COLOR.coustomColors('F6F6F6')),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: images == null
                                              ? Text(
                                                  'IMG123456',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(
                                                      COLOR.coustomColors(
                                                          '707070'),
                                                    ),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )
                                              : Image.file(File(images!)),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              imagepikers();
                                            },
                                            icon: Container(
                                              height: 38,
                                              width: 38,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.upload_file_rounded,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ButtonWidget(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 5,
                ),
                buttonname: 'Continue',
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactsNumber()));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  final ImagePicker _imagePicker = ImagePicker();
  Future imagepikers() async {
    final XFile? selectimage = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      images = selectimage!.path;
    });
  }
}
