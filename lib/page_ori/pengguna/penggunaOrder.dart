part of '../auth.dart';

class penggunaOrder extends StatefulWidget {
  @override
  final int idOper;
  const penggunaOrder({required this.idOper});
  penggunaOrderState createState() => penggunaOrderState();
}

class penggunaOrderState extends State<penggunaOrder> {
  int _count = 1;

  DataOrderPengguna? dataOrderPengguna;
  DataOrderPenggunaComplete? dataOrderPenggunaComplete;

  void initState() {
    super.initState();
    print(widget.idOper);
    getOrder();
    getCompleteOrder();
    // getDataLogin();
  }

  // void klikLogout() {
  //   logOut();
  // }
  void getOrder() {
    getPenggunaOrder(widget.idOper).then((value) {
      setState(() {
        dataOrderPengguna = value;
        if (dataOrderPengguna != null) {
          print("ga kososng");
        } else {
          print("kosong");
        }
      });
    });
  }

  void getCompleteOrder() {
    getPenggunaOrderComplete(widget.idOper).then((value) {
      // print(widget.idOper);
      setState(() {
        dataOrderPenggunaComplete = value;
        if (dataOrderPenggunaComplete != null) {
          print("ga kososng complete");
        } else {
          print("kosong complete");
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
              length: 2,
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
                        text: "    Recent    ",
                      ),
                      Tab(
                        text: "    History    ",
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
                                    displayHeight(context) * 0.02),
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
                                  child: dataOrderPengguna == null
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
                                              dataOrderPengguna?.user.length,
                                          itemBuilder: (context, i) {
                                            var order =
                                                dataOrderPengguna?.user[i];
                                            var makanan = dataOrderPengguna
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
                                                            order.data
                                                                .nameRestoran,
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
                                                                              "Qty: 1",
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
                                    displayHeight(context) * 0.02),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Completed Order",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: displayHeight(context) * 0.02,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: dataOrderPenggunaComplete == null
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
                                          itemCount: dataOrderPenggunaComplete
                                              ?.user.length,
                                          itemBuilder: (context, i) {
                                            var order =
                                                dataOrderPenggunaComplete
                                                    ?.user[i];
                                            var makanan =
                                                dataOrderPenggunaComplete
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
                                                                              "Qty: 1",
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
