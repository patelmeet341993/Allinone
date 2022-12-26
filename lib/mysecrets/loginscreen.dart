import 'package:allinonecalc/mysecrets/chatscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showLogin=true;

  Future<void> getLogOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
       Navigator.pop(context);

    } catch (e) {}
  }


  Future<void> getLogin() async {
    try {
      GoogleSignInAccount? account = await GoogleSignIn().signIn();
      if (account == null) {
        print("not login with any accpunt");
      } else {
        print("login with google");


        GoogleSignInAuthentication auth = await account.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: auth.accessToken, idToken: auth.idToken);
        UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(credential);

        User user=userCredential.user!;
        DocumentSnapshot snapshot=await FirebaseFirestore.instance.collection("allowusers").doc(user.uid).get();
        if(snapshot==null)
          {
            print("null");
            showLogin=true;
            setState(() {

            });
          }
        else
          {
            Map<dynamic,dynamic> data=snapshot.data() as Map;
            if(data["allow"])
              {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChatScreen(user: userCredential.user!,)));

              }
            else {
              print("not allow");
            }
          }
        

      }
    } catch (e) {
      print("Error : $e");
      showLogin=false;
      setState(() {

      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: showLogin,
                child: InkWell(
                  onTap: (){
                    getLogin();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text("Login",style: TextStyle(fontSize: 20),),
                  ),
                ),
              ),
              Visibility(
                visible: !showLogin,
                child: InkWell(
                  onTap: (){
                    getLogOut();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text("Log out",style: TextStyle(fontSize: 20),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
