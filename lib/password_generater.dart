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
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextFormField(
                  onChanged: (value) {
                    x = int.parse(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter correct value.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your desired length to produce password",
                      label: const Text("Enter max length"),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.zero, right: Radius.zero),
                          borderSide: BorderSide(
                              width: 100,
                              style: BorderStyle.solid,
                              color: Colors.black))),
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
