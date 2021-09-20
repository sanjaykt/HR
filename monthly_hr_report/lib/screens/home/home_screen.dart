import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:monthly_hr_report/commons/my_colors.dart';
import 'package:monthly_hr_report/screens/login/login_screen.dart';
import 'package:monthly_hr_report/widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('AWNA Monthly Report'),
        // backgroundColor: theme.primaryColor,
      ),
      drawer: AppDrawer(),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(8),
          child: ListView(
            children: [
              Container(child: Text('Employee Name', style: TextStyle(fontSize: 18))),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: TextStyle(fontSize: 10),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Container(child: Text('Employee Id', style: TextStyle(fontSize: 18))),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Id',
                  hintStyle: TextStyle(fontSize: 10),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Container(child: Text('Reporting Year', style: TextStyle(fontSize: 18))),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Year',
                  hintStyle: TextStyle(fontSize: 10),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Container(child: Text('Reporting Month', style: TextStyle(fontSize: 18))),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Month',
                  hintStyle: TextStyle(fontSize: 10),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Container(child: Text('Working Days of the Month', style: TextStyle(fontSize: 18))),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Worked Days',
                  hintStyle: TextStyle(fontSize: 10),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Container(child: Text('Days of Leave Taken', style: TextStyle(fontSize: 18))),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Leaves Taken',
                  hintStyle: TextStyle(fontSize: 10),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              Divider(color: MyColors.primaryColor, thickness: 3),
              Text('Report Details', textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
              SizedBox(height: 30),
              Text('Teaching Work', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              Text('Hours Worked', textAlign: TextAlign.left, style: TextStyle(fontSize: 14)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(columns: <DataColumn>[
                  DataColumn(label: Text('Weeks')),
                  DataColumn(label: Text('Teaching Theory')),
                  DataColumn(label: Text('Tutorial/Laboratory')),
                  DataColumn(label: Text('Teaching Preparation ')),
                  DataColumn(label: Text('BTech student Guidance ')),
                  DataColumn(label: Text('MTech student Guidance')),
                  DataColumn(label: Text('PhD student Guidance ')),
                ], rows: <DataRow>[
                  DataRow(cells: [
                    DataCell(Text('Week 1')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Week 2')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Week 3')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Week 4')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Week 5')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Total')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ])
                ]),
              ),
              SizedBox(height: 20),
              Container(child: Text('Total Teaching Hours', style: TextStyle(fontSize: 16))),
              SizedBox(height: 20),
              SizedBox(height: 20),
              ExpandablePanel(
                header: Text('Summary of Task Completed'),
                collapsed: Container(),
                expanded: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                  minLines: 5,
                  maxLines: 5,
                ),
              ),
              // Text('Summary of Task Completed'),
              // TextFormField(
              //   decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
              //   minLines: 5,
              //   maxLines: 5,
              // ),
              // SizedBox(height: 20),
              ExpandablePanel(
                header: Text('Summary of Deliverables'),
                expanded: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                  minLines: 5,
                  maxLines: 5,
                ),
                collapsed: Container(),
              ),
              ExpandablePanel(
                header: Text('Achievements/Outcomes'),
                collapsed: Container(),
                expanded: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                  minLines: 5,
                  maxLines: 5,
                ),
              ),

              Divider(),
              Text('Research Work', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              Text('Hours Worked', textAlign: TextAlign.left, style: TextStyle(fontSize: 14)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(columns: <DataColumn>[
                  DataColumn(label: Text('Weeks')),
                  DataColumn(label: Text('Engineering solution development')),
                  DataColumn(label: Text('Research Work')),
                  DataColumn(label: Text('Publication/Proposal Writing')),
                ], rows: <DataRow>[
                  DataRow(cells: [
                    DataCell(Text('Week 1')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Week 2')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Week 3')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Week 4')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Week 5')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Total')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ])
                ]),
              ),
              SizedBox(height: 20),
              Container(child: Text('Total Research Hours', style: TextStyle(fontSize: 16))),
              SizedBox(height: 20),
              SizedBox(height: 20),
              ExpandablePanel(
                header: Text('Summary of Task Completed'),
                collapsed: Container(),
                expanded: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                  minLines: 5,
                  maxLines: 5,
                ),
              ),
              ExpandablePanel(
                header: Text('Summary of Deliverables'),
                collapsed: Container(),
                expanded: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                  minLines: 5,
                  maxLines: 5,
                ),
              ),
              ExpandablePanel(
                header: Text('Achievements/Outcomes'),
                collapsed: Container(),
                expanded: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                  minLines: 5,
                  maxLines: 5,
                ),
              ),
              Divider(),
              Text('Admin Work', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              Text('Hours Worked', textAlign: TextAlign.left, style: TextStyle(fontSize: 14)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(columns: <DataColumn>[
                  DataColumn(label: Text('Weeks')),
                  DataColumn(label: Text('Team Management')),
                  DataColumn(label: Text('Team Meeting')),
                  DataColumn(label: Text('International/Industry/National Collaboration Meetings')),
                  // DataColumn(label: RichText(
                  //   text: TextSpan(
                  //     text: 'International\n',
                  //     children: [
                  //       TextSpan(text: 'Industry/National\n'),
                  //       TextSpan(text: 'Collaboration Meetings')
                  //     ]
                  //   ),
                  // )),
                  DataColumn(label: Text('Administration/Proposal Administration / Coordination')),
                  DataColumn(label: Text('Presentations'))
                ], rows: <DataRow>[
                  DataRow(cells: [
                    DataCell(Text('Week 1')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Week 2')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Week 3')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Week 4')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Week 5')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Total')),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                    DataCell(TextFormField()),
                  ])
                ]),
              ),
              SizedBox(height: 20),
              Container(child: Text('Total Admin Hours', style: TextStyle(fontSize: 16))),
              SizedBox(height: 20),
              ExpandablePanel(
                header: Text('Summary of Task Completed'),
                collapsed: Container(),
                expanded: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                  minLines: 5,
                  maxLines: 5,
                ),
              ),
              ExpandablePanel(
                header: Text('Summary of Deliverables'),
                collapsed: Container(),
                expanded: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                  minLines: 5,
                  maxLines: 5,
                ),
              ),
              ExpandablePanel(
                header: Text('Achievements/Outcomes'),
                collapsed: Container(),
                expanded: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                  minLines: 5,
                  maxLines: 5,
                ),
              ),
              SizedBox(height: 30),
              Container(child: Text('Total Hours in the Month', style: TextStyle(fontSize: 20)),),
              SizedBox(height: 20),
              Container(child: Text('Average Hours in a Day', style: TextStyle(fontSize: 20),),),
              SizedBox(height: 39),
            ],
          ),
        ),
      ),
    );
  }
}
