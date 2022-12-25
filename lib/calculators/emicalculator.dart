import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
class EmiCalculator extends StatefulWidget {
  const EmiCalculator({Key? key}) : super(key: key);

  @override
  _EmiCalculatorState createState() => _EmiCalculatorState();
}

class _EmiCalculatorState extends State<EmiCalculator> {
  double EMI = 0;

  final formatCurrency = new NumberFormat.simpleCurrency();

  TextStyle titlestyle = const TextStyle(
    fontSize: 25,
    color: Color(0xff484848),
    fontWeight: FontWeight.w500,
  );

  TextStyle bgstyle = const TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: Color(0xffe5e6e8),
    letterSpacing: 2,
  );

  double loanamountsliderval = 1000;
  double interestRatesliderval = 1;
  double loanTenuresliderval = 1;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
        backgroundColor: const Color(0xff20295c),
        centerTitle: true,
        title: const Text("EMI Calculator"),
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: const Color(0xff20295c),
            height: double.infinity,
          ),
          Column(
            children: [
              SizedBox(height: 20,),
              const Text(
                "Your Loan EMI is",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "₹ ${EMI}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: "/ Month",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Expanded(
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      myWidget("Loan Amount", loanamountsliderval, 1, 1000000, 0),
                      myWidget("Interest Rate", interestRatesliderval, 1, 12, 1),
                      myWidget("Loan Tenure", loanTenuresliderval, 1, 30, 2),

                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          primary: Colors.deepPurpleAccent,
                          backgroundColor: const Color(0xffe7eaff),
                          side: const BorderSide(
                            color: Color(0xff20295c),
                          ),
                        ),
                        child: const Text(
                          "Calculate",
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff2c3568),
                          ),
                        ),
                        onPressed: () {



                          double rate = interestRatesliderval;
                          double amount=loanamountsliderval;
                          double time=loanTenuresliderval;

                          print("Rate : $rate");
                          print("Amount : $loanamountsliderval");
                          print("Ten : ${loanTenuresliderval.toInt()}");


                          rate=rate/(12*100);
                          time=time*12;

                          double emi = amount *
                              rate *
                              (pow(1 + rate, time) /
                                  (pow(1 + rate, time) - 1));

                          setState(() {
                            EMI = emi.toInt().toDouble();
                          });
                          print("$EMI");
                        },
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget myWidget(
      String heading, double sliderval, double _min, double _max, int i) {
    return Column(
      children: [
        Text("$heading", style: titlestyle),
        Stack(
          alignment: Alignment.center,
          children: [
           // Text("$heading", style: bgstyle),
            (i == 1)
                ? Text(
              "${sliderval.toInt()} %",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            )
                : (i==2)?Text(
              "${sliderval.toInt()} Years",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ):
            (i==0)?Text(
              "${formatCurrency.format(sliderval.toInt())}",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ):Text(
              "${sliderval.toInt()}",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        Slider(
          value: sliderval,
          min: _min,
          max: _max,
          onChanged: (val) {
            setState(() {
              if (i == 0) {
                loanamountsliderval = val;
                sliderval = val;
              } else if (i == 1) {
                interestRatesliderval = val;
                sliderval = val;
              } else if (i == 2) {
                loanTenuresliderval = val;
                sliderval = val;
              }
            });
          },
          thumbColor: const Color(0xff12205a),
          activeColor: const Color(0xffbecce8),
          inactiveColor: const Color(0xffbecce8),
        ),
      ],
    );
  }
}
