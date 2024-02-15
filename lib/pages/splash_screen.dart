import 'package:empire/pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:empire/components/button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

//Switching to homepage

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initstate() {
  //   super.initState();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  //   Future.delayed(const Duration(seconds: 5), () {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (_) => const LoginPage(),
  //       ),
  //     );
  //   });
  // }

  //ADD BUTTON TO GO TO LOGIN PAGE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.yellow],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // child: RaisedButton(
          //   child: Text("Enter Arena"),
          //   Color(Colors.black),
          //   onPressed(){
          //     Navigator.push(context, MertialPageRoute(builder: (context)=>LoginPage()));
          //   }
          // )
          children: [
            Icon(
              Icons.account_box,
              size: 75,
              color: Colors.black,
            ),
            SizedBox(height: 25),
            Text(
              "Welcome to Empire",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
