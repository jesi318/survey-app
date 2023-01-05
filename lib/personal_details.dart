import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:phone_otp_ui/Education.dart';
import 'package:phone_otp_ui/widgets/dob.dart';
import 'package:phone_otp_ui/widgets/textField.dart';
import 'package:phone_otp_ui/widgets/text_heading.dart';
import 'package:phone_otp_ui/widgets/yesno_button.dart';

class PersDetails extends StatefulWidget {
  const PersDetails({super.key});

  @override
  State<PersDetails> createState() => _PersDetailsState();
}

class _PersDetailsState extends State<PersDetails> {
  final SpouseNamecontroller = TextEditingController();
  final SpouseNumbercontroller = TextEditingController();
  final Spousejobcontroller = TextEditingController();
  final ChildNocontroller = TextEditingController();
  bool hostelneeded = false;
  bool children = false;
  bool siblings = false;
  String dropdownvalue1 = 'Home';
  var items1 = ['Home', 'PG'];
  String dropdownvalue2 = 'married';
  var items2 = ['married', 'unmarried', 'widow'];
  String childrennum = '0';
  var items3 = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  String father = 'Working';
  var items4 = ['Working', 'Not working', 'Late', "Not Willing to Disclose"];
  String mother = 'Working';
  var items5 = [
    'Working',
    'Not working',
    'Late',
    'Housewife',
    "Not Willing to Disclose"
  ];
  String siblingsnum = '0';
  var items6 = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  String siblingjob = 'Working';
  var items7 = [
    'Working',
    'Not working',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 15,
          ),
          HeadingText(
              text: "Personal Details", fontWeight: FontWeight.bold, size: 30),

          SizedBox(
            height: 15,
          ),
          //Question 1
          Yesno_Button(
            child: Text("Settled in Bangalore?"),
            onAnswer: (ans) {
              setState(() {});
            },
          ),

          //Question 2
          Yesno_Button(
              child: Text("In need of Hostel Facility?"),
              onAnswer: (ans) {
                print(ans);
                if (ans == "No") {
                  setState(() {
                    hostelneeded = false;
                  });
                } else {
                  setState(() {
                    hostelneeded = true;
                  });
                }
              }),

          hostelneeded == false
              ? Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Currently Staying in"),
                      DropdownButton(
                          value: dropdownvalue1,
                          items: items1.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue1 = newValue!;
                            });
                          }),
                    ],
                  ),
                )
              : Container(),

          dropdownvalue1 == "Home"
              ? Container(
                  child: Yesno_Button(
                      child: Text("Staying With family"),
                      onAnswer: (ans) {
                        print(ans);
                      }),
                )
              : Container(),

          //Question 3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Marital status"),
              DropdownButton(
                  value: dropdownvalue2,
                  items: items2.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue2) {
                    setState(() {
                      dropdownvalue2 = newValue2!;
                    });
                  }),
            ],
          ),

          //if conditions
          Container(
              child: dropdownvalue2 == 'married'
                  ? Column(
                      children: [
                        textFeld(
                            hintText: "Name  of Spouse",
                            icon: Icons.person_pin_circle,
                            inputType: TextInputType.name,
                            maxLines: 2,
                            controller: SpouseNamecontroller),
                        textFeld(
                            hintText: "Mobile Number of Spouse",
                            icon: Icons.phone,
                            inputType: TextInputType.number,
                            maxLines: 1,
                            controller: SpouseNumbercontroller),
                        DobID(),
                        textFeld(
                            hintText: "Job of Spouse",
                            icon: Icons.person_add,
                            inputType: TextInputType.name,
                            maxLines: 2,
                            controller: Spousejobcontroller),
                        SizedBox(
                          height: 20,
                        ),

                        //Children
                        HeadingText(
                            text: "Children",
                            fontWeight: FontWeight.bold,
                            size: 20),
                        Yesno_Button(
                            child: Text("Children"),
                            onAnswer: (ans) {
                              if (ans == "No") {
                                setState(() {
                                  children = false;
                                });
                              } else {
                                setState(() {
                                  children = true;
                                });
                              }
                            }),
                        children == true
                            ? Column(
                                children: [
                                  Yesno_Button(
                                      child: Text("Staying with Children?"),
                                      onAnswer: (ans) {}),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("No. of Children"),
                                      DropdownButton(
                                          value: childrennum,
                                          items: items3.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue3) {
                                            setState(() {
                                              childrennum = newValue3!;
                                            });
                                          }),
                                    ],
                                  ),
                                  for (var i = 0;
                                      i < int.parse(childrennum);
                                      i++)
                                    Column(
                                      children: [
                                        Text("Child " + (i + 1).toString()),
                                        DobID(),
                                      ],
                                    ),
                                ],
                              )
                            : Container(),

                        SizedBox(
                          height: 20,
                        ),

                        //Father and Mother
                        HeadingText(
                            text: "Father and Mother",
                            fontWeight: FontWeight.bold,
                            size: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Father"),
                            DropdownButton(
                                value: father,
                                items: items4.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue3) {
                                  setState(() {
                                    father = newValue3!;
                                  });
                                }),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Mother'),
                            DropdownButton(
                                value: mother,
                                items: items5.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue3) {
                                  setState(() {
                                    mother = newValue3!;
                                  });
                                }),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //Siblings

                        HeadingText(
                            text: "Siblings",
                            fontWeight: FontWeight.bold,
                            size: 20),
                        Yesno_Button(
                            child: Text("Siblings"),
                            onAnswer: (ans) {
                              if (ans == "No") {
                                setState(() {
                                  siblings = false;
                                });
                              } else {
                                setState(() {
                                  siblings = true;
                                });
                              }
                            }),
                        siblings == true
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("No. of Siblings"),
                                      DropdownButton(
                                          value: siblingsnum,
                                          items: items6.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue3) {
                                            setState(() {
                                              siblingsnum = newValue3!;
                                            });
                                          }),
                                    ],
                                  ),
                                  for (var i = 0;
                                      i < int.parse(siblingsnum);
                                      i++)
                                    Column(
                                      children: [
                                        Text("Sibling " + (i + 1).toString()),
                                        DobID(),
                                        DropdownButton(
                                            value: siblingjob,
                                            items: items7.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue3) {
                                              setState(() {
                                                siblingjob = newValue3!;
                                              });
                                            }),
                                      ],
                                    ),
                                ],
                              )
                            : Container(),

                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  : dropdownvalue2 == 'widow' || dropdownvalue2 == 'divorced'
                      ? Text('im a widow or divorcee')
                      : Text("im single")),

          //Continue button
          ElevatedButton(
              onPressed: () {
                Get.to(Education());
              },
              child: Text('Continue')),

          SizedBox(
            height: 10,
          )
        ]),
      )),
    );
  }
}
