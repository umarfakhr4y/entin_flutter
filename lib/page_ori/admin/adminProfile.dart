part of '../auth.dart';

class adminProfile extends StatefulWidget {
  @override
  adminProfileState createState() => adminProfileState();
}

class adminProfileState extends State<adminProfile> {
  final _mainNavigatorKey = GlobalKey<NavigatorState>();
  int _count = 1;
  DataLogin? dataLogin;

  void initState() {
    super.initState();
    getDataLogin();
  }

  // void klikLogout() {
  //   logOut();
  // }

  void klikLogout() {
    logOut().then((value) {
      setState(() {
        if (value == "logout") {
          setState(() {
            // _loading = false;
          });
          Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(builder: (context) => new Login()));
        }
      });
    });
  }

  void getDataLogin() {
    UserViewModel().getUser().then((value) {
      setState(() {
        dataLogin = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: _buildWidget());
  }

  Widget _buildWidget() {
    return dataLogin == null
        ? Center(
            child: Scaffold(
            backgroundColor: HexColor("#EEF2E6"),
            body: Center(
              child: CircularProgressIndicator(
                color: HexColor("#3D8361"),
              ),
            ),
          ))
        : Scaffold(
            backgroundColor: HexColor("#EEF2E6"),
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  icon: new Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 0,
                  ),
                  onPressed: () {}),
              title: Center(
                  child: Text(
                "Profile",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: displayHeight(context) * 0.027,
                    fontWeight: FontWeight.bold),
              )),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    size: 25,
                    color: Colors.black,
                  ),
                  tooltip: 'Go to the next page',
                  onPressed: () {
                    klikLogout();
                  },
                ),
              ],
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
                            // CircleAvatar(
                            //     backgroundImage: NetworkImage(
                            //         'http://coperationv2.herokuapp.com/${dataLogin.success.image}'),
                            //     radius: displayHeight(context) * 0.08,
                            //   )
                            dataLogin?.success.image == "no_ingfo"
                                ? ProfilePicture(
                                    name: dataLogin!.success.name,
                                    radius: displayHeight(context) * 0.06,
                                    fontsize: 21,
                                    // random: true,
                                  )
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'http://192.168.100.2:8000/profile_img/${dataLogin?.success.image}'),
                                    radius: displayHeight(context) * 0.05,
                                  ),
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
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                        height: displayHeight(context) * 0.1,
                                        width: displayHeight(context) * 0.1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: HexColor("#3D8361"),
                                          ),
                                          child: Icon(
                                            Icons.list_outlined,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        )),
                                    Text(
                                      "Edit",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize:
                                            displayHeight(context) * 0.017,
                                      ),
                                    ),
                                    Text(
                                      "Profile",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize:
                                            displayHeight(context) * 0.017,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: displayHeight(context) * 0.03,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                        height: displayHeight(context) * 0.1,
                                        width: displayHeight(context) * 0.1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: HexColor("#3D8361"),
                                          ),
                                          child: Icon(
                                            Icons.key,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        )),
                                    Text(
                                      "Change",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize:
                                            displayHeight(context) * 0.017,
                                      ),
                                    ),
                                    Text(
                                      "Password",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize:
                                            displayHeight(context) * 0.017,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: displayHeight(context) * 0.03,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                        height: displayHeight(context) * 0.1,
                                        width: displayHeight(context) * 0.1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: HexColor("#3D8361"),
                                          ),
                                          child: Icon(
                                            Icons.delete,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        )),
                                    Text(
                                      "Delete",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize:
                                            displayHeight(context) * 0.017,
                                      ),
                                    ),
                                    Text(
                                      "Account",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize:
                                            displayHeight(context) * 0.017,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: displayHeight(context) * 0.03,
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.07,
                        width: displayHeight(context) * 0.48,
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: HexColor("#D6CDA4"),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: displayHeight(context) * 0.03,
                                ),
                                Icon(
                                  Icons.person_add_alt_1,
                                  size: 25,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: displayHeight(context) * 0.02,
                                ),
                                Text(
                                  "Invite Friends",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: displayHeight(context) * 0.02,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.02,
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.07,
                        width: displayHeight(context) * 0.48,
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: HexColor("#D6CDA4"),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: displayHeight(context) * 0.03,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 25,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: displayHeight(context) * 0.02,
                                ),
                                Text(
                                  "Rate Us",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: displayHeight(context) * 0.02,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.02,
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.07,
                        width: displayHeight(context) * 0.48,
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: HexColor("#D6CDA4"),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: displayHeight(context) * 0.03,
                                ),
                                Icon(
                                  Icons.language,
                                  size: 25,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: displayHeight(context) * 0.02,
                                ),
                                Text(
                                  "Language",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: displayHeight(context) * 0.02,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.02,
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.07,
                        width: displayHeight(context) * 0.48,
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: HexColor("#D6CDA4"),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: displayHeight(context) * 0.03,
                                ),
                                Icon(
                                  Icons.help,
                                  size: 25,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: displayHeight(context) * 0.02,
                                ),
                                Text(
                                  "Help & Report",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: displayHeight(context) * 0.02,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          );
  }
}
