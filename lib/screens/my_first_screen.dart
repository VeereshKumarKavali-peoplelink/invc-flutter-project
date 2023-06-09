import 'package:invc_flutter_project/screens/form_validation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'my_second_screen.dart';

class MyFirstScreen extends StatefulWidget {
  const MyFirstScreen({super.key});

  @override
  State<MyFirstScreen> createState() => _MyFirstScreenState();
}

class _MyFirstScreenState extends State<MyFirstScreen> {
  var _selectedOption = "English";
  final _options = [
    'English',
    'francias',
    'Hindi',
    'Italiana',
    'portugues',
    'Espanola'
  ];

  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;
  bool isHovering = false;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

//  @override
//  void dispose() {
//     _nameController.dispose();
//     super.dispose();

//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Image.asset("images/invc_logo.png", height: 50, width: 100),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                  onPressed: () async {
                    String url = "https://help.instavc.com/invc";
                    await launchUrl(Uri.parse(url));
                  },
                  icon: const Icon(Icons.play_circle, color: Colors.white),
                  label: const Text("Help Center",
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF24A4C4),
                      textStyle: const TextStyle(color: Colors.white))),
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.only(left: 10),
                  height: 33,
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: const Color(0xFF24A4C4))),
                  child: Row(
                    children: [
                      const Icon(Icons.language, color: Colors.black),
                      DropdownButton(
                        value: _selectedOption,
                        items: _options.map((String option) {
                          return DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (item) {
                          setState(() {
                            _selectedOption = item!;
                          });
                        },
                      ),
                    ],
                  ))
            ],
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Center(
                      child: Text("Free Trial Sign Up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              height: 2.0,
                              fontWeight: FontWeight.bold))),
                  const Center(
                      child: Text("No credit card required",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            height: 1.5,
                          ))),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        hintText: "",
                        labelText: "Full Name",
                        //suffix: Text('*', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,)),
                        labelStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                        suffixIcon: Icon(
                          Icons.star,
                          color: Colors.grey,
                          size: 5,
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF24A4C4), width: 2.0))),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      return validateFullName(value);
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "",
                        labelText: "Email",
                        labelStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                        suffixIcon: Icon(
                          Icons.star,
                          color: Colors.grey,
                          size: 5,
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF24A4C4), width: 2.0))),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      return validateEmail(value);
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: "",
                        labelText: "Password",
                        labelStyle: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPasswordHidden = !_isPasswordHidden;
                              });
                            },
                            child: _isPasswordHidden
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  )
                                : const Icon(Icons.visibility,
                                    color: Colors.grey)),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF24A4C4), width: 2.0))),
                    keyboardType: TextInputType.text,
                    obscureText: _isPasswordHidden,
                    validator: (value) {
                      return validatePassword(value);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "",
                        labelText: "Confirm Password",
                        labelStyle: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isConfirmPasswordHidden =
                                    !_isConfirmPasswordHidden;
                              });
                            },
                            child: _isConfirmPasswordHidden
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  )
                                : const Icon(Icons.visibility,
                                    color: Colors.grey)),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF24A4C4), width: 2.0))),
                    keyboardType: TextInputType.text,
                    obscureText: _isConfirmPasswordHidden,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your password.';
                      }
                      if (value != _passwordController.text) {
                        return 'Confirm password should match the above password.';
                      }
                      return null;
                    },
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 5),
                      width: 300, //Color.fromARGB(255, 14, 224, 161)
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF24A4C4),
                          ),
                          onPressed: () {
                            _formKey.currentState!.validate();
                          },
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      )),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an acoount? ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 15.0)),
                      MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) {
                            setState(() {
                              isHovering = true;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              isHovering = false;
                            });
                          },
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MySecondScreen()));
                              },
                              child: Text("Login",
                                  style: TextStyle(
                                      decoration: isHovering
                                          ? TextDecoration.underline
                                          : TextDecoration.none,
                                      color: const Color(0xFF24A4C4)))))
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
          //decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 2)),
          //margin: const EdgeInsets.only(top: 50),

          height: 70,
          color: Colors.white,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "© 2022 InstaVC Inc. All Rights Reserved. I agree to the",
                style: TextStyle(fontSize: 12, color: Colors.black),
                textWidthBasis: TextWidthBasis.parent,
              ),
              TextButton(
                  onPressed: () async {
                    String url = "https://www.invc.vc/terms-and-conditions/";
                    await launchUrl(Uri.parse(url));
                  },
                  child: const Text("Terms & Conditions",
                      style: TextStyle(
                          color: Color(0xFF24A4C4),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF24A4C4),
                          decorationThickness: 1.5)))
            ],
          ))),
    );
  }
}

//enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.red), )

//Color.fromRGBO(10, 186, 181, 1)
//validator: (value){
//if(value == empty || value.isEmpty)}{
//   return "Please Enter name"
//}
//return null;
//}
