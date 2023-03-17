import 'package:authvwex/emailvalidtion/authentication.dart';
import 'package:authvwex/screens/phone.dart';
import 'package:authvwex/screens/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebaseauth/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  // String email = '', pass = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(height: 80),
          Column(
            children: [
              FlutterLogo(
                size: 55,
              )
            ],
          ),
          SizedBox(height: 50),
          Text("WELCOME!", style: TextStyle(fontSize: 24)),
          Padding(padding: EdgeInsets.all(8), child: signupform()),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    "Already here ?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Get logged in now!",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Container buildlogo() {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blue),
      child: Center(
        child: Text(
          "T",
          style: TextStyle(color: Colors.white, fontSize: 60),
        ),
      ),
    );
  }
}

class signupform extends StatefulWidget {
  signupform({Key? key}) : super(key: key);
  static String verify = "";
  @override
  State<signupform> createState() => _signupformState();
}

class _signupformState extends State<signupform> {
  final formkey = GlobalKey<FormState>();
  TextEditingController countryController = TextEditingController();
  var phone = "";
  String? email;
  String? password;
  String? name;
  String? phonenumber;

  bool obscureText = false;
  bool agree = false;
  final pass = new TextEditingController();
  String emaill = '', passs = '';
  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)));
    var space = SizedBox(height: 10);
    return Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              onChanged: (value) {
                emaill = value;
              },
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
                border: border,
              ),
              validator: ((value) {
                if (value!.isEmpty) {
                  return "please enter some text";
                }
                return null;
              }),
              onSaved: ((newValue) {
                email = newValue;
              }),
              keyboardType: TextInputType.emailAddress,
            ),
            space,
            TextFormField(
              onChanged: (value) {
                emaill = value;
              },
              controller: pass,
              decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock_outline),
                  border: border,
                  suffixIcon: GestureDetector(
                    onTap: (() {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    }),
                    child: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility),
                  )),
              onSaved: ((newValue) {
                password = newValue;
              }),
              obscureText: !obscureText,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              }),
            ),
            space,
            TextFormField(
                controller: countryController,
               // keyboardType: TextInputType.number,
                onChanged: (value) {
                  phone = value;
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Phone Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Phonenumber";
                  }
                  return null;
                },
                onSaved: ((newValue) {
                  phonenumber = newValue;
                })),

           
            Row(
              children: [
                Checkbox(
                    value: agree,
                    onChanged: (_) {
                      setState(() {
                        agree = !agree;
                      });
                    }),
                Flexible(
                    child: Text(
                        "By creating account,I agree to the terms & Conditions and Privacypolicy"))
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countryController.text + phone}',
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        signupform.verify = verificationId;
                        Get.to(() =>MyPhone());
                      },
                      
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );

                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      AuthenticationHelper()
                          .signUp(email: email!, password: password!,)
                          .then((result) {
                        //Navigator.pushNamed(context, 'home');
                        Get.to(() => MyPhone());
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        "result",
                        style: TextStyle(fontSize: 16),
                      )));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)))),
                  child: Text("Sign up")),
              // child: ElevatedButton(
              //     onPressed: (() {
              //       if (formkey.currentState!.validate()) {
              //         formkey.currentState!.save();
              //         AuthenticationHelper()
              //             .signUp(email: email!, password: password!)
              //             .then((result) {
              //           Navigator.pushNamed(context, 'home');
              //         });
              //       } else {
              //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //             content: Text(
              //           "result",
              //           style: TextStyle(fontSize: 16),
              //         )));
              //       }
              //     }),
              //     style: ElevatedButton.styleFrom(
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(24)))),
              //     child: Text("Signup")),
            )
          ],
        ));
  }
}
