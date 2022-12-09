import 'package:flutter/material.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(40),
            children: [
              ListTile(
                title: Text("Home",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber)),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/');
                },
              ),
              ListTile(
                title: const Text(
                  "Weather",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/weather');
                },
              ),
              ListTile(
                title: const Text(
                  "Calculator",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/calc');
                },
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
                child: Text("Welcome  to My Flutter Project",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
            Image.asset(
              "assets/images/welcomeimage.jpg",
              height: 300,
              width: 300,
            )
          ],
        ),
      ),
    );
  }
}
