part of '../auth.dart';

class cartPengguna extends StatefulWidget {
  @override
  cartPenggunaState createState() => cartPenggunaState();
}

class cartPenggunaState extends State<cartPengguna> {
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
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ExpandableCardPage(
        page: Center(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: displayHeight(context) * 0.06,
            ),
            Text(
              "Cart",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: displayHeight(context) * 0.027,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Make sure your order is correct",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: displayHeight(context) * 0.020),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: displayHeight(context) * 0.03,
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.2,
                    width: displayHeight(context) * 0.48,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: HexColor("#D6CDA4"),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.all(displayHeight(context) * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: displayHeight(context) * 0.15,
                                width: displayHeight(context) * 0.15,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    // color: Colors.lightBlue[100],
                                    image: new DecorationImage(
                                      image: new ExactAssetImage(
                                        'assets/images/pengguna/makanan/test1.png',
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
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Mie ayam original",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize:
                                                    displayHeight(context) *
                                                        0.02,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width:
                                                displayHeight(context) * 0.05,
                                          ),
                                          Text(
                                            "11 k",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize:
                                                    displayHeight(context) *
                                                        0.02,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: displayHeight(context) * 0.05,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          SizedBox(
                                            width: displayHeight(context) * 0.1,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (_count <= 0) {
                                              } else {
                                                setState(() {
                                                  _count -= 1;
                                                });
                                              }
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(0.1),
                                              decoration: BoxDecoration(
                                                color: HexColor("#3D8361"),
                                                shape: BoxShape.circle,
                                                border: Border.all(),
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15.0),
                                          Text("$_count"),
                                          SizedBox(width: 15.0),
                                          GestureDetector(
                                            onTap: () {
                                              if (_count >= 5) {
                                              } else {
                                                setState(() {
                                                  _count += 1;
                                                });
                                              }
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(0.1),
                                              decoration: BoxDecoration(
                                                color: HexColor("#3D8361"),
                                                shape: BoxShape.circle,
                                                border: Border.all(),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))
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
                          color: HexColor("#D6CDA4"),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.all(displayHeight(context) * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: displayHeight(context) * 0.15,
                                width: displayHeight(context) * 0.15,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    // color: Colors.lightBlue[100],
                                    image: new DecorationImage(
                                      image: new ExactAssetImage(
                                        'assets/images/pengguna/makanan/test1.png',
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
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Mie ayam original",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize:
                                                    displayHeight(context) *
                                                        0.02,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width:
                                                displayHeight(context) * 0.05,
                                          ),
                                          Text(
                                            "11 k",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize:
                                                    displayHeight(context) *
                                                        0.02,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: displayHeight(context) * 0.05,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          SizedBox(
                                            width: displayHeight(context) * 0.1,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (_count <= 0) {
                                              } else {
                                                setState(() {
                                                  _count -= 1;
                                                });
                                              }
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(0.1),
                                              decoration: BoxDecoration(
                                                color: HexColor("#3D8361"),
                                                shape: BoxShape.circle,
                                                border: Border.all(),
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15.0),
                                          Text("$_count"),
                                          SizedBox(width: 15.0),
                                          GestureDetector(
                                            onTap: () {
                                              if (_count >= 5) {
                                              } else {
                                                setState(() {
                                                  _count += 1;
                                                });
                                              }
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(0.1),
                                              decoration: BoxDecoration(
                                                color: HexColor("#3D8361"),
                                                shape: BoxShape.circle,
                                                border: Border.all(),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            )),
          ],
        )),
        expandableCard: ExpandableCard(
          hasRoundedCorners: true,
          hasShadow: false,
          // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          children: <Widget>[
            Text(
              "Your Order",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: displayHeight(context) * 0.03,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: displayHeight(context) * 0.03,
            ),
            Text(
              "Choose meeting point",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: displayHeight(context) * 0.03,
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "You're in ",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: displayHeight(context) * 0.023,
                    ),
                  ),
                  Text(
                    "Universitas Negeri Jakarta",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: displayHeight(context) * 0.023,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: displayHeight(context) * 0.02,
            ),
            GestureDetector(
              child: SizedBox(
                height: displayHeight(context) * 0.06,
                width: displayHeight(context) * 0.4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: HexColor("#3D8361"),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: displayHeight(context) * 0.03,
                      ),
                      Text(
                        "Meeting Point",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: displayHeight(context) * 0.02,
                        ),
                      ),
                      SizedBox(
                        width: displayHeight(context) * 0.18,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: displayHeight(context) * 0.04),
            SizedBox(
              height: displayHeight(context) * 0.24,
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
                        Padding(
                            padding: EdgeInsets.fromLTRB(
                                displayHeight(context) * 0.015,
                                displayHeight(context) * 0.015,
                                0,
                                displayHeight(context) * 0.015),
                            child: Column(
                              children: [],
                            ))
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: displayHeight(context) * 0.02,
            ),
            GestureDetector(
              onTap: (){
                print("tap");
              },
              child: SizedBox(
                height: displayHeight(context) * 0.06,
                width: displayHeight(context) * 0.2,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor("#3D8361"),
                    ),
                    child: Center(
                      child: Text(
                        "Order",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: displayHeight(context) * 0.02,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )),
              ),
            ),
          ],
          backgroundColor: HexColor("#DAD6C5"),
        ),
      ),
    );
  }
}
