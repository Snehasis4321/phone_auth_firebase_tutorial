import 'package:flutter/material.dart';
import 'package:phone_auth_firebase_tutorial/controllers/auth_service.dart';
import 'package:phone_auth_firebase_tutorial/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  TextEditingController _phoneContoller = TextEditingController();
  TextEditingController _otpContoller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Image.asset(
                "images/login.png",
                fit: BoxFit.cover,
              )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back 👋",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                    Text("Enter you phone number to continue."),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _phoneContoller,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            prefixText: "+91 ",
                            labelText: "Enter you phone number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32))),
                        validator: (value) {
                          if (value!.length != 10)
                            return "Invalid phone number";
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AuthService.sentOtp(
                                phone: _phoneContoller.text,
                                errorStep: () => ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "Error in sending OTP",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.red,
                                    )),
                                nextStep: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text("OTP Verification"),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Enter 6 digit OTP"),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                Form(
                                                  key: _formKey1,
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: _otpContoller,
                                                    decoration: InputDecoration(
                                                        labelText:
                                                            "Enter you phone number",
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32))),
                                                    validator: (value) {
                                                      if (value!.length != 6)
                                                        return "Invalid OTP";
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    if (_formKey1.currentState!
                                                        .validate()) {
                                                      AuthService.loginWithOtp(
                                                              otp: _otpContoller
                                                                  .text)
                                                          .then((value) {
                                                        if (value ==
                                                            "Success") {
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          HomePage()));
                                                        } else {
                                                          Navigator.pop(
                                                              context);
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            content: Text(
                                                              value,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            backgroundColor:
                                                                Colors.red,
                                                          ));
                                                        }
                                                      });
                                                    }
                                                  },
                                                  child: Text("Submit"))
                                            ],
                                          ));
                                });
                          }
                        },
                        child: Text("Send OTP"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            foregroundColor: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
