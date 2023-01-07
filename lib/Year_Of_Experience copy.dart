import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:phone_otp_ui/widgets/textField.dart';
import 'package:phone_otp_ui/widgets/text_heading.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  List<TextEditingController> OrganizationNamecontrollers =
      <TextEditingController>[];
  List<TextEditingController> DepartmentNamecontrollers =
      <TextEditingController>[];
  List<TextEditingController> ExpertiseNamecontrollers =
      <TextEditingController>[];
  // List<TextEditingController> TotalExperiencecontrollers =
  //     <TextEditingController>[];
  TextEditingController TotalExperiencecontroller = TextEditingController();
  late List<String> _startDate, _endDate;
  List<DateRangePickerController> _controllers = <DateRangePickerController>[];
  List<Function(DateRangePickerSelectionChangedArgs)?> selections =
      <Function(DateRangePickerSelectionChangedArgs)?>[];

  String org_num = '1';
  var items1 = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OrganizationNamecontrollers =
        List.generate(5, (i) => TextEditingController());
    DepartmentNamecontrollers =
        List.generate(5, (i) => TextEditingController());

    ExpertiseNamecontrollers = List.generate(5, (i) => TextEditingController());
    // TotalExperiencecontrollers =
    //     List.generate(5, (i) => TextEditingController());

    _controllers = List.generate(20, (i) => DateRangePickerController());

    final DateTime today = DateTime.now();

    _startDate = List.generate(
        20, (i) => (DateFormat('dd, MMMM yyyy').format(today).toString()));
    _endDate = List.generate(
        20,
        (i) => (DateFormat('dd, MMMM yyyy')
            .format(today.add(Duration(days: 3)))
            .toString()));
    for (var i = 0; i < int.parse(org_num); i++) {
      _controllers[i].selectedRange =
          PickerDateRange(today, today.add(Duration(days: 3)));

      void selectionChanged(DateRangePickerSelectionChangedArgs args) {
        setState(() {
          _startDate[i] = DateFormat('dd, MMMM yyyy')
              .format(args.value.startDate)
              .toString();
          _endDate[i] = DateFormat('dd, MMMM yyyy')
              .format(args.value.endDate ?? args.value.startDate)
              .toString();
        });
      }

      selections = List.generate(20, (i) => selectionChanged);
    }
  }

// The argument type 'Function' can't be assigned to the parameter type 'void Function(DateRangePickerSelectionChangedArgs)?'.

  @override
  Widget build(BuildContext context) {
    // List<Function(DateRangePickerSelectionChangedArgs)?> selections =
    //     List.generate(20, (i) => selectionChanged);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeadingText(
                  text: "Year of Experience",
                  fontWeight: FontWeight.bold,
                  size: 30,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                    "How many Organizations have\nawarded you with Experience?",
                    overflow: TextOverflow.ellipsis),
                DropdownButton(
                    value: org_num,
                    items: items1.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        org_num = newValue!;
                      });
                    }),
              ],
            ),
            for (var i = 0; i < int.parse(org_num); i++)
              Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text("Organization" + (i + 1).toString()),
                  SizedBox(
                    height: 5,
                  ),
                  textFeld(
                      hintText: "Name of organization",
                      icon: Icons.business,
                      inputType: TextInputType.name,
                      maxLines: 2,
                      controller: OrganizationNamecontrollers[i]),
                  textFeld(
                      hintText: "Department Name",
                      icon: Icons.business,
                      inputType: TextInputType.name,
                      maxLines: 2,
                      controller: DepartmentNamecontrollers[i]),
                  textFeld(
                      hintText: "Area of Expertise",
                      icon: Icons.business,
                      inputType: TextInputType.name,
                      maxLines: 2,
                      controller: ExpertiseNamecontrollers[i]),
                  Column(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          height: 50,
                          child: Text('Start Date: $_startDate')),
                      Container(
                          height: 50, child: Text('End Date:' + _endDate[i])),
                      Card(
                        margin: const EdgeInsets.fromLTRB(50, 40, 50, 100),
                        child: SfDateRangePicker(
                          controller: _controllers[i],
                          selectionMode: DateRangePickerSelectionMode.range,
                          onSelectionChanged: selections[i],
                          allowViewNavigation: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            HeadingText(
                text: "Enter total experience below",
                fontWeight: FontWeight.bold),
            SizedBox(
              height: 15,
            ),
            textFeld(
                hintText: "Total Years of Experience",
                icon: Icons.numbers,
                inputType: TextInputType.number,
                maxLines: 1,
                controller: TotalExperiencecontroller),
            ElevatedButton(onPressed: () {}, child: Text("Continue")),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      )),
    );
  }
}
