import 'package:contact_app/domain/repository/mypreference.dart';
import 'package:contact_app/presentation/pages/home_ui.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var name = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var loader = false;
  var passwordVisible=true;
  var passwordVisible2=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  obscureText: passwordVisible2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    labelText: "Password",
                    helperText:"Password must contain special character",
                    helperStyle:TextStyle(color:Colors.white),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible2
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                              () {
                            passwordVisible2 = !passwordVisible2;
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
                    print(MyPreference.register(name.text, password.text));
                    MyPreference.register(name.text, password.text)
                        ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Password yoki name xatto yokida bunday user mavjud"),
                    ))
                        :
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );

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
                        width: 60,
                        child: Text(
                          'Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
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
                      const Text("Don’t have an account yet? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Login",
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
    );
  }
}
