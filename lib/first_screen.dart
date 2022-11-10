import 'package:flutter/material.dart';
import 'package:navigation_and_routing/main.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 246, 252),
      appBar: AppBar(
        title: Text('Navigation & Routing'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Button 1
            ElevatedButton (
              onPressed: () {
                Navigator.pushNamed(context, '/secondScreen'); 
              },
              child: Text('Go to Second Screen'), //Text dalam Button
            ),

            SizedBox(height: 10),

            ElevatedButton(onPressed:() {
              Navigator.pushNamed(context, '/secondScreenWithData',
              arguments: 'Hello Besti, This is from Frist Screen');
            },
            child: Text('Navigation With data'),
            ),

            //button 2
            ElevatedButton(
              onPressed: () async {
                final scaffoldMessenger = ScaffoldMessenger.of(context);

                final result = await Navigator.pushNamed(context, '/returnDataScreen');

                SnackBar snackBar = SnackBar(content: Text('Nama Anda $result'));
                scaffoldMessenger.showSnackBar(snackBar);
              },
              child: Text('Return Data from Another Screen'), //Text dalam Button
            ),

            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/replacementScreen');
              },
              child: Text('Replace Screen'), //Text dalam Button
            ),
          ],
        ),
      ),
    );
  }
}