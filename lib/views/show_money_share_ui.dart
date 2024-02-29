import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ShowMoneyShareUI extends StatefulWidget {
  double? money, tip, moneyshare;
  int? person;

  ShowMoneyShareUI(
      {super.key, this.money, this.tip, this.moneyshare, this.person});

  @override
  State<ShowMoneyShareUI> createState() => _ShowMoneyShareUIState();
}

class _ShowMoneyShareUIState extends State<ShowMoneyShareUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'ผลการคำนวณ',
          style: GoogleFonts.kanit(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Center(
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
            Text(
              'จำนวนเงินที่จะหาร',
              style: GoogleFonts.kanit(
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              NumberFormat('#,##0.00', 'en_US').format(widget.money!),
              style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * 0.04),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'บาท',
              style: GoogleFonts.kanit(
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'จำนวนคนที่จะหาร',
              style: GoogleFonts.kanit(
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              NumberFormat('#,##0.00', 'en_US').format(widget.person),
              style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * 0.04),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'คน',
              style: GoogleFonts.kanit(
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'จำนวนเงินทิป',
              style: GoogleFonts.kanit(
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              NumberFormat('#,##0.00', 'en_US').format(widget.tip),
              style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * 0.04),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'บาท',
              style: GoogleFonts.kanit(
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'แชร์เงินกันคนละ',
              style: GoogleFonts.kanit(
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.height * 0.3,
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
                  NumberFormat('#,##0.00', 'en_US').format(widget.moneyshare),
                  style: GoogleFonts.kanit(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.04,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'บาท',
              style: GoogleFonts.kanit(
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
          ],
        ),
      )),
    );
  }
}
