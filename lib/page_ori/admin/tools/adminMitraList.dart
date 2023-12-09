part of '../../auth.dart';

class adminMitraList extends StatefulWidget {
  @override
  adminMitraListState createState() => adminMitraListState();
}

class adminMitraListState extends State<adminMitraList> {
  int _count = 1;
  DataOrderMitra? dataOrderMitra;
  DataOrderMitraRequest? dataOrderMitrareq;
  DataOrderMitraOnProgress? dataOrderMitraOnProgress;
  DataOrderMitraComplete? dataOrderMitraComplete;

  AdminListMitra? adminListMitra;
  AdminListMitra? adminListMitraactive;
  AdminListMitra? adminListMitranotactive;
  // DataOrderMitra? dataOrderMitra;
  // DataOrderMitra? dataOrderMitra;

  void initState() {
    super.initState();
    getMitraList();
    // getDataLogin();
  }

  void getMitraList() {
    getMitraListt().then((value) {
      setState(() {
        adminListMitra = value;
      });
      // print(dataMitraHome?.success.first.alamatRestoran);
    });
    getMitraListtactive().then((value) {
      setState(() {
        adminListMitraactive = value;
      });
      // print(dataMitraHome?.success.first.alamatRestoran);
    });
    getMitraListtnotactive().then((value) {
      setState(() {
        adminListMitranotactive = value;
      });
      // print(dataMitraHome?.success.first.alamatRestoran);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: _buildWidget());
  }

  Widget _buildWidget() {
    return Scaffold(
      backgroundColor: HexColor("#EEF2E6"),
      extendBodyBehindAppBar: false,
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
          "Mitra List",
          style: GoogleFonts.poppins(
              color: Colors.black,
              // fontSize: displayHeight(context) * 0.02,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Image.asset(
          //   'assets/images/pengguna/banner/banner2wide.png',
          //   height: displayHeight(context) * 0.38,
          //   width: displayHeight(context) * 1,
          //   fit: BoxFit.contain,
          // ),

          SizedBox(
            height: displayHeight(context) * 0.015,
          ),
          Container(
            // padding: const EdgeInsets.all(8.0),
            color: HexColor("#EEF2E6"),
            width: displayHeight(context) * 0.6,
            height: displayHeight(context) * 0.83,
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: <Widget>[
                  ButtonsTabBar(
                    backgroundColor: HexColor("#14633C"),
                    unselectedBackgroundColor: HexColor("#3D8361"),
                    unselectedLabelStyle: TextStyle(color: Colors.white),
                    radius: displayHeight(context) * 0.6,
                    height: displayHeight(context) * 0.06,
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: displayHeight(context) * 0.02,
                        fontWeight: FontWeight.w500),
                    tabs: [
                      Tab(
                        text: "  All  ",
                      ),
                      Tab(
                        text: "  Active  ",
                      ),
                      Tab(
                        text: "  Not Active  ",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: displayHeight(context) * 0.05,
                              ),
                              Expanded(
                                  child: adminListMitra == null
                                      ? Center(
                                          child: Scaffold(
                                          backgroundColor: HexColor("#EEF2E6"),
                                          body: Center(
                                              child: Text(
                                            "No Recent Order",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize:
                                                  displayHeight(context) * 0.02,
                                            ),
                                          )),
                                        ))
                                      : ListView.builder(
                                          itemCount:
                                              adminListMitra?.success.length,
                                          itemBuilder: (context, i) {
                                            return Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    displayHeight(context) *
                                                        0.04,
                                                    0,
                                                    displayHeight(context) *
                                                        0.04,
                                                    displayHeight(context) *
                                                        0.02),
                                                child: Column(
                                                  children: [
                                                    ExpansionTileCard(
                                                      baseColor:
                                                          HexColor("#D6CDA4"),
                                                      expandedColor:
                                                          HexColor("#D6CDA4"),
                                                      expandedTextColor:
                                                          Colors.black,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  25)),
                                                      // key: cardA,
                                                      leading: CircleAvatar(),
                                                      title: Text(
                                                        adminListMitra!
                                                            .success[i]
                                                            .nameRestoran,
                                                        style: GoogleFonts.poppins(
                                                            color: Colors.black,
                                                            fontSize:
                                                                displayHeight(
                                                                        context) *
                                                                    0.024,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      subtitle: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Joined at " +
                                                                adminListMitra!
                                                                    .success[i]
                                                                    .createdAt
                                                                    .toString()
                                                                    .substring(
                                                                        0, 11),
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: HexColor(
                                                                  "#505050"),
                                                              fontSize:
                                                                  displayHeight(
                                                                          context) *
                                                                      0.018,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Status: " +
                                                                adminListMitra!
                                                                    .success[i]
                                                                    .status,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: HexColor(
                                                                  "#505050"),
                                                              fontSize:
                                                                  displayHeight(
                                                                          context) *
                                                                      0.018,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      children: <Widget>[
                                                        Divider(
                                                          thickness: 1.0,
                                                          height: 1.0,
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 3.0,
                                                                vertical: 3.0,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  children: [
                                                                    ListTile(
                                                                      leading: Icon(
                                                                          Icons
                                                                              .location_on),
                                                                      title:
                                                                          Text(
                                                                        'Location',
                                                                      ),
                                                                      subtitle: Text(adminListMitra!
                                                                          .success[
                                                                              i]
                                                                          .alamatRestoran),
                                                                    ),
                                                                    ListTile(
                                                                      leading: Icon(
                                                                          Icons
                                                                              .phone),
                                                                      title:
                                                                          Text(
                                                                        'Phone Call',
                                                                      ),
                                                                      subtitle: Text(adminListMitra!
                                                                          .success[
                                                                              i]
                                                                          .notelpRestoran),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ButtonBar(
                                                              alignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              buttonHeight:
                                                                  displayHeight(
                                                                          context) *
                                                                      0.005,
                                                              buttonMinWidth:
                                                                  90.0,
                                                              children: <
                                                                  Widget>[
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              adminMenubyMitra(
                                                                                idOper: adminListMitra!.success[i].usersId,
                                                                                iddataOper: adminListMitra!.success[i].id,
                                                                              )),
                                                                    );
                                                                  },
                                                                  child: Column(
                                                                    children: <
                                                                        Widget>[
                                                                      Icon(
                                                                          Icons
                                                                              .fastfood_sharp,
                                                                          color:
                                                                              HexColor("#3D8361")),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(vertical: 2.0),
                                                                      ),
                                                                      Text(
                                                                        'Menu',
                                                                        style: TextStyle(
                                                                            color:
                                                                                HexColor("#3D8361")),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ));
                                          }))
                            ],
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: displayHeight(context) * 0.05,
                              ),
                              Expanded(
                                  child: adminListMitraactive == null
                                      ? Center(
                                          child: Scaffold(
                                          backgroundColor: HexColor("#EEF2E6"),
                                          body: Center(
                                              child: Text(
                                            "No Recent Order",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize:
                                                  displayHeight(context) * 0.02,
                                            ),
                                          )),
                                        ))
                                      : ListView.builder(
                                          itemCount: adminListMitraactive
                                              ?.success.length,
                                          itemBuilder: (context, i) {
                                            return Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    displayHeight(context) *
                                                        0.04,
                                                    0,
                                                    displayHeight(context) *
                                                        0.04,
                                                    displayHeight(context) *
                                                        0.02),
                                                child: Column(
                                                  children: [
                                                    ExpansionTileCard(
                                                      baseColor:
                                                          HexColor("#D6CDA4"),
                                                      expandedColor:
                                                          HexColor("#D6CDA4"),
                                                      expandedTextColor:
                                                          Colors.black,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  25)),
                                                      // key: cardA,
                                                      leading: CircleAvatar(),
                                                      title: Text(
                                                        adminListMitra!
                                                            .success[i]
                                                            .nameRestoran,
                                                        style: GoogleFonts.poppins(
                                                            color: Colors.black,
                                                            fontSize:
                                                                displayHeight(
                                                                        context) *
                                                                    0.024,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      subtitle: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Joined at " +
                                                                adminListMitraactive!
                                                                    .success[i]
                                                                    .createdAt
                                                                    .toString()
                                                                    .substring(
                                                                        0, 11),
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: HexColor(
                                                                  "#505050"),
                                                              fontSize:
                                                                  displayHeight(
                                                                          context) *
                                                                      0.018,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Status: " +
                                                                adminListMitraactive!
                                                                    .success[i]
                                                                    .status,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: HexColor(
                                                                  "#505050"),
                                                              fontSize:
                                                                  displayHeight(
                                                                          context) *
                                                                      0.018,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      children: <Widget>[
                                                        Divider(
                                                          thickness: 1.0,
                                                          height: 1.0,
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 3.0,
                                                                vertical: 3.0,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  children: [
                                                                    ListTile(
                                                                      leading: Icon(
                                                                          Icons
                                                                              .location_on),
                                                                      title:
                                                                          Text(
                                                                        'Location',
                                                                      ),
                                                                      subtitle: Text(adminListMitraactive!
                                                                          .success[
                                                                              i]
                                                                          .alamatRestoran),
                                                                    ),
                                                                    ListTile(
                                                                      leading: Icon(
                                                                          Icons
                                                                              .phone),
                                                                      title:
                                                                          Text(
                                                                        'Phone Call',
                                                                      ),
                                                                      subtitle: Text(adminListMitraactive!
                                                                          .success[
                                                                              i]
                                                                          .notelpRestoran),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ButtonBar(
                                                              alignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              buttonHeight:
                                                                  displayHeight(
                                                                          context) *
                                                                      0.005,
                                                              buttonMinWidth:
                                                                  90.0,
                                                              children: <
                                                                  Widget>[
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              adminMenubyMitra(
                                                                                idOper: adminListMitraactive!.success[i].usersId,
                                                                                iddataOper: adminListMitraactive!.success[i].id,
                                                                              )),
                                                                    );
                                                                  },
                                                                  child: Column(
                                                                    children: <
                                                                        Widget>[
                                                                      Icon(
                                                                          Icons
                                                                              .fastfood_sharp,
                                                                          color:
                                                                              HexColor("#3D8361")),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(vertical: 2.0),
                                                                      ),
                                                                      Text(
                                                                        'Menu',
                                                                        style: TextStyle(
                                                                            color:
                                                                                HexColor("#3D8361")),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            ButtonBar(
                                                              alignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              buttonHeight:
                                                                  displayHeight(
                                                                          context) *
                                                                      0.005,
                                                              buttonMinWidth:
                                                                  90.0,
                                                              children: <
                                                                  Widget>[
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    CoolAlert.show(
                                                                        context: context,
                                                                        type: CoolAlertType.warning,
                                                                        showCancelBtn: true,
                                                                        confirmBtnColor: HexColor("#3D8361"),
                                                                        title: "Warning",
                                                                        text: "xxxxxxxxxx",
                                                                        // barrierDismissible:
                                                                        //     false,
                                                                        cancelBtnText: "Cancel",
                                                                        onCancelBtnTap: () {},
                                                                        confirmBtnText: "Confirm",
                                                                        closeOnConfirmBtnTap: false,
                                                                        onConfirmBtnTap: () {});
                                                                  },
                                                                  child: Column(
                                                                    children: <
                                                                        Widget>[
                                                                      Icon(
                                                                          Icons
                                                                              .disabled_by_default,
                                                                          color:
                                                                              Colors.red),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(vertical: 2.0),
                                                                      ),
                                                                      Text(
                                                                        'Deactivate',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.red),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ));
                                          }))
                            ],
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: displayHeight(context) * 0.05,
                              ),
                              Expanded(
                                  child: adminListMitranotactive == null
                                      ? Center(
                                          child: Scaffold(
                                          backgroundColor: HexColor("#EEF2E6"),
                                          body: Center(
                                              child: Text(
                                            "No Recent Order",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize:
                                                  displayHeight(context) * 0.02,
                                            ),
                                          )),
                                        ))
                                      : ListView.builder(
                                          itemCount: adminListMitranotactive
                                              ?.success.length,
                                          itemBuilder: (context, i) {
                                            return Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    displayHeight(context) *
                                                        0.04,
                                                    0,
                                                    displayHeight(context) *
                                                        0.04,
                                                    displayHeight(context) *
                                                        0.02),
                                                child: Column(
                                                  children: [
                                                    ExpansionTileCard(
                                                      baseColor:
                                                          HexColor("#D6CDA4"),
                                                      expandedColor:
                                                          HexColor("#D6CDA4"),
                                                      expandedTextColor:
                                                          Colors.black,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  25)),
                                                      // key: cardA,
                                                      leading: CircleAvatar(),
                                                      title: Text(
                                                        adminListMitranotactive!
                                                            .success[i]
                                                            .nameRestoran,
                                                        style: GoogleFonts.poppins(
                                                            color: Colors.black,
                                                            fontSize:
                                                                displayHeight(
                                                                        context) *
                                                                    0.024,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      subtitle: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Joined at " +
                                                                adminListMitranotactive!
                                                                    .success[i]
                                                                    .createdAt
                                                                    .toString()
                                                                    .substring(
                                                                        0, 11),
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: HexColor(
                                                                  "#505050"),
                                                              fontSize:
                                                                  displayHeight(
                                                                          context) *
                                                                      0.018,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Status: " +
                                                                adminListMitranotactive!
                                                                    .success[i]
                                                                    .status,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: HexColor(
                                                                  "#505050"),
                                                              fontSize:
                                                                  displayHeight(
                                                                          context) *
                                                                      0.018,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      children: <Widget>[
                                                        Divider(
                                                          thickness: 1.0,
                                                          height: 1.0,
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 3.0,
                                                                vertical: 3.0,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  children: [
                                                                    ListTile(
                                                                      leading: Icon(
                                                                          Icons
                                                                              .location_on),
                                                                      title:
                                                                          Text(
                                                                        'Location',
                                                                      ),
                                                                      subtitle: Text(adminListMitranotactive!
                                                                          .success[
                                                                              i]
                                                                          .alamatRestoran),
                                                                    ),
                                                                    ListTile(
                                                                      leading: Icon(
                                                                          Icons
                                                                              .phone),
                                                                      title:
                                                                          Text(
                                                                        'Phone Call',
                                                                      ),
                                                                      subtitle: Text(adminListMitranotactive!
                                                                          .success[
                                                                              i]
                                                                          .notelpRestoran),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ButtonBar(
                                                              alignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              buttonHeight:
                                                                  displayHeight(
                                                                          context) *
                                                                      0.005,
                                                              buttonMinWidth:
                                                                  90.0,
                                                              children: <
                                                                  Widget>[
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              adminMenubyMitra(
                                                                                idOper: adminListMitranotactive!.success[i].usersId,
                                                                                iddataOper: adminListMitranotactive!.success[i].id,
                                                                              )),
                                                                    );
                                                                  },
                                                                  child: Column(
                                                                    children: <
                                                                        Widget>[
                                                                      Icon(
                                                                          Icons
                                                                              .fastfood_sharp,
                                                                          color:
                                                                              HexColor("#3D8361")),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(vertical: 2.0),
                                                                      ),
                                                                      Text(
                                                                        'Menu',
                                                                        style: TextStyle(
                                                                            color:
                                                                                HexColor("#3D8361")),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            ButtonBar(
                                                              alignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              buttonHeight:
                                                                  displayHeight(
                                                                          context) *
                                                                      0.005,
                                                              buttonMinWidth:
                                                                  90.0,
                                                              children: <
                                                                  Widget>[
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    CoolAlert.show(
                                                                        context: context,
                                                                        type: CoolAlertType.warning,
                                                                        showCancelBtn: true,
                                                                        confirmBtnColor: HexColor("#3D8361"),
                                                                        title: "Warning",
                                                                        text: "xxxxxxxxxx",
                                                                        // barrierDismissible:
                                                                        //     false,
                                                                        cancelBtnText: "Cancel",
                                                                        onCancelBtnTap: () {},
                                                                        confirmBtnText: "Confirm",
                                                                        closeOnConfirmBtnTap: false,
                                                                        onConfirmBtnTap: () {});
                                                                  },
                                                                  child: Column(
                                                                    children: <
                                                                        Widget>[
                                                                      Icon(
                                                                          Icons
                                                                              .check,
                                                                          color:
                                                                              HexColor("#3D8361")),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(vertical: 2.0),
                                                                      ),
                                                                      Text(
                                                                        'Activate',
                                                                        style: TextStyle(
                                                                            color:
                                                                                HexColor("#3D8361")),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ));
                                          }))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
