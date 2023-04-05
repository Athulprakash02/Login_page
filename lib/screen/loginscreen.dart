import 'package:first_try/main.dart';
import 'package:first_try/screen/homescreen.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isDatamatched = true;

  final _formKey = GlobalKey<FormState>();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 241, 238),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 238, 241, 238),
                ),

                // ignore: prefer_const_constructors
                child: Opacity(
                  opacity: 0.2,
                  child: const Image(
                    image: AssetImage(
                      'assets/images/WhatsApp Image 2023-03-06 at 10.40.25 AM.jpeg',
                    ),
                    fit: BoxFit.cover,
                    // height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 251, 236, 99),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                  ),
                  width: double.infinity,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        ),
                        // Container(
                        //     //  color: Colors.red,
                        //     ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                          child: TextFormField(

                            controller: _usernameController,
                           style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: 'Username',
                              
                            ),
                            validator: (value) {
                              
                              // if (_isDatamatched) {
                              //   return null;
                              // } else {
                              //   return 'Error';
                              // }
                              if(value == null || value.isEmpty){
                                return 'Enter username';
                              }else{
                                return null;
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: 'Password',
                            ),
                            validator: (value) {
                              // if (_isDatamatched) {
                              //   return null;
                              // } else {
                              //   return 'Error';
                              // }

                              if(value == null || value.isEmpty){
                                return 'Enter password';
                              }else{
                                return null;
                              }
                            },
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: !_isDatamatched,
                              child: const Text(
                                'Username and Password does not match',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),

                            
                            ElevatedButton.icon(
                              onPressed: () {
                                if(_formKey.currentState!.validate()){
                                  checkLogin(context);
                                }
                                // var _userName = _usernameController.text;
                                // var _pswrd = _passwordController.text;
                                //  if(_userName.isNotEmpty && _pswrd.isNotEmpty){
                                //   checkLogin(context);
                                //  }
                              },
                              icon: const Icon(Icons.login),
                              label: const Text('Login'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async{
    final _username = _usernameController.text;
    final _password = _passwordController.text;

  
    if ((_username == userName) && (passWord == _password) ) {
      //Goto Home

      final _sharedPref = await SharedPreferences.getInstance();
      await _sharedPref.setBool(SAVE_KEY_NAME, true);
      // ignore: use_build_context_synchronously
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ));
    } else {
      final _errorMessage = 'Username and password does not match';
      // snackbar

      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          backgroundColor: const Color.fromARGB(255, 196, 45, 21),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
          content: Text(_errorMessage)));

      // showDialog(

      //   context: ctx,
      //   builder: (ctx1) {
      //     return AlertDialog(
      //       titleTextStyle: TextStyle(
      //         color: Color.fromARGB(255, 255, 0, 0),
      //         fontSize: 30,
      //         fontWeight: FontWeight.bold,
      //       ),
      //       title: Text('Error'),
      //       content: Text(_errorMessage),
      //       actions: [
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(ctx1).pop();
      //           },
      //           child: Text('Close'),
      //         ),
      //       ],
      //     );
      //   },
      // );

      //show text
      // setState(() {
      //   _isDatamatched = false;
      // });
    }
  }
}
