part of '../auth.dart';

class MitraHome extends StatefulWidget {
  @override
  MitraHomeState createState() => MitraHomeState();
}

class MitraHomeState extends State<MitraHome> {
  int _count = 1;
  DataLogin? dataLogin;

  void initState() {
    super.initState();
    getDataLogin();
  }

  void getDataLogin() {
    UserViewModel().getUser().then((value) {
      setState(() {
        dataLogin = value;
      });
    });
  }

  // void klikLogout() {
  //   logOut();
  // }

  void klikLogout() {
    logOut().then((value) {
      setState(() {
        setState(() {
          // _loading = true;
          // SimpleDialog(
          //   title: CircularProgressIndicator(),
          // );
        });
        if (value == "logout") {
          setState(() {
            // _loading = false;
          });
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Login()),
            (Route<dynamic> route) => false,
          );
        }
      });
    });
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
        title: Center(
            child: Text(
          "Home",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: displayHeight(context) * 0.027,
          ),
        )),
      ),
      body: Column(
        children: [
          // Image.asset(
          //   'assets/images/pengguna/banner/banner2wide.png',
          //   height: displayHeight(context) * 0.38,
          //   width: displayHeight(context) * 1,
          //   fit: BoxFit.contain,
          // ),
          Container(
              height: displayHeight(context) * 0.3,
              width: displayHeight(context) * 1,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage(
                    'assets/images/splash.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: displayHeight(context) * 0.14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: displayHeight(context) * 0.04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // "Umar Fakhriy",
                            "${dataLogin?.success.name}",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: displayHeight(context) * 0.027,
                            ),
                          ),
                          Text(
                            // "umarfakhr1y@gmail.com",
                            "${dataLogin?.success.email}",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: displayHeight(context) * 0.017,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )),

          SizedBox(
            height: displayHeight(context) * 0.015,
          ),
          SizedBox(
            height: displayHeight(context) * 0.15,
            width: displayHeight(context) * 0.48,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: HexColor("#D6CDA4"),
                ),
                child: Padding(
                    padding: EdgeInsets.all(displayHeight(context) * 0.02),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Income Today",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: displayHeight(context) * 0.017,
                                ),
                              ),
                              SizedBox(
                                height: displayHeight(context) * 0.03,
                              ),
                              Text(
                                "Rp. 500.000,00",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: displayHeight(context) * 0.017,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: displayHeight(context) * 0.05,
                          ),
                          Container(
                            height: displayHeight(context) * 0.05,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: displayHeight(context) * 0.05,
                          ),
                          Column(
                            children: [
                              Text(
                                "Your Balance",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: displayHeight(context) * 0.017,
                                ),
                              ),
                              SizedBox(
                                height: displayHeight(context) * 0.03,
                              ),
                              Text(
                                "Rp. 1.500.000,00",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: displayHeight(context) * 0.017,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))),
          ),
          SizedBox(
            height: displayHeight(context) * 0.02,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: displayHeight(context) * 0.2,
                width: displayHeight(context) * 0.2,
                child: GestureDetector(
                  onTap: () {
                    
                  },
                  child: SizedBox(
                    height: displayHeight(context) * 0.25,
                    width: displayHeight(context) * 0.2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => mitraReview(idOper: dataLogin!.success.datas.first.id),
                                maintainState: false));
                      },
                      child: new Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: HexColor("#3D8361"),
                              border:
                                  Border.all(width: 2, color: Colors.white)),
                          child: Center(
                            child: Text("Review",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: displayHeight(context) * 0.025,
                                )),
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: displayHeight(context) * 0.03,
              ),
              SizedBox(
                height: displayHeight(context) * 0.2,
                width: displayHeight(context) * 0.2,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  child: SizedBox(
                    height: displayHeight(context) * 0.25,
                    width: displayHeight(context) * 0.2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => mitraMenu(idOper: dataLogin!.success.id,iddataOper: dataLogin!.success.datas.first.id),
                                maintainState: false));
                      },
                      child: new Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: HexColor("#3D8361"),
                              border:
                                  Border.all(width: 2, color: Colors.white)),
                          child: Center(
                            child: Text("Menu",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: displayHeight(context) * 0.025,
                                )),
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: displayHeight(context) * 0.02,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: displayHeight(context) * 0.15,
                width: displayHeight(context) * 0.42,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  child: SizedBox(
                    height: displayHeight(context) * 0.25,
                    width: displayHeight(context) * 0.2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => mitraOrder(idOper: dataLogin!.success.datas.first.id),
                                maintainState: false));
                      },
                      child: new Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: HexColor("#3D8361"),
                              border:
                                  Border.all(width: 2, color: Colors.white)),
                          child: Center(
                            child: Text("Order",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: displayHeight(context) * 0.025,
                                )),
                          )),
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
