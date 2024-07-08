import 'dart:math';

import 'package:flutter/material.dart';

class RandomPasswordGenerater extends StatefulWidget {
  const RandomPasswordGenerater({super.key});

  @override
  State<RandomPasswordGenerater> createState() =>
      _RandomPasswordGeneraterState();
}

class _RandomPasswordGeneraterState extends State<RandomPasswordGenerater> {
  final _key = GlobalKey<FormState>();
  int? x;
  String password = "";
  final random = Random();
  final letters =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890.*|!,/=_+){}\$(%^&-'`~?#!@";
  void generatePassword(int t) {
    for (int i = 0; i < t; i++) {
      password += letters[random.nextInt(letters.length)];
      setState(() {
        password = password;
      });
    }
  }

  void clearPassword() {
    setState(() {
      password = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).cardColor,
        title: Text("Strong Random Password Generator",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      ),
      body: Form(
        key: _key,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (value) {
                  x = int.parse(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter correct value.";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text("Enter max length"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Your Password : ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                password,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7,
              ),
              TextButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      clearPassword();
                      generatePassword(x!);
                    }
                  },
                  child: const Text(
                    "Generate Password",
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
