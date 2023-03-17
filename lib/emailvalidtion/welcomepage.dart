
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Image(
                          image:
                              AssetImage('assets/image/team_illustration.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "Enterprise team\ncollaboration",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Center(
                        child: Text(
                            "Bring together your files, your tools, project and people.Including a new mobile and desktop application."),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                 //height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Expanded(
                      
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          child: Text("Register",
                          style: TextStyle(
                            color: Colors.black87,
                          ),)),
                    ),
                    Expanded(
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: Text("login",
                          style: TextStyle(
                            color: Colors.white
                          ),)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
