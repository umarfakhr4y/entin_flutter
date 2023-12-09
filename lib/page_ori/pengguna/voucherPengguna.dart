part of '../auth.dart';

class voucherPengguna extends StatefulWidget {
  @override
  voucherPenggunaState createState() => voucherPenggunaState();
}

class voucherPenggunaState extends State<voucherPengguna> {
  static TextEditingController textController = TextEditingController();
  TextEditingController search = TextEditingController();

  int _count = 1;

  void initState() {
    super.initState();
  }

  void klikLogout() {
    logOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#EEF2E6"),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: new Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Your Voucher",
          style: GoogleFonts.poppins(
              color: Colors.black,
              // fontSize: displayHeight(context) * 0.02,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: displayHeight(context) * 0.15,
          ),
          SizedBox(
            height: displayHeight(context) * 0.05,
            width: displayHeight(context) * 0.45,
            child: TextFormField(
              controller: search,
              style: GoogleFonts.poppins(
                color: Color(0xFF000000),
                // fontSize: displayHeight(context) * 0.02
              ),
              cursorColor: Color(0xFF9b9b9b),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                isDense: true,
                filled: true,
                fillColor: HexColor("#D6CDA4"),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor("#D6CDA4")),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor("#ABA587")),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                prefixIcon: Icon(
                  Icons.discount_rounded,
                  color: Colors.black,
                  size: displayHeight(context) * 0.025,
                ),
                hintText: "Enter your voucher code below to reedem it.",
                hintStyle: TextStyle(
                    // height: displayHeight(context) * 0.006,
                    color: Color(0xFF9b9b9b),
                    fontSize: displayHeight(context) * 0.015,
                    fontWeight: FontWeight.normal),
              ),
              validator: (emailValue) {},
            ),
          ),
          SizedBox(
            height: displayHeight(context) * 0.015,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: displayHeight(context) * 0.03,
                ),
                SizedBox(
                  height: displayHeight(context) * 0.18,
                  width: displayHeight(context) * 0.48,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor("#D6CDA4"),
                    ),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            displayHeight(context) * 0.02,
                            displayHeight(context) * 0.02,
                            displayHeight(context) * 0.02,
                            displayHeight(context) * 0.02),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rp15k off discount for your first purchasing!",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: displayHeight(context) * 0.02,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.055),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: displayHeight(context) * 0.05,
                                    width: displayHeight(context) * 0.2,
                                    child: Expanded(
                                      child: Text(
                                        "Valid until May 20, 2023",
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize:
                                              displayHeight(context) * 0.02,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: displayHeight(context) * 0.02,
                                  ),
                                  GestureDetector(
                                    child: SizedBox(
                                      height: displayHeight(context) * 0.05,
                                      width: displayHeight(context) * 0.1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: HexColor("#14633C"),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Use",
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize:
                                                  displayHeight(context) * 0.02,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.03,
                ),
                SizedBox(
                  height: displayHeight(context) * 0.18,
                  width: displayHeight(context) * 0.48,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor("#D6CDA4"),
                    ),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            displayHeight(context) * 0.02,
                            displayHeight(context) * 0.02,
                            displayHeight(context) * 0.02,
                            displayHeight(context) * 0.02),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rp10k off discount for your food!",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: displayHeight(context) * 0.02,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.055),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: displayHeight(context) * 0.05,
                                    width: displayHeight(context) * 0.2,
                                    child: Expanded(
                                      child: Text(
                                        "Valid until May 20, 2023",
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize:
                                              displayHeight(context) * 0.02,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: displayHeight(context) * 0.02,
                                  ),
                                  GestureDetector(
                                    child: SizedBox(
                                      height: displayHeight(context) * 0.05,
                                      width: displayHeight(context) * 0.1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: HexColor("#14633C"),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Use",
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize:
                                                  displayHeight(context) * 0.02,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.03,
                ),
                SizedBox(
                  height: displayHeight(context) * 0.18,
                  width: displayHeight(context) * 0.48,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor("#D6CDA4"),
                    ),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            displayHeight(context) * 0.02,
                            displayHeight(context) * 0.02,
                            displayHeight(context) * 0.02,
                            displayHeight(context) * 0.02),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Discount 30% food (max Rp.30k)!",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: displayHeight(context) * 0.02,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.055),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: displayHeight(context) * 0.05,
                                    width: displayHeight(context) * 0.2,
                                    child: Expanded(
                                      child: Text(
                                        "Valid until May 20, 2023",
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize:
                                              displayHeight(context) * 0.02,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: displayHeight(context) * 0.02,
                                  ),
                                  GestureDetector(
                                    child: SizedBox(
                                      height: displayHeight(context) * 0.05,
                                      width: displayHeight(context) * 0.1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: HexColor("#14633C"),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Use",
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize:
                                                  displayHeight(context) * 0.02,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
          )),
        ],
      )),
    );
  }
}
