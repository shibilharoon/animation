// ignore_for_file: non_constant_identifier_names

import 'package:animation/Page/initial_page.dart';
import 'package:animation/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final Language = ["en", "ml", "hi"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          DropdownButton(
            underline: const SizedBox(),
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.language,
                color: Colors.white,
              ),
            ),
            items: Language.map((e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                )).toList(),
            onChanged: (language) {
              if (language != null) {
                MyApp.setLocale(context, Locale(language));
              }
            },
          )
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
        child: Column(
          children: [
            Image.asset(
              "Assets/images/logo_porsche-removebg-preview.png",
              height: 200,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.username,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.password,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 10,
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => const InitialPage())));
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ))
          ],
        ),
      )),
    );
  }
}
