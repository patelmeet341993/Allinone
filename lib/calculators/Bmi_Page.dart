import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bmi_result_page.dart';


class Bmi_Page extends StatefulWidget {
  const Bmi_Page({Key? key}) : super(key: key);

  @override
  State<Bmi_Page> createState() => _Bmi_PageState();
}

class _Bmi_PageState extends State<Bmi_Page> with TickerProviderStateMixin {
  Color mcolor = Colors.white;
  Color fcolor = Colors.white;

  double BMI = 0;

  double slider = 50;

  int w = 0;
  int a = 0;

  late AnimationController animationController1;
  late AnimationController animationController2;
  late AnimationController animationController3;

  @override
  void initState() {
    super.initState();
    animationController1 = AnimationController(
      lowerBound: -100,
      upperBound: 1,
      duration: Duration(seconds: 1),
      vsync: this,
    )..forward().then((value) {
      setState(() {});
    });

    animationController2 = AnimationController(
      lowerBound: -10,
      upperBound: 0,
      duration: Duration(seconds: 1),
      vsync: this,
    )..forward().then((value) {
      setState(() {});
    });

    animationController3 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    )..forward().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff272c4f),
      appBar: AppBar(
        backgroundColor: Color(0xff272c4f),
        elevation: 0,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 25, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                w = 0;
                a = 0;
                slider = 50;
                mcolor = Colors.white;
                fcolor = Colors.white;
              });
            },
            icon: Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedBuilder(
                        animation: animationController1,
                        builder: (BuildContext context, Widget? child) {
                          return Transform.translate(
                            offset: Offset(animationController1.value,
                                animationController1.value * 0),
                            child: child,
                          );
                        },
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (mcolor == Colors.white) {
                                setState(() {
                                  mcolor = Color(0xfff90363);
                                });
                              } else {
                                setState(() {
                                  mcolor = Colors.white;
                                });
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.male,
                                  size: 80,
                                  color: mcolor,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "MALE",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      AnimatedBuilder(
                        animation: animationController2,
                        builder: (BuildContext context, Widget? child) {
                          return Transform.translate(
                            offset: Offset(animationController2.value * -30,
                                animationController2.value * 0),
                            child: child,
                          );
                        },
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (fcolor == Colors.white) {
                                setState(() {
                                  fcolor = Color(0xfff90363);
                                });
                              } else {
                                setState(() {
                                  fcolor = Colors.white;
                                });
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.female,
                                  size: 80,
                                  color: fcolor,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "FEMALE",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedBuilder(
                    animation: animationController2,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.translate(
                        offset: Offset(animationController2.value * -30,
                            animationController2.value * 0),
                        child: child,
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 25, left: 25),
                      child: Container(
                        height: 190,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'HEIGHT',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${slider.toInt()}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "cm",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Slider(
                              max: 250,
                              min: 50,
                              onChanged: (val) {
                                setState(() {
                                  slider = val;
                                });
                              },
                              thumbColor: const Color(0xfff90363),
                              inactiveColor: Colors.grey,
                              activeColor: const Color(0xfff90363),
                              value: slider,
                            ),
                          ],
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedBuilder(
                        animation: animationController1,
                        builder: (BuildContext context, Widget? child) {
                          return Transform.translate(
                            offset: Offset(animationController1.value,
                                animationController1.value * 0),
                            child: child,
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "WEIGHT",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Text(
                                "${w}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        w++;
                                      });
                                    },
                                    child: Container(
                                      child: Icon(
                                        Icons.add,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xff272c4f),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      if (w > 0) {
                                        setState(() {
                                          w--;
                                        });
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AnimatedBuilder(
                                                animation: animationController2,
                                                builder: (BuildContext context,
                                                    Widget? child) {
                                                  return Transform.scale(
                                                    scale: 1,
                                                    child: Center(
                                                      child: Container(
                                                        alignment:
                                                        Alignment.center,
                                                        height: 35,
                                                        width: 150,
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                          color: Colors.black,
                                                        ),
                                                        child: const Text(
                                                          "Wrong\tArgument",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.white,
                                                            decoration:
                                                            TextDecoration
                                                                .none,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            });
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment(0, -1),
                                      child: Icon(
                                        Icons.minimize,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xff272c4f),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedBuilder(
                        animation: animationController2,
                        builder: (BuildContext context, Widget? child) {
                          return Transform.translate(
                            offset: Offset(animationController2.value * -30,
                                animationController2.value * 0),
                            child: child,
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "AGE",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Text(
                                "${a}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        a++;
                                      });
                                    },
                                    child: Container(
                                      child: Icon(
                                        Icons.add,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xff272c4f),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      if (a > 0) {
                                        setState(() {
                                          a--;
                                        });
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AnimatedBuilder(
                                                animation: animationController2,
                                                builder: (BuildContext context,
                                                    Widget? child) {
                                                  return Transform.scale(
                                                    scale: 1,
                                                    child: Center(
                                                      child: Container(
                                                        alignment:
                                                        Alignment.center,
                                                        height: 35,
                                                        width: 150,
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                          color: Colors.black,
                                                        ),
                                                        child: const Text(
                                                          "Wrong\tArgument",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.white,
                                                            decoration:
                                                            TextDecoration
                                                                .none,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            });
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment(0, -1),
                                      child: Icon(
                                        Icons.minimize,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xff272c4f),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){

                if(w==0 || a==0){
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AnimatedBuilder(
                          animation: animationController2,
                          builder: (BuildContext context,
                              Widget? child) {
                            return Transform.scale(
                              scale: 1,
                              child: Center(
                                child: Container(
                                  alignment:
                                  Alignment.center,
                                  height: 35,
                                  width: 220,
                                  decoration:
                                  BoxDecoration(
                                    borderRadius:
                                    BorderRadius
                                        .circular(5),
                                    color: Colors.black,
                                  ),
                                  child: const Text(
                                    "Please\tselect\tall\tInputs",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      decoration:
                                      TextDecoration
                                          .none,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      });
                }
                else{
                  BMI = (w / slider / slider)*10000;

                  Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>Bmi_result_page(BMI.roundToDouble())));
                }

              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                color: Color(0xfff90363),
                child: Text(
                  "CALCULATE YOUR BMI",
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
    );
  }
}