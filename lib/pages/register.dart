
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/homepage.dart';
import 'package:untitled1/pages/login.dart';
import 'package:untitled1/widget/reuseButton.dart';
import 'package:untitled1/widget/reuseTextField.dart';
import 'package:untitled1/widget/signin_option.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.15, 20, 0),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      image: DecorationImage(
                        image: AssetImage("assets/logo.jpg"),
                      )),
                  // logoWidget('assets/logo.jpg')
                ),
                Container(
                  height: 40,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/logo_name.png"),
                      )
                  ),
                ),

                const SizedBox(height: 20,),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      color: Color(0xCCE97171)
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: reuseTextField("Username", Icons.person, false, _emailTextController),
                ),
                const SizedBox(height: 15,),
                Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: reuseTextField("Password", Icons.lock, true, _passwordTextController),
                ),
                // const SizedBox(height: 15,),
                // Container(
                //   width: 300,
                //   height: 60,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     boxShadow: const [
                //       BoxShadow(
                //         color: Colors.black38,
                //         blurRadius: 4,
                //         offset: Offset(0, 3),
                //       ),
                //     ],
                //   ),
                //   child: reuseTextField("Confirm Password", Icons.lock, true, _passwordTextController),
                // ),
                const SizedBox(height: 25,),
                signInButton(context, false, (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text,
                    password: _passwordTextController.text).then((value) => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage())));

                }),
                const SizedBox(height: 15,),
                signUpOption(context)
              ],
            ),
          ),
        ),
      ),
    );
  }


}

