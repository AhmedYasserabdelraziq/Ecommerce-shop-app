import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var enteredEmail = '';
  var username = '';
  var enteredPassword = '';
  var isLogin = true;
  var isShow = false;
  var isAuthentication = false;

  void onSubmit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    try {
      setState(() {
        isAuthentication = true;
      });
      if (isLogin) {
        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: enteredEmail, password: enteredPassword);
      } else {
        var userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: enteredEmail, password: enteredPassword);
        await FirebaseFirestore.instance
            .collection("user")
            .doc(userCredentials.user!.uid)
            .set({
          'username': username,
          'email': enteredEmail,
          'password': enteredPassword
        });
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {}
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(error.message ?? "Authentication failed")));
      setState(() {
        isAuthentication = false;
      });
      print(enteredPassword);

      print(enteredEmail);
    }
  }

//Color(0xff5433eb)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 110.0),
        child: Column(
          children: [
            Expanded(
              child: Image.asset("assets/img_2.png"),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            !value.contains('@')) {
                          return 'please entre a valid email address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        enteredEmail = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      decoration: InputDecoration(
                        label: const Text(
                          'email Address',
                          //style: TextStyle(color:Theme.of(context).colorScheme.primary),
                        ),
                        prefixIcon: const Icon(Icons.account_circle_outlined),
                        prefixIconColor: Theme.of(context).colorScheme.primary,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                        //   borderRadius: const BorderRadius.all(
                        //     Radius.circular(25),
                        //   ),
                        // ),
                      ),
                      //style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (!isLogin)
                      TextFormField(
                        enableSuggestions: false,
                        decoration: const InputDecoration(
                          label: Text('Username'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length < 4) {
                            return 'Please entre a valid Username';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          username = value!;
                        },
                      ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isShow = !isShow;
                            });
                          },
                          icon: Icon(
                              isShow ? Icons.visibility : Icons.visibility_off,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        label: const Text(
                          'Password',
                          //style: TextStyle(color: Colors.white),
                        ),
                        prefixIconColor: Theme.of(context).colorScheme.primary,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        // focusedBorder: const OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.white),
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(25),
                        //   ),
                        // ),
                      ),
                      // style: const TextStyle(color: Colors.white),
                      obscureText: isShow ? false : true,
                      validator: (value) {
                        if (value == null || value.trim().length < 6) {
                          return 'password must be at least 6 characters long.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        enteredPassword = value!;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (isAuthentication) const CircularProgressIndicator(),
                    if (!isAuthentication)
                      ElevatedButton(
                        onPressed: onSubmit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                        ),
                        child: Text(isLogin ? 'Login' : 'Signup'),
                      ),
                    if (!isAuthentication)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Text(
                          isLogin
                              ? 'Create an account'
                              : 'I already have an account',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
