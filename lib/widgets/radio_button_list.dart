import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'student.dart';

class RadioButtonList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    Student ashish = Student(12, 'Ashish');
    Student sonu = Student(13, 'Sonu');
    Student bablu = Student(15, 'Bablu');
    List<Student> students = new List();
    students.add(ashish);
    students.add(sonu);
    students.add(bablu);
    return _RadioButtonListState(students: students);
  }
}

class _RadioButtonListState extends State<RadioButtonList> {
  List<Student> students;
  int _selectedIndex = 0;

  _RadioButtonListState({@required this.students});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(itemBuilder: (context, index) {
        Student student = students[index];
        return RadioListTile(
            title: Text(student.name),
            onChanged: (value) {});
      },),
    );
  }
}
