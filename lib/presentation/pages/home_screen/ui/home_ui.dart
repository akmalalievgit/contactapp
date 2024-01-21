import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_app/data/contact_data.dart';
import 'package:contact_app/domain/repository/mypreference.dart';
import 'package:contact_app/presentation/pages/addcontact.dart';
import 'package:contact_app/presentation/pages/edit_ui.dart';
import 'package:contact_app/presentation/pages/login_screen/ui/login_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/contact_item.dart';
import 'editcontact.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContactData> list = [];
    var name="";
  var ishow=false;
  var isLogOutShow = false;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    List<ContactData> fetchedUsers = await MyPreference.getUserList();
    setState(() {
      list = fetchedUsers;
    });
  }


  @override
  Widget build(BuildContext context) {
    setState(() {
      loadUserData();
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Contacts',
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF8E8E93),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {

                              isLogOutShow = true;

                            });
                          },
                          icon: Image.asset(
                            "assets/logout.png",
                            height: 32,
                            width: 32,
                          ))
                    ],
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Stack(
                      children: [
                        // ,
                        ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return ContactItem(list[index].name, list[index].phone,
                                () {
                              setState(() {
                                print("delete");
                                name=list[index].name;
                                ishow=true;
                              });
                            }, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditContactScreen(
                                            name: list[index].name,
                                            phone: list[index].phone,
                                          )));
                            });
                          },
                        ),
                        Positioned(
                            bottom: 25,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddContactScreen()),
                                );
                                setState(() {
                                  loadUserData();
                                });
                              },
                              child: Container(
                                width: 66,
                                height: 66,
                                clipBehavior: Clip.antiAlias,
                                decoration: const ShapeDecoration(
                                    color: Colors.red, shape: OvalBorder()),
                                child: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 20, left: 20),
                                      child: Icon(Icons.add),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),

                ],

              ),

            ),

          ),
          if(ishow) DeleteDialog(context),
          if(isLogOutShow) LogOutDialog(context)
        ],
      )


    );

  }


  Widget DeleteDialog( context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          ishow = false;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            width: MediaQuery.of(context).size.width,
            height: 187,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                const Positioned(
                  left: 28,
                  top: 33,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Icon(Icons.delete),
                  ),
                ),
                Positioned(
                  left: 81,
                  top: 45,
                  child: Text(
                    'Delete contact',
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF8E8E93),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      height: 0.06,
                      letterSpacing: -0.41,
                    ),
                  ),
                ),
                Positioned(
                  right: 28,
                  top: 28,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        ishow = false;
                      });
                    },
                    child: const SizedBox(
                      width: 24,
                      height: 24,
                      child: Icon(Icons.dangerous),
                    ),
                  ),
                ),
                Positioned(
                  left: 82,
                  top: 78,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Do you want delete ',
                          style: TextStyle(
                            color: Color(0xFF8E8E93),
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                            letterSpacing: -0.41,
                          ),
                        ),
                        TextSpan(
                          text: name,
                          style: GoogleFonts.roboto(
                            color: Color(0xFF8E8E93),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 0.09,
                            letterSpacing: -0.41,
                          ),
                        ),
                        TextSpan(
                          text: '?',
                          style: GoogleFonts.roboto(
                            color: Color(0xFF8E8E93),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                            letterSpacing: -0.41,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 15,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        ishow = false;
                        print("name == $name");
                        MyPreference.deleteContact(name);
                        loadUserData();
                        // MyPreference.deleteContact(username!, userName);

                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFEB5757),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 37, vertical: 8),
                        child: Text(
                          "Delete",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget LogOutDialog(context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLogOutShow = false;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            width: MediaQuery.of(context).size.width,
            height: 187,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 28,
                  top: 33,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset("assets/logout.png"),
                  ),
                ),
                Positioned(
                  left: 81,
                  top: 45,
                  child: Text(
                    'Sign Out',
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF8E8E93),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      height: 0.06,
                      letterSpacing: -0.41,
                    ),
                  ),
                ),
                Positioned(
                  right: 28,
                  top: 28,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isLogOutShow = false;
                      });
                    },
                    child: const SizedBox(
                      width: 24,
                      height: 24,
                      child: Icon(Icons.cancel),
                    ),
                  ),
                ),
                Positioned(
                  left: 82,
                  top: 78,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Do you want ',
                          style: TextStyle(
                            color: Color(0xFF8E8E93),
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                            letterSpacing: -0.41,
                          ),
                        ),
                        TextSpan(
                          text: 'unregister',
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF8E8E93),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 0.09,
                            letterSpacing: -0.41,
                          ),
                        ),
                        TextSpan(
                          text: ' or ',
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF8E8E93),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                            letterSpacing: -0.41,
                          ),
                        ),
                        TextSpan(
                          text: 'logout',
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF8E8E93),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 0.09,
                            letterSpacing: -0.41,
                          ),
                        ),
                        TextSpan(
                          text: '?',
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF8E8E93),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                            letterSpacing: -0.41,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 35,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isLogOutShow = false;
                        MyPreference.unregister();
                        MyPreference.logout();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      }
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFFEB5757), width: 1)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        child: Text(
                          "UnRegister",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: const Color(0xFFEB5757),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 35,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isLogOutShow = false;
                        MyPreference.logout();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFEB5757),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 8),
                        child: Text(
                          "Logout",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }





Stream<List<ContactData>>getAllData()=>
    FirebaseFirestore.instance.collection("users").snapshots().map(
          (snapshot) => snapshot.docs.map(
            (e) => ContactData(
          name: e.data()['name'] ?? '',
          phone: e.data()['phone'] ?? '',
        ),
      ).toList(),
    );
}
