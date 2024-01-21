import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  String name;
  String phone;
   EditScreen{super.key, required this.name,required this.phone });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
