import 'package:allinonecalc/calculators/Bmi_Page.dart';
import 'package:allinonecalc/calculators/age_calc.dart';
import 'package:allinonecalc/calculators/emicalculator.dart';
import 'package:allinonecalc/calculators/gst_cal.dart';
import 'package:allinonecalc/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: mainBody(),
    //  backgroundColor: Styles.mainColor,
    ));
  }

  Widget mainBody(){
    return Container(

      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/logo.png",height: 300,),
          Expanded(child: Container(
            padding: EdgeInsets.all(15),
            decoration:  BoxDecoration(
              color: Styles.mainColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      button("assets/bmi.png","BMI calculator",(){
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>Bmi_Page()));


                      }),
                      button("assets/gst.png","GST Calculator",(){
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>GstCalc()));

                      }),
                    ],
                  ),
                ),
                
                Expanded(
                  child: Column(
                    children: [
                      button("assets/emi.png","EMI calculator",(){

                        print("call");
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>EmiCalculator()));

                      }),

                      button("assets/cal.png","Age calculator",(){

                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>AgeCalc()));
                      }),
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget button(String icon,String str,Function callback){
    return Expanded(
      child: InkWell(
        onTap: ()=>callback(),
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          width: double.maxFinite,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(icon,height: 50,),
                Text(str),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
