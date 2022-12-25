
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class AgeCalc extends StatefulWidget {
  const AgeCalc({Key? key}) : super(key: key);

  @override
  _AgeCalcState createState() => _AgeCalcState();
}

class _AgeCalcState extends State<AgeCalc> {
  String DD = '';
  String MM = '';
  String YY = '';

  int date = 0;
  String month = "0";
  int year = 0;

  String finalDate = '00';
  String finalMonth = '00';
  String finalYear = '00';

  String nextDate = '00';
  String nextMonth = '00';

  TextEditingController dateController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();


  @override
  void initState(){
    super.initState();
    DateTime dateTime = DateTime.now();

    setState(() {
      date = dateTime.day;
      month = DateFormat.MMM().format(dateTime);
      year = dateTime.year;
    });
  }


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
        title: const Text("Age Calculator"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 22, bottom: 10),
                    child: Text(
                      "Today's Date",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 11, left: 20),
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "$date  $month, $year",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff1c003e),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 22, bottom: 10),
                    child: Text(
                      "Date Of Birth",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: TextField(
                      controller: dateController,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff1c003e),
                        fontWeight: FontWeight.w700,
                      ),
                      onChanged: (n) {
                        setState(() {
                          DD = n;
                        });
                      },
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.grey,
                      cursorWidth: 2,
                      cursorHeight: 25,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        hintText: "DD",
                        hintStyle: const TextStyle(
                            fontSize: 22,
                            color: Color(0xffe5e5e5),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    height: 50,
                    width: 105,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 105,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: monthController,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff1c003e),
                        fontWeight: FontWeight.w700,
                      ),
                      onChanged: (n) {
                        setState(() {
                          MM = n;
                        });
                      },
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.grey,
                      cursorWidth: 2,
                      cursorHeight: 25,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        hintText: "MM",
                        hintStyle: const TextStyle(
                            fontSize: 22,
                            color: Color(0xffe5e5e5),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 105,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: yearController,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff1c003e),
                        fontWeight: FontWeight.w700,
                      ),
                      onChanged: (n) {
                        setState(() {
                          YY = n;
                        });
                      },
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.grey,
                      cursorWidth: 2,
                      cursorHeight: 25,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        hintText: "YYYY",
                        hintStyle: const TextStyle(
                            fontSize: 22,
                            color: Color(0xffe5e5e5),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {
                      dateController.clear();
                      monthController.clear();
                      yearController.clear();

                      setState(() {
                        DD = '';
                        MM = '';
                        YY = '';

                        finalDate = '00';
                        finalMonth = '00';
                        finalYear = '00';

                        nextDate = '00';
                        nextMonth = '00';
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Clear all data..."),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 165,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff13547a)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Clear",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  InkWell(
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {
                      DD = dateController.text;
                      MM = monthController.text;
                      YY = yearController.text;


                      setState(() {
                        finalDate = "${date-int.parse(DD)}";
                        DateTime dateTime = DateTime.now();
                        month = dateTime.month.toString();
                        finalMonth = "${int.parse(month)+int.parse(MM)-6}";
                        finalYear = "${year-int.parse(YY)}";

                        nextDate = "${date-(date-int.parse(DD))}";
                        nextMonth = "${int.parse(MM)-int.parse(month)}";


                        if(date-int.parse(DD)<0)
                        {
                          finalMonth = "${(int.parse(month)+int.parse(MM))-6}";
                          finalDate = "${30+(date-int.parse(DD))}";
                        }
                        month = DateFormat.MMM().format(dateTime);
                      });
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Color(0xff13547a),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 165,
                        child: const Text(
                          "Calculate",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 22, bottom: 10),
                    child: Text(
                      "Present Age",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 130,
                    width: 350,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff13547a), Color(0xff203a43)],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        Text(
                          "\t\t$finalYear\nYear",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "\t$finalMonth\nMM",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "$finalDate\nDD",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 22, bottom: 10),
                    child: Text(
                      "Next Birthday",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 130,
                    width: 350,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xff6BBED9), Color(0xff006ACB)],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "\t$nextMonth\nMM",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "$nextDate\nDD",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
