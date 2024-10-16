
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Bottombar.dart';
import '../../Services/login_api.dart';
import 'Register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String email = '';
    String password = '';
    final ApiClient apiClient = ApiClient();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 216, 91, 53),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Welcome',
                  style: GoogleFonts.encodeSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 44,
                          color: Colors.white)),
                ),
                SizedBox(height: 5), //
                Text(
                  'to',
                  style: GoogleFonts.encodeSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 44,
                          color: Colors.white)),
                ),
                SizedBox(height: 10),
                Text(
                  'Wings and Tails',
                  style: GoogleFonts.encodeSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                          color: Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    "Log in to your account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Welcome back! Please enter your details.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.white),
                ),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20),
                //         ),
                //         enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20),
                //           borderSide: BorderSide(color: Colors.white),
                //         ),
                //         focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20),
                //           borderSide: BorderSide(color: Colors.white),
                //         ),
                //         labelText: 'Email',
                //         labelStyle: TextStyle(color: Colors.white)),
                //   ),
                // ),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //          borderRadius: BorderRadius.circular(20),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //         borderSide: BorderSide(
                //             color: Colors.white), // Border when not focused
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //         borderSide: BorderSide(
                //             color: Colors.white), // Border when focused
                //       ),
                //       labelText: 'Password',
                //       labelStyle: TextStyle(color: Colors.white),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Phone',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                  color: Colors
                                      .white), // Border color when focused
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                  color: Colors.white), // White border on error
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            errorStyle: TextStyle(color: Colors.white),
                            isDense: true,
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                          onChanged: (value) {
                            email = value;
                          },
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Otp',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                  color: Colors.white), // White border on error
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                  color: Colors
                                      .white), // White border when focused and error
                            ),
                            errorStyle: TextStyle(color: Colors.white),
                          ),
                          obscureText: true,
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                          onChanged: (value) {
                            password = value;
                          },
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          height: 45,
                          width: 300,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    final response =
                                        await apiClient.login(email, password);
                                    if (response['status'] == 'success') {
                                      print(response['message']);
                                    } else {
                                      print('Login failed');
                                    }
                                  } catch (e) {
                                    print('Error Occured: $e');
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Bottombar()));
                                }
                                ;
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.deepOrange),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 70),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Row(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "SignUp",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
