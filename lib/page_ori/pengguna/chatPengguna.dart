part of '../auth.dart';

class chatPengguna extends StatefulWidget {
  @override
  chatPenggunaState createState() => chatPenggunaState();
}

class chatPenggunaState extends State<chatPengguna> {
  int _count = 1;

  void initState() {
    super.initState();
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
          "Chat",
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: SizedBox(
                  height: displayHeight(context) * 0.15,
                  width: displayHeight(context) * 0.23,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor("#D6CDA4"),
                    ),
                    child: Center(
                        child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  left: displayHeight(context) * 0.03,
                                  right: displayHeight(context) * 0.00),
                              child: Row(
                                children: [
                                  Text(
                                    "61",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: displayHeight(context) * 0.02,
                                    ),
                                  ),
                                  SizedBox(
                                    // height: displayHeight(context) * 0.15,
                                    width: displayHeight(context) * 0.09,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.chat_bubble_outline_rounded,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.01,
                                    left: displayHeight(context) * 0.03,
                                    right: displayHeight(context) * 0.00),
                                child: Row(
                                  children: [
                                    Text(
                                      "Notification",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: displayHeight(context) * 0.02,
                                      ),
                                    ),
                                    SizedBox(
                                      width: displayHeight(context) * 0.03,
                                    ),
                                    Text(
                                      ">",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: displayHeight(context) * 0.03,
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        )
                      ],
                    )),
                  ),
                ),
              ),
              SizedBox(
                width: displayHeight(context) * 0.03,
              ),
              GestureDetector(
                child: SizedBox(
                  height: displayHeight(context) * 0.15,
                  width: displayHeight(context) * 0.23,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor("#D6CDA4"),
                    ),
                    child: Center(
                        child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  left: displayHeight(context) * 0.03,
                                  right: displayHeight(context) * 0.00),
                              child: Row(
                                children: [
                                  SizedBox(
                                    // height: displayHeight(context) * 0.15,
                                    width: displayHeight(context) * 0.12,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.call,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.00,
                                    left: displayHeight(context) * 0.03,
                                    right: displayHeight(context) * 0.00),
                                child: Row(
                                  children: [
                                    Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Costumer",
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize:
                                                displayHeight(context) * 0.02,
                                          ),
                                        ),
                                        Text(
                                          "Service",
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize:
                                                displayHeight(context) * 0.02,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: displayHeight(context) * 0.05,
                                    ),
                                    Text(
                                      ">",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: displayHeight(context) * 0.03,
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        )
                      ],
                    )),
                  ),
                ),
              ),
            ],
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
                  height: displayHeight(context) * 0.08,
                  width: displayHeight(context) * 0.48,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: HexColor("#D6CDA4"),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(displayHeight(context) * 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: displayHeight(context) * 0.1,
                              width: displayHeight(context) * 0.1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  // color: Colors.lightBlue[100],
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.error_outline,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: displayHeight(context) * 0.015,
                                ),
                                SizedBox(
                                  height: displayHeight(context) * 0.05,
                                  width: displayHeight(context) * 0.3,
                                  child: Expanded(
                                    child: Text(
                                      "Chat customers first if there are questions or problems.",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize:
                                            displayHeight(context) * 0.015,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.cancel_outlined,
                                size: 25,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      )),
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
                        padding: EdgeInsets.all(displayHeight(context) * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: displayHeight(context) * 0.08,
                              width: displayHeight(context) * 0.08,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  // color: Colors.lightBlue[100],
                                  image: new DecorationImage(
                                    image: new ExactAssetImage(
                                      'assets/images/pengguna/profile_chat/profile.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    displayHeight(context) * 0.015,
                                    displayHeight(context) * 0.015,
                                    0,
                                    displayHeight(context) * 0.015),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mars Adefa",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize:
                                              displayHeight(context) * 0.02,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: displayHeight(context) * 0.005,
                                    ),
                                    SizedBox(
                                      height: displayHeight(context) * 0.07,
                                      width: displayHeight(context) * 0.25,
                                      child: Expanded(
                                        child: Text(
                                          "Halo, Ini contoh Teks pada chat Pengguna",
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize:
                                                displayHeight(context) * 0.02,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: displayHeight(context) * 0.02,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 25,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      )),
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
                        padding: EdgeInsets.all(displayHeight(context) * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: displayHeight(context) * 0.08,
                              width: displayHeight(context) * 0.08,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  // color: Colors.lightBlue[100],
                                  image: new DecorationImage(
                                    image: new ExactAssetImage(
                                      'assets/images/pengguna/profile_chat/profile.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    displayHeight(context) * 0.015,
                                    displayHeight(context) * 0.015,
                                    0,
                                    displayHeight(context) * 0.015),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Umar Fakhriy",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize:
                                              displayHeight(context) * 0.02,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: displayHeight(context) * 0.005,
                                    ),
                                    SizedBox(
                                      height: displayHeight(context) * 0.07,
                                      width: displayHeight(context) * 0.25,
                                      child: Expanded(
                                        child: Text(
                                          "Halo, Ini contoh Teks pada chat Pengguna",
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize:
                                                displayHeight(context) * 0.02,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: displayHeight(context) * 0.02,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 25,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.03,
                ),
                SizedBox(
                  height: displayHeight(context) * 0.2,
                  width: displayHeight(context) * 0.48,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor("#3D8361"),
                    ),
                    child: Center(
                      child: Text(
                        "Drink",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: displayHeight(context) * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
