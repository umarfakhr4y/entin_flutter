part of '../auth.dart';

class spesificRestoPengguna extends StatefulWidget {
  @override
  final int idOper;
  // final int userid_oper;
  const spesificRestoPengguna({required this.idOper});
  spesificRestoPenggunaState createState() => spesificRestoPenggunaState();
}

class spesificRestoPenggunaState extends State<spesificRestoPengguna> {
  int _count = 1;
  int idBaru = 0;
  TabController? _tabController;

  // Map<String, dynamic>? restoSpecbyId;
  RestoSpecbyId? restoSpecbyId;

  void initState() {
    super.initState();
    idBaru = widget.idOper;
    getRestoSpec();
  }

  void getRestoSpec() {
    getRestoID().getSpecRestoVmodel(widget.idOper).then((value) {
      setState(() {
        restoSpecbyId = value;
      });
      if (restoSpecbyId == null) {
        print("kosong");
      } else {
        print('ga kosong');
      }
    });
  }
  // void getDataLogin() {
  //   UserViewModel().getUser().then((value) {
  //     setState(() {
  //       dataLogin = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: _buildWidget());
  }

  Widget _buildWidget() {
    return restoSpecbyId == null
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
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 25,
                    color: Colors.black,
                  ),
                  tooltip: 'Go to the next page',
                  onPressed: () {},
                ),
              ],
            ),
            body: Center(
                child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent],
                          ).createShader(Rect.fromLTRB(0, 0, rect.width, 230));
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image.network(
                          'http://192.168.100.2:8000/bannerMitraRestoran/${restoSpecbyId?.user.first.data.first.bannerRestoran}',
                          fit: BoxFit.cover,
                          height: displayHeight(context) * 0.4,
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          displayHeight(context) * 0.05,
                          0,
                          0,
                          displayHeight(context) * 0.03),
                      child: Text(
                        // "asd",
                        "${restoSpecbyId?.user.first.data.first.nameRestoran}",
                        // restoSpecbyId!.user.first.alamat ??
                        //     'null',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: displayHeight(context) * 0.045,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Container(
                  // padding: const EdgeInsets.all(8.0),
                  color: HexColor("#EEF2E6"),
                  width: displayHeight(context) * 0.6,
                  height: displayHeight(context) * 0.6,
                  child: ContainedTabBarView(
                    tabs: [
                      Text(
                        "Food",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: displayHeight(context) * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Drink",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: displayHeight(context) * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                    tabBarProperties: TabBarProperties(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0.0,
                        vertical: 8.0,
                      ),
                      background: Container(
                        height: displayHeight(context) * 0.065,
                        width: displayHeight(context) * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: HexColor("#3D8361"),
                        ),
                      ),
                      indicator: ContainerTabIndicator(
                        radius: BorderRadius.circular(20),
                        color: HexColor("#14633C"),
                        // borderWidth: 2.0,
                        borderColor: Colors.black,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: HexColor("#3D8361"),
                    ),
                    views: [
                      Container(
                          height: 20,
                          color: HexColor("#EEF2E6"),
                          child: Padding(
                            padding:
                                EdgeInsets.all(displayHeight(context) * 0.025),
                            child: Expanded(
                                child: ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    itemCount: restoSpecbyId
                                        ?.user.first.data.first.makanan.length,
                                    itemBuilder: (context, i) {
                                      return Column(
                                        children: [
                                          SizedBox(
                                            height:
                                                displayHeight(context) * 0.2,
                                            width:
                                                displayHeight(context) * 0.48,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: HexColor("#D6CDA4"),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      displayHeight(context) *
                                                          0.02),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: displayHeight(
                                                                context) *
                                                            0.15,
                                                        width: displayHeight(
                                                                context) *
                                                            0.15,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            // color: Colors.lightBlue[100],
                                                            image:
                                                                new DecorationImage(
                                                              image:
                                                                  new ExactAssetImage(
                                                                'assets/images/pengguna/makanan/test1.png',
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: EdgeInsets.fromLTRB(
                                                              displayHeight(
                                                                      context) *
                                                                  0.015,
                                                              displayHeight(
                                                                      context) *
                                                                  0.015,
                                                              0,
                                                              displayHeight(
                                                                      context) *
                                                                  0.015),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    restoSpecbyId
                                                                            ?.user
                                                                            .first
                                                                            .data
                                                                            .first
                                                                            .makanan[i]
                                                                            .nameBarang ??
                                                                        'null',
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            displayHeight(context) *
                                                                                0.02,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: displayHeight(
                                                                            context) *
                                                                        0.05,
                                                                  ),
                                                                  Text(
                                                                    "${restoSpecbyId?.user.first.data.first.makanan[i].hargaBarang.toString().substring(0, 2)} K" ??
                                                                        'null',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            displayHeight(context) *
                                                                                0.02,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: displayHeight(
                                                                        context) *
                                                                    0.05,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: <
                                                                    Widget>[
                                                                  SizedBox(
                                                                    width: displayHeight(
                                                                            context) *
                                                                        0.1,
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      if (_count <=
                                                                          0) {
                                                                      } else {
                                                                        setState(
                                                                            () {
                                                                          _count -=
                                                                              1;
                                                                        });
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              0.1),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: HexColor(
                                                                            "#3D8361"),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border:
                                                                            Border.all(),
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .remove,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          15.0),
                                                                  Text(
                                                                      "$_count"),
                                                                  SizedBox(
                                                                      width:
                                                                          15.0),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      if (_count >=
                                                                          5) {
                                                                      } else {
                                                                        setState(
                                                                            () {
                                                                          _count +=
                                                                              1;
                                                                        });
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              0.1),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: HexColor(
                                                                            "#3D8361"),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border:
                                                                            Border.all(),
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: Colors
                                                                            .white,
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
                                            height:
                                                displayHeight(context) * 0.02,
                                          ),
                                        ],
                                      );
                                    })),
                          )),
                      ///////////////////////////////////////////////////////////////////////////////////////
                      Container(
                          height: 20,
                          color: HexColor("#EEF2E6"),
                          child: Padding(
                            padding:
                                EdgeInsets.all(displayHeight(context) * 0.025),
                            child: Expanded(
                                child: ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    itemCount: restoSpecbyId
                                        ?.user.first.data.first.minuman.length,
                                    itemBuilder: (context, i) {
                                      return Column(
                                        children: [
                                          SizedBox(
                                            height:
                                                displayHeight(context) * 0.2,
                                            width:
                                                displayHeight(context) * 0.48,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: HexColor("#D6CDA4"),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      displayHeight(context) *
                                                          0.02),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: displayHeight(
                                                                context) *
                                                            0.15,
                                                        width: displayHeight(
                                                                context) *
                                                            0.15,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            // color: Colors.lightBlue[100],
                                                            image:
                                                                new DecorationImage(
                                                              image:
                                                                  new ExactAssetImage(
                                                                'assets/images/pengguna/makanan/test1.png',
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: EdgeInsets.fromLTRB(
                                                              displayHeight(
                                                                      context) *
                                                                  0.015,
                                                              displayHeight(
                                                                      context) *
                                                                  0.015,
                                                              0,
                                                              displayHeight(
                                                                      context) *
                                                                  0.015),
                                                          child: Column(
                                                            // mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    restoSpecbyId
                                                                            ?.user
                                                                            .first
                                                                            .data
                                                                            .first
                                                                            .minuman[i]
                                                                            .nameBarang ??
                                                                        'null',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            displayHeight(context) *
                                                                                0.02,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: displayHeight(
                                                                            context) *
                                                                        0.12,
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                    child: Text(
                                                                      "${restoSpecbyId?.user.first.data.first.minuman[i].hargaBarang.toString().substring(0, 1)} K" ??
                                                                          'null',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: GoogleFonts.poppins(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize: displayHeight(context) *
                                                                              0.02,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: displayHeight(
                                                                        context) *
                                                                    0.05,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: <
                                                                    Widget>[
                                                                  SizedBox(
                                                                    width: displayHeight(
                                                                            context) *
                                                                        0.1,
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      if (_count <=
                                                                          0) {
                                                                      } else {
                                                                        setState(
                                                                            () {
                                                                          _count -=
                                                                              1;
                                                                        });
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              0.1),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: HexColor(
                                                                            "#3D8361"),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border:
                                                                            Border.all(),
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .remove,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          15.0),
                                                                  Text(
                                                                      "$_count"),
                                                                  SizedBox(
                                                                      width:
                                                                          15.0),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      if (_count >=
                                                                          5) {
                                                                      } else {
                                                                        setState(
                                                                            () {
                                                                          _count +=
                                                                              1;
                                                                        });
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              0.1),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: HexColor(
                                                                            "#3D8361"),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border:
                                                                            Border.all(),
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: Colors
                                                                            .white,
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
                                            height:
                                                displayHeight(context) * 0.02,
                                          ),
                                        ],
                                      );
                                    })),
                          )),
                    ],
                    onChange: (index) => print(index),
                  ),
                ),
              ],
            )),
          );
  }
}
