import 'package:flutter/material.dart';

class Bmi_result_page extends StatefulWidget {
  double bmi;

  Bmi_result_page(this.bmi);

  @override
  State<Bmi_result_page> createState() => _Bmi_result_pageState();
}

class _Bmi_result_pageState extends State<Bmi_result_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff272c4f),
      appBar: AppBar(
        backgroundColor: Color(0xff272c4f),
        elevation: 0,
        leading: Container(),
        title: Text(
          "Your BMI Result",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 25, color: Colors.white),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  (widget.bmi <= 18.5)
                      ? const Text(
                    "UNDER WEIGTH",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.orangeAccent),
                  )
                      : (widget.bmi > 18.5 && widget.bmi <= 25.30)
                      ? const Text(
                    "NORMAL WEIGTH",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.green),
                  )
                      : (widget.bmi > 25.30 && widget.bmi<=30)
                      ? const Text(
                    "OVER WEIGTH",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.orangeAccent),
                  )
                      : const Text(
                    "OBESE",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.red),
                  ),
                  Text(
                    "${widget.bmi}",
                    style: TextStyle(
                        fontSize: 75,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  (widget.bmi <= 18.5)
                      ? const Text(
                    "You have a under weight, you\n     sholud become Healthy",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )
                      : (widget.bmi > 18.5 && widget.bmi <= 25.30)
                      ? const Text(
                    "You have a normal body\n      weight Good Job",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )
                      : (widget.bmi > 25.30 && widget.bmi<=30)
                      ? const Text(
                    "You have over weight, you\n         need to exercise",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )
                      : const Text(
                    "You have obese body, you\n           must exercise",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )

                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xfff90363),
                  child: Text(
                    "RE-CALCULATE",
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}