import 'package:contact_app/presentation/pages/register_ui.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../domain/repository/mypreference.dart';
import 'home_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var name = TextEditingController();
  var password = TextEditingController();
  var passwordVisible=true;
var loader=false;
  @override
  Widget build(BuildContext context) {

    return Stack(

      children: [

        Scaffold(
          body: Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image.asset("assets/login_icon.png"),
                    const SizedBox(
                      height: 80,
                    ),
                    TextField(
                      controller: name,
                      decoration: InputDecoration(
                        labelText: 'name',
                        hintText: 'Enter your name',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.dangerous),
                          onPressed: () {
                            name.clear();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    TextField(
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                        labelText: "Password",
                        helperText:"Password must contain special character",
                        helperStyle:TextStyle(color:Colors.white),
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                                  () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                        alignLabelWithHint: false,
                        filled: true,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    GestureDetector(
                      onTap: () {

                        print("ischeck ${MyPreference.login(name.text, password.text)}");
                        MyPreference.login(name.text, password.text)
                            ? Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        ) :
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Password yoki name xatto"),
                        ));

                      },
                      child: Container(
                        width: 340,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFEB5757),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Center(
                          child: SizedBox(
                            width: 52,
                            child: Text(
                              'Log In',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Row(
                        children: [
                          Text("Don’t have an account yet? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RegisterScreen()));
                            },
                            child: const Text(
                              "Sign Up here ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
