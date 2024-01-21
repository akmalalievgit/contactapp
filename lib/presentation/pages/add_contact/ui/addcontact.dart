import 'package:contact_app/data/contact_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/repository/mypreference.dart';
import '../models/text_field.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

var _controllerName = TextEditingController();
var _controllerNumb = TextEditingController();

class _AddContactScreenState extends State<AddContactScreen> {
  // final appRepositoryImpl = AppRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/add.png"),
            const SizedBox(height: 64),
            InputText("Username", TextInputType.text, _controllerName, ""),
            const SizedBox(height: 24),
            InputText(
                "Phone Number", TextInputType.phone, _controllerNumb, "+998"),
            const SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                color: const Color(0xFFEB5757),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: InkWell(
                  onTap: () {
                    if (_controllerNumb.text.length == 9 &&
                        _controllerName.text.length > 3) {
                      MyPreference.addContact(
                          ContactData(
                              name: _controllerName.text,
                              phone: _controllerNumb.text, id: ''));
                      Navigator.pop(context);
                      _controllerName.clear();
                      _controllerNumb.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Something wrong"),
                      )
                      );
                    }
                  },
                  child: Text(
                    'Add Contact',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
