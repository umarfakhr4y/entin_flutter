part of '../../auth.dart';

class mitraOrder extends StatefulWidget {
  @override
  final int idOper;
  const mitraOrder({required this.idOper});
  mitraOrderState createState() => mitraOrderState();
}

class mitraOrderState extends State<mitraOrder> {
  int _count = 1;
  DataOrderMitra? dataOrderMitra;
  DataOrderMitraRequest? dataOrderMitrareq;
  DataOrderMitraOnProgress? dataOrderMitraOnProgress;
  DataOrderMitraComplete? dataOrderMitraComplete;
  // DataOrderMitra? dataOrderMitra;
  // DataOrderMitra? dataOrderMitra;

  void initState() {
    super.initState();
    print(widget.idOper);
    getOrder();
    getOrderReq();
    getOrderOnProg();
    getOrderCompl();
    // getDataLogin();
  }

  // void klikLogout() {
  //   logOut();
  // }
  void getOrder() {
    getMitraOrderRecent(widget.idOper).then((value) {
      setState(() {
        dataOrderMitra = value;
        if (dataOrderMitra != null) {
          print("rece ga kososng");
        } else {
          print("rece kosong");
        }
      });
    });
  }

  void getOrderReq() {
    getMitraOrderRequest(widget.idOper).then((value) {
      setState(() {
        dataOrderMitrareq = value;
        if (dataOrderMitrareq != null) {
          print("req ga kososng");
          print(dataOrderMitrareq!.user.length);
        } else {
          print("req kosong");
        }
      });
    });
  }

  void getOrderOnProg() {
    getMitraOrderOnProgress(widget.idOper).then((value) {
      setState(() {
        dataOrderMitraOnProgress = value;
        if (dataOrderMitraOnProgress != null) {
          print("onprog ga kososng");
          print(dataOrderMitraOnProgress!.user.length);
        } else {
          print("onprog kosong");
        }
      });
    });
  }

  void getOrderCompl() {
    getMitraOrderComplete(widget.idOper).then((value) {
      setState(() {
        dataOrderMitraComplete = value;
        if (dataOrderMitraComplete != null) {
          print("onprog ga kososng");
          print(dataOrderMitraComplete!.user.length);
        } else {
          print("onprog kosong");
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
          "Order",
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
          Padding(
            padding: EdgeInsets.only(left: displayHeight(context) * 0.04),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Latest Review From Your Costumer",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: displayHeight(context) * 0.02,
                ),
              ),
            ),
          ),
          SizedBox(
            height: displayHeight(context) * 0.015,
          ),
          Container(
            // padding: const EdgeInsets.all(8.0),
            color: HexColor("#EEF2E6"),
            width: displayHeight(context) * 0.6,
            height: displayHeight(context) * 0.83,
            child: DefaultTabController(
              length: 4,
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
                        text: "  Recent  ",
                      ),
                      Tab(
                        text: "  Requested  ",
                      ),
                      Tab(
                        text: "  On Progress  ",
                      ),
                      Tab(
                        text: "  Complete  ",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    displayHeight(context) * 0.04,
                                    displayHeight(context) * 0.02,
                                    0,
                                    0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Recent Order",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: displayHeight(context) * 0.02,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: dataOrderMitra == null
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
                                              dataOrderMitra?.user.length,
                                          itemBuilder: (context, i) {
                                            var order = dataOrderMitra?.user[i];
                                            var makanan =
                                                dataOrderMitra?.user[i].makanan;
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
                                                        "Order #" +
                                                            order!.noOrder,
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
                                                            order.createdAt
                                                                    .toString()
                                                                    .substring(
                                                                        0,
                                                                        10) ??
                                                                'null',
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
                                                                order.status,
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
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 3.0,
                                                                vertical: 3.0,
                                                              ),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(
                                                                        displayHeight(context) *
                                                                            0.018,
                                                                        displayHeight(context) *
                                                                            0.018,
                                                                        displayHeight(context) *
                                                                            0.018,
                                                                        displayHeight(context) *
                                                                            0.018),
                                                                    child: ListTile(
                                                                        leading: CircleAvatar(),
                                                                        title: Text(
                                                                          makanan!
                                                                              .nameBarang,
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                displayHeight(context) * 0.023,
                                                                          ),
                                                                        ),
                                                                        subtitle: Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "Rp. " + makanan.hargaBarang.toString(),
                                                                              style: GoogleFonts.poppins(
                                                                                color: HexColor("#505050"),
                                                                                fontSize: displayHeight(context) * 0.018,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              "Qty: " + order.quantity.toString(),
                                                                              style: GoogleFonts.poppins(
                                                                                color: HexColor("#505050"),
                                                                                fontSize: displayHeight(context) * 0.018,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                ],
                                                              )),
                                                        ),
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
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    displayHeight(context) * 0.04,
                                    displayHeight(context) * 0.02,
                                    0,
                                    0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Requested Order",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: displayHeight(context) * 0.02,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: dataOrderMitrareq == null
                                      ? Center(
                                          child: Scaffold(
                                          backgroundColor: HexColor("#EEF2E6"),
                                          body: Center(
                                              child: Text(
                                            "No Request Order",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize:
                                                  displayHeight(context) * 0.02,
                                            ),
                                          )),
                                        ))
                                      : ListView.builder(
                                          itemCount:
                                              dataOrderMitrareq?.user.length,
                                          itemBuilder: (context, i) {
                                            var order =
                                                dataOrderMitrareq?.user[i];
                                            var makanan = dataOrderMitrareq
                                                ?.user[i].makanan;
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
                                                        "Order #" +
                                                            order!.noOrder,
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
                                                            order.createdAt ??
                                                                'null',
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
                                                                order.status,
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
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 3.0,
                                                                vertical: 3.0,
                                                              ),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(
                                                                        displayHeight(context) *
                                                                            0.018,
                                                                        displayHeight(context) *
                                                                            0.018,
                                                                        displayHeight(context) *
                                                                            0.018,
                                                                        displayHeight(context) *
                                                                            0.018),
                                                                    child: ListTile(
                                                                        leading: CircleAvatar(),
                                                                        title: Text(
                                                                          makanan!
                                                                              .nameBarang,
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                displayHeight(context) * 0.023,
                                                                          ),
                                                                        ),
                                                                        subtitle: Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "Rp. " + makanan.hargaBarang.toString(),
                                                                              style: GoogleFonts.poppins(
                                                                                color: HexColor("#505050"),
                                                                                fontSize: displayHeight(context) * 0.018,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              "Qty: " + order.quantity.toString(),
                                                                              style: GoogleFonts.poppins(
                                                                                color: HexColor("#505050"),
                                                                                fontSize: displayHeight(context) * 0.018,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                ],
                                                              )),
                                                        ),
                                                        ButtonBar(
                                                          alignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          buttonHeight:
                                                              displayHeight(
                                                                      context) *
                                                                  0.005,
                                                          buttonMinWidth: 90.0,
                                                          children: <Widget>[
                                                            GestureDetector(
                                                              onTap: () {},
                                                              child: Column(
                                                                children: <
                                                                    Widget>[
                                                                  Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: HexColor(
                                                                          "#3D8361")),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        vertical:
                                                                            2.0),
                                                                  ),
                                                                  Text(
                                                                    'Accept',
                                                                    style: TextStyle(
                                                                        color: HexColor(
                                                                            "#3D8361")),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
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
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    displayHeight(context) * 0.04,
                                    displayHeight(context) * 0.02,
                                    0,
                                    0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "On Progress Order",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: displayHeight(context) * 0.02,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: dataOrderMitraOnProgress == null
                                      ? Center(
                                          child: Scaffold(
                                          backgroundColor: HexColor("#EEF2E6"),
                                          body: Center(
                                              child: Text(
                                            "No On Progress Order",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize:
                                                  displayHeight(context) * 0.02,
                                            ),
                                          )),
                                        ))
                                      : ListView.builder(
                                          itemCount: dataOrderMitraOnProgress
                                              ?.user.length,
                                          itemBuilder: (context, i) {
                                            var order = dataOrderMitraOnProgress
                                                ?.user[i];
                                            var makanan =
                                                dataOrderMitraOnProgress
                                                    ?.user[i].makanan;
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
                                                        "Order #" +
                                                            order!.noOrder,
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
                                                            order.createdAt ??
                                                                'null',
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
                                                                order.status,
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
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 3.0,
                                                                vertical: 3.0,
                                                              ),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(
                                                                        displayHeight(context) *
                                                                            0.018,
                                                                        displayHeight(context) *
                                                                            0.018,
                                                                        displayHeight(context) *
                                                                            0.018,
                                                                        displayHeight(context) *
                                                                            0.018),
                                                                    child: ListTile(
                                                                        leading: CircleAvatar(),
                                                                        title: Text(
                                                                          makanan!
                                                                              .nameBarang,
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                displayHeight(context) * 0.023,
                                                                          ),
                                                                        ),
                                                                        subtitle: Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "Rp. " + makanan.hargaBarang.toString(),
                                                                              style: GoogleFonts.poppins(
                                                                                color: HexColor("#505050"),
                                                                                fontSize: displayHeight(context) * 0.018,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              "Qty: " + order.quantity.toString(),
                                                                              style: GoogleFonts.poppins(
                                                                                color: HexColor("#505050"),
                                                                                fontSize: displayHeight(context) * 0.018,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                ],
                                                              )),
                                                        ),
                                                        ButtonBar(
                                                          alignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          buttonHeight:
                                                              displayHeight(
                                                                      context) *
                                                                  0.005,
                                                          buttonMinWidth: 90.0,
                                                          children: <Widget>[
                                                            GestureDetector(
                                                              onTap: () {},
                                                              child: Column(
                                                                children: <
                                                                    Widget>[
                                                                  Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: HexColor(
                                                                          "#3D8361")),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        vertical:
                                                                            2.0),
                                                                  ),
                                                                  Text(
                                                                    'Deliver',
                                                                    style: TextStyle(
                                                                        color: HexColor(
                                                                            "#3D8361")),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
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
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    displayHeight(context) * 0.04,
                                    displayHeight(context) * 0.02,
                                    0,
                                    0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Complete Order",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: displayHeight(context) * 0.02,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: dataOrderMitraComplete == null
                                      ? Center(
                                          child: Scaffold(
                                          backgroundColor: HexColor("#EEF2E6"),
                                          body: Center(
                                              child: Text(
                                            "No Complete Order",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize:
                                                  displayHeight(context) * 0.02,
                                            ),
                                          )),
                                        ))
                                      : ListView.builder(
                                          itemCount: dataOrderMitraComplete
                                              ?.user.length,
                                          itemBuilder: (context, i) {
                                            var order =
                                                dataOrderMitraComplete?.user[i];
                                            var makanan = dataOrderMitraComplete
                                                ?.user[i].makanan;
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
                                                        "Order #" +
                                                            order!.noOrder,
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
                                                            order.createdAt
                                                                    .toString()
                                                                    .substring(
                                                                        0,
                                                                        10) ??
                                                                'null',
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
                                                                order.status,
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
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 3.0,
                                                                vertical: 3.0,
                                                              ),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(
                                                                        displayHeight(context) *
                                                                            0.018,
                                                                        displayHeight(context) *
                                                                            0.018,
                                                                        displayHeight(context) *
                                                                            0.018,
                                                                        displayHeight(context) *
                                                                            0.018),
                                                                    child: ListTile(
                                                                        leading: CircleAvatar(),
                                                                        title: Text(
                                                                          makanan!
                                                                              .nameBarang,
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                displayHeight(context) * 0.023,
                                                                          ),
                                                                        ),
                                                                        subtitle: Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "Rp. " + makanan.hargaBarang.toString(),
                                                                              style: GoogleFonts.poppins(
                                                                                color: HexColor("#505050"),
                                                                                fontSize: displayHeight(context) * 0.018,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              "Qty: " + order.quantity.toString(),
                                                                              style: GoogleFonts.poppins(
                                                                                color: HexColor("#505050"),
                                                                                fontSize: displayHeight(context) * 0.018,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                ],
                                                              )),
                                                        ),
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
