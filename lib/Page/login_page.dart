import 'package:animation/Page/home_screen.dart';
import 'package:animation/Page/initial_page.dart';
import 'package:animation/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  final Language = ["en", "ml", "hi"];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          DropdownButton(
            underline: SizedBox(),
            icon: Icon(Icons.language),
            items: Language.map((e) => DropdownMenuItem<String>(
                  child: Text(e),
                  value: e,
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
            Image.asset("Assets/images/logo_porsche-removebg-preview.png"),
            TextField(
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.username,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
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
            SizedBox(
              height: 10,
            ),
            IconButton.filled(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => InitialPage())));
                },
                icon: Icon(
                  Icons.home,
                ))
          ],
        ),
      )),
    );
  }
}
