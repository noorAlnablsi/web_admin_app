import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:web_admin_app/widget/app_button.dart';
import 'package:web_admin_app/widget/color.dart';
import 'package:web_admin_app/widget/my_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/Component 07.png")),

          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   stops: [0, 0.32, 0.57, 0.96],
          //   colors: [
          //     Color.fromARGB(255, 92, 97, 174),
          //     Color.fromARGB(255, 106, 21, 146),
          //     Color.fromARGB(255, 101, 29, 101),
          //     Color(0xFFB1C5D5)
          //   ],
          // ),
        ),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(30),
              SvgPicture.asset('images/Component 13.svg'),

              Padding(
                  padding: EdgeInsets.all(29.0),
                  child: RichText(
                    text: TextSpan(
                      // style: TextStyle(backgroundColor: Colors.amber),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Sign in to ',
                            style: TextStyle(
                              color: primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text: 'eventique',
                            style: TextStyle(
                              color: secondary,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  )),
              // Gap(10),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(width: 1, color: primary),
                    color: Color.fromARGB(247, 236, 235, 235),
                  ),
                  height: 330,
                  width: 430,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //  Gap(10),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(90, 20, 40, 10),
                          child: Text(
                            "Username",
                            // style: TextStyle(
                            //   fontFamily: 'IrishGrover',
                            //   fontSize: 36,
                            //   color: onPrimary,
                            // ),
                          ),
                        ),
                        //  Gap(10),
                        Center(
                          child: MyTextField(
                              myIcon: Icons.email, hintText: "Enter your name"),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(80, 10, 40, 10),
                          child: Row(
                            children: [
                              Text(" password"),
                              Gap(70),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forget password?",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 122, 122, 144),
                                        // fontFamily: 'AlegreyaSC',
                                        fontSize: 15),
                                  )),
                            ],
                          ),
                        ),

                        Center(
                          child: MyTextField(
                            myIcon: Icons.lock_open,
                            hintText: "Enter your password",
                            obscureText: true,
                            traillingIcon: Icon(Icons.visibility_off),
                          ),
                        ),
                        Gap(25),

                        Center(child: MyButton(text: "Login")),
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}
