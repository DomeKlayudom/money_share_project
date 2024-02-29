// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_share_project/views/show_money_share_ui.dart';

class InputMoneyUI extends StatefulWidget {
  const InputMoneyUI({super.key});

  @override
  State<InputMoneyUI> createState() => _InputMoneyUIState();
}

class _InputMoneyUIState extends State<InputMoneyUI> {
  bool? checkStatus = false;
  TextEditingController moneyInput = TextEditingController(text: '');
  TextEditingController personInput = TextEditingController(text: '');
  TextEditingController tipInput = TextEditingController(text: '');

  warningMessage(context, msg) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Colors.red,
              width: 2.0,
            ),
          ),
          child: Center(
            child: Text(
              'คำเตือน',
              style: GoogleFonts.kanit(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        content: Text(
          msg,
          style: GoogleFonts.kanit(
            color: Colors.red,
          ),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
              )
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
              style: GoogleFonts.kanit(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'แชร์เงินกันเถอะ',
          style: GoogleFonts.kanit(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 35, right: 35),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.2,
                    backgroundColor: Colors.red,
                    child: Image.asset(
                      'assets/images/money.png',
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextField(
                    controller: moneyInput,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^[0-9]+.?[0-9]*'),
                      ),
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'ป้อนจำนวนเงิน (บาท)',
                      hintStyle: GoogleFonts.kanit(color: Colors.grey[200]),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBill1Wave,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextField(
                    controller: personInput,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"\d+([\.]\d+)?"),
                      ),
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'ป้อนจำนวนคน (คน)',
                      hintStyle: GoogleFonts.kanit(color: Colors.grey[200]),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        onChanged: (value) {
                          setState(
                            () {
                              checkStatus = value;
                              if (value == false) {
                                tipInput.text = '';
                              }
                            },
                          );
                        },
                        value: checkStatus,
                        activeColor: Colors.red,
                        side: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'เงินทิป (บาท)',
                        style: GoogleFonts.kanit(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextField(
                    controller: tipInput,
                    enabled: checkStatus,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                      hintStyle: GoogleFonts.kanit(color: Colors.grey[200]),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBillTrendUp,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            double money = 0, tip = 0, moneyshare = 0;
                            int person = 0;
                            if (moneyInput.text.isEmpty) {
                              warningMessage(context, 'ป้อนเงินด้วย');
                              return;
                            } else if (double.parse(moneyInput.text) == 0) {
                              warningMessage(context, 'เงินไม่ควรเป็น 0');
                              return;
                            } else if (personInput.text.isEmpty) {
                              warningMessage(context, 'ป้อนคนด้วย');
                              return;
                            } else if (int.parse(personInput.text) == 0) {
                              warningMessage(context, 'คนไม่ควรเป็น 0');
                              return;
                            } else if (checkStatus == true) {
                              if (tipInput.text.isEmpty) {
                                warningMessage(context, 'ป้อนทิปด้วย');
                                return;
                              } else if (double.parse(tipInput.text) == 0) {
                                warningMessage(context, 'ทิปไม่ควรเป็น 0');
                                return;
                              } else {
                                money = double.parse(moneyInput.text);
                                tip = double.parse(tipInput.text);
                                person = int.parse(personInput.text);
                                moneyshare = (money + tip) / person;
                              }
                            } else {
                              money = double.parse(moneyInput.text);

                              person = int.parse(personInput.text);
                              moneyshare = money / person;
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowMoneyShareUI(
                                  money: money,
                                  tip: tip,
                                  person: person,
                                  moneyshare: moneyshare,
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.calculate,
                            color: Colors.white,
                          ),
                          label: Text(
                            'คำนวณ',
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            fixedSize: Size.fromHeight(55.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(
                              () {
                                () {
                                  moneyInput.text = '';
                                  tipInput.text = '';
                                  personInput.text = '';
                                  checkStatus = false;
                                };
                              },
                            );
                          },
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                          label: Text(
                            'ยกเลิก',
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            fixedSize: Size.fromHeight(55.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
