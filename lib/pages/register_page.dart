import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import '../components/text_Botton.dart';
import '../components/text_feild.dart';
import '../helper/show_snakbar.dart';


class RegisterPage extends StatefulWidget {
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formkey =GlobalKey();

  String? email;

  String? password;

  bool isLoding = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
        backgroundColor: Color(0xff314F6A),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                SizedBox(
                  height: 75,
                ),
                Image.asset(
                  'assets/images/scholar.png',
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Scholar Chat',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'Pacifico')),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text('Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFeild(
         
                  hintText: 'Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFeild(
                  hintText: 'password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextBotton(
                  text: 'Register',
                  onTap: () async {

                    if (formkey.currentState!.validate())
                    {
                      setState(() {
                        
                      });
                      isLoding = true;
                    try { 
                                  await userRegisteration();
                                  Navigator.pushNamed(context, ChatPage.id);
                    } on FirebaseAuthException catch (ex) {
                      if (ex.code == 'weak-password') {
                        showSnackBar(context,'weak password');
                      } else if (ex.code == 'email-already-in-use') {
                        showSnackBar(context, 'The account already exists for that email');
                      
                    }
                     }
                       
                  }
                  isLoding = false;
                    setState(() {
                      
                    });
                     
                    }
                 
                  
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text('Login',
                            style: TextStyle(color: Color(0xffC7EDE6)))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 

  Future<void> userRegisteration() async {
     UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email!, password: password!);
  }
}
