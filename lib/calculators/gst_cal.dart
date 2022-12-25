import 'package:flutter/material.dart';

String Op = '0';
double Fp = 0;
double _Fp = 0;
double ans = 0;

Color white3 = Color(0xffffffff);
Color white5 = Color(0xffffffff);
Color white12 = Color(0xffffffff);
Color white18 = Color(0xffffffff);
Color white28 = Color(0xffffffff);

class GstCalc extends StatefulWidget {
  const GstCalc({Key? key}) : super(key: key);

  @override
  _GstCalcState createState() => _GstCalcState();
}

class _GstCalcState extends State<GstCalc> {
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
        title: const Text("Gst Calculator"),
        elevation: 0,
      ),
      body: Column(
        children: [


          Row(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: RichText(
                  text: const TextSpan(
                    text: "ORIGINAL PRICE",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff4f4f4f),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 8, left: 130),
                child: RichText(
                  text: TextSpan(
                    text: "$Op Rs.",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff4f4f4f),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: 100,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                color: const Color(0xffeeeeee),
                padding: const EdgeInsets.only(top: 10, left: 20),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 10, left: 20),
                child: const Text(
                  "GST",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff4f4f4f),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40, left: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {

                          if(white3 == Color(0xffffffff)){
                            white3 =  Color(0xffff6b00);
                          }
                          else{
                            white3 = Color(0xffffffff);
                          }

                          Fp = (((int.parse(Op) * 3) / 100))
                              .toDouble();
                          ans = Fp / 2;
                          _Fp = (Fp + int.parse(Op));

                        });
                      },
                      child: Text(
                        "3%",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: white3,
                        elevation: 0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {

                          if(white5 == Color(0xffffffff)){
                            white5 =  Color(0xffff6b00);
                          }
                          else{
                            white5 = Color(0xffffffff);
                          }

                          Fp = (((int.parse(Op) * 5) / 100))
                              .toDouble();
                          ans = Fp / 2;
                          _Fp = (Fp + int.parse(Op));
                        });
                      },
                      child:  Text(
                        "5%",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: white5,
                        elevation: 0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {

                          if(white12 == Color(0xffffffff)){
                            white12 =  Color(0xffff6b00);
                          }
                          else{
                            white12 = Color(0xffffffff);
                          }

                          Fp = (((int.parse(Op) * 12) / 100))
                              .toDouble();
                          ans = Fp / 2;
                          _Fp = (Fp + int.parse(Op));
                        });
                      },
                      child: Text(
                        "12%",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: white12,
                        elevation: 0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {

                          if(white18 == Color(0xffffffff)){
                            white18 =  Color(0xffff6b00);
                          }
                          else{
                            white18 = Color(0xffffffff);
                          }

                          Fp = (((int.parse(Op) * 18) / 100))
                              .toDouble();
                          ans = Fp / 2;
                          _Fp = (Fp + int.parse(Op));
                        });
                      },
                      child: Text(
                        "18%",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: white18,
                        elevation: 0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {

                          if(white28 == Color(0xffffffff)){
                            white28 =  Color(0xffff6b00);
                          }
                          else{
                            white28 = Color(0xffffffff);
                          }

                          Fp = (((int.parse(Op) * 28) / 100))
                              .toDouble();
                          ans = Fp / 2;
                          _Fp = (Fp + int.parse(Op));
                        });
                      },
                      child: Text(
                        "28%",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: white28,
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 35),
          Stack(
            children: [
              Container(
                height: 40,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                color: const Color(0xffeeeeee),
                padding: const EdgeInsets.only(top: 10, left: 20),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: RichText(
                      text: const TextSpan(
                        text: "FINAL PRICE",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4f4f4f),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: "$_Fp Rs.",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4f4f4f),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 35),
          Stack(
            children: [
              Container(
                height: 80,
                width: 280,
                decoration: BoxDecoration(
                  color: Color(0xffeeeeee),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 17, left: 80),
                    child: const Text(
                      "CGST/SGST",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 80),
                    child: Text(
                      "$ans",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff4f4f4f),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 35),

          //calculator
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 15),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 5),
                        MyButton("7"),
                        const SizedBox(width: 30),
                        MyButton("8"),
                        const SizedBox(width: 30),
                        MyButton("9"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 5),
                        MyButton("4"),
                        const SizedBox(width: 30),
                        MyButton("5"),
                        const SizedBox(width: 30),
                        MyButton("6"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 5),
                        MyButton("1"),
                        const SizedBox(width: 30),
                        MyButton("2"),
                        const SizedBox(width: 30),
                        MyButton("3"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        MyButton("00"),
                        const SizedBox(width: 30),
                        MyButton("0"),
                        const SizedBox(width: 30),
                        MyButton("."),
                      ],
                    ),
                  ],
                ),
                height: 350,
              ),
              const SizedBox(width: 10),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Op = "0";
                          _Fp = 0;
                          ans = 0;
                        });
                      },
                      child: Ink(
                        child: Container(
                          alignment: Alignment.center,
                          height: 150,
                          width: 70,
                          child: const Text(
                            "AC",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color(0xffff6b00),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Op = Op.substring(
                              0, Op.length - 1);
                        });
                      },
                      child: Ink(
                        child: Container(
                          height: 150,
                          width: 70,
                          child: Icon(Icons.backspace_outlined, color: Colors
                              .white),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color(0xffff6b00),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
                height: 350,
                width: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget MyButton(String num) {
    return FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.white,
        child: Text(
          num,
          style: const TextStyle(
            fontSize: 28,
            color: Colors.black,
          ),
        ),
        onPressed: () {
          setState(() {
            if (Op == "0") {
              Op = num;
            } else {
              Op = "$Op$num";
            }
          });
        });
  }
}
