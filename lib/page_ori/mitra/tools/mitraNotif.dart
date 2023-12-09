part of '../../auth.dart';

class mitraNotif extends StatefulWidget {
  @override
  mitraNotifState createState() => mitraNotifState();
}

class mitraNotifState extends State<mitraNotif> {
  int _count = 1;

  void initState() {
    super.initState();
  }

  void klikLogout() {
    logOut();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: _buildWidget());
  }

  Widget _buildWidget() {
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
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Notification",
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
            height: displayHeight(context) * 0.13,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: displayHeight(context) * 0.01,
                ),
                Text(
                  "Recent Notification",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: displayHeight(context) * 0.02,
                  ),
                ),
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
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    displayHeight(context) * 0.02,
                                    0,
                                    displayHeight(context) * 0.02,
                                    0),
                                child: SizedBox(
                                    height: displayHeight(context) * 0.1,
                                    width: displayHeight(context) * 0.06,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        // color: Colors.lightBlue[100],
                                      ),
                                      child: CircleAvatar(
                                        radius: displayHeight(context) * 0.05,
                                      ),
                                    ))),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: displayHeight(context) * 0.015,
                                  // width: displayHeight(context) * 0.3,
                                ),
                                SizedBox(
                                  height: displayHeight(context) * 0.05,
                                  width: displayHeight(context) * 0.3,
                                  child: Text(
                                    "Umar has placed an order",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: displayHeight(context) * 0.02,
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
                  height: displayHeight(context) * 0.015,
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
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    displayHeight(context) * 0.02,
                                    0,
                                    displayHeight(context) * 0.02,
                                    0),
                                child: SizedBox(
                                    height: displayHeight(context) * 0.1,
                                    width: displayHeight(context) * 0.06,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        // color: Colors.lightBlue[100],
                                      ),
                                      child: CircleAvatar(
                                        radius: displayHeight(context) * 0.05,
                                      ),
                                    ))),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: displayHeight(context) * 0.015,
                                  // width: displayHeight(context) * 0.3,
                                ),
                                SizedBox(
                                  height: displayHeight(context) * 0.05,
                                  width: displayHeight(context) * 0.3,
                                  child: Text(
                                    "Umar has placed an order",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: displayHeight(context) * 0.02,
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
                  height: displayHeight(context) * 0.015,
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
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    displayHeight(context) * 0.02,
                                    0,
                                    displayHeight(context) * 0.02,
                                    0),
                                child: SizedBox(
                                    height: displayHeight(context) * 0.1,
                                    width: displayHeight(context) * 0.06,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        // color: Colors.lightBlue[100],
                                      ),
                                      child: CircleAvatar(
                                        radius: displayHeight(context) * 0.05,
                                      ),
                                    ))),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: displayHeight(context) * 0.015,
                                  // width: displayHeight(context) * 0.3,
                                ),
                                SizedBox(
                                  height: displayHeight(context) * 0.05,
                                  width: displayHeight(context) * 0.3,
                                  child: Text(
                                    "Umar has placed an order",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: displayHeight(context) * 0.02,
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
              ],
            ),
          )),
        ],
      )),
    );
  }
}
