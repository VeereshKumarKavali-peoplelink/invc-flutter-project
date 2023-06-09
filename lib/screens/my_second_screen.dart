import 'package:flutter/material.dart';
import 'package:invc_flutter_project/screens/my_first_screen.dart';
import 'package:invc_flutter_project/screens/my_forgot_password_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MySecondScreen extends StatefulWidget {
  const MySecondScreen({super.key});

  @override
  State<MySecondScreen> createState() => _MySecondScreenState();
}

class _MySecondScreenState extends State<MySecondScreen> {
  var _selectedOption = "English";
  final _options = [
    'English',
    'francias',
    'Hindi',
    'Italiana',
    'portugues',
    'Espanola'
  ];

  bool _isHidden = true;

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
                  onPressed: ()async {
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
                        onChanged: (item){setState(() {
                          _selectedOption = item!;
                        });},
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
                child: Column(children: [
                  const Center(
                      child: Text("Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              height: 2.0,
                              fontWeight: FontWeight.bold))),
                   const TextField(
                    decoration: InputDecoration( 
                        hintText: "", labelText: "Email", labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold) ,  suffixIcon:  Icon(Icons.star, color: Colors.red, size: 0,),enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:  Colors.grey, width: 2.0)),focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:  Color(0xFF24A4C4), width: 2.0))),
                    keyboardType:  TextInputType.emailAddress,
                  ),
                   TextField(
                    decoration: InputDecoration(
                        hintText: "",  labelText: "Password", labelStyle:const  TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),suffixIcon: GestureDetector(onTap:() {
                          setState((){_isHidden = !_isHidden;});
                        }, child: _isHidden ? const Icon(Icons.visibility_off, color: Colors.grey,) : const Icon(Icons.visibility, color: Colors.grey)),enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color:  Colors.grey, width: 2.0)),focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color:  Color(0xFF24A4C4), width: 2.0))),
                    keyboardType: TextInputType.text,
                    obscureText: _isHidden,
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 4),
                      width: 300, //Color.fromARGB(255, 14, 224, 161)
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: const Color(0xFF24A4C4),
                          ),
                          onPressed: null,
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      )),
      
                   Center(
                      child: TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyForgotPasswordScreen() ));},
                        child: const Text("Forgot Password?",
                            style: TextStyle(
                                color: Color(0xFF24A4C4),
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500
                              )),
                      )),
      
                   Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [const 
                          Text("Dont have an account?",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 15.0,)),
                        TextButton(onPressed: (){Navigator.pop(context);}, child: const Text("Sign Up", style: TextStyle(color: Color(0xFF24A4C4))))],
                      )),
                ]))),
      ),
      
      bottomNavigationBar: Container(
        //decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 2)),
        //margin: const EdgeInsets.only(top: 50),
      
          height: 70,
          color: Colors.white,
          child:  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      "© 2022 InstaVC Inc. All Rights Reserved. I agree to the",
                      style: TextStyle(fontSize: 12, color: Colors.black), textWidthBasis: TextWidthBasis.parent,),
                TextButton(onPressed: ()async {
                  String url = "https://www.invc.vc/terms-and-conditions/";
                      await launchUrl(Uri.parse(url));
                }, child: const Text("Terms & Conditions", style: TextStyle(color: Color(0xFF24A4C4), decoration: TextDecoration.underline, decorationColor: Color(0xFF24A4C4), decorationThickness: 1.5)))
                ],
              ))),
    );
  }
}


//0xFF24A4C4 