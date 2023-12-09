part of '../../auth.dart';

class AdminTransaction extends StatefulWidget {
  @override
  AdminTransactionState createState() => AdminTransactionState();
}

class AdminTransactionState extends State<AdminTransaction> {
  int _count = 1;
  String? selectedLocation; // Menyimpan lokasi yang dipilih
  String? selectedLocationId; // Menyimpan lokasi yang dipilih
  // DataMitraHome? dataMitraHomehistory;

  // AdminLokasi? adminLokasi;
  List<String>? dataMitraHomehistory = ["Mitra 1", "Mitra 2"];

  AdminDropspotModel? adminDropspot;

  void initState() {
    super.initState();
    // getDataLogin();
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
          "Transaction History",
          style: GoogleFonts.poppins(
              color: Colors.black,
              // fontSize: displayHeight(context) * 0.02,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: displayHeight(context) * 0.875,
            child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
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
                          text: "       Mitra       ",
                        ),
                        Tab(
                          text: "       User       ",
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        Center(
                          child: Column(children: [
                            Container(
                                height: displayHeight(context) * 0.812,
                                width: displayHeight(context) * 0.56,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: displayHeight(context) * 0.03,
                                    ),
                                    Container(
                                      width: displayHeight(context) * 0.4,
                                      height: displayHeight(context) * 0.3,
                                      decoration: BoxDecoration(
                                        color: HexColor("#D6CDA4"),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height:
                                                  displayHeight(context) * 0.03,
                                            ),
                                            Container(
                                              height:
                                                  displayHeight(context) * 0.07,
                                              width:
                                                  displayHeight(context) * 0.3,
                                              decoration: BoxDecoration(
                                                  color: HexColor("#3D8361"),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: DropdownButton<String>(
                                                hint: Text(
                                                  '   Select Mitra',
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      // fontSize: displayHeight(context) * 0.035,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                value: selectedLocationId,
                                                items: dataMitraHomehistory
                                                    ?.map((item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item.toString(),
                                                    child:
                                                        Text(item.toString()),
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedLocationId = value;
                                                  });
                                                  print(
                                                      'Selected ID: $selectedLocationId');
                                                },
                                                style: TextStyle(
                                                  color: Colors
                                                      .white, // Ubah warna teks tombol dropdown
                                                  fontSize:
                                                      16.0, // Ubah ukuran teks tombol dropdown
                                                  fontWeight: FontWeight
                                                      .bold, // Ubah gaya teks tombol dropdown
                                                ),
                                                dropdownColor: HexColor(
                                                    "#3D8361"), // Ubah warna latar belakang dropdown
                                                elevation:
                                                    2, // Ubah tinggi bayangan dropdown
                                                icon: Icon(
                                                  Icons
                                                      .arrow_drop_down, // Ubah ikon dropdown
                                                  color: Colors
                                                      .white, // Ubah warna ikon dropdown
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  displayHeight(context) * 0.03,
                                            ),
                                            Container(
                                              height:
                                                  displayHeight(context) * 0.07,
                                              width:
                                                  displayHeight(context) * 0.3,
                                              decoration: BoxDecoration(
                                                  color: HexColor("#3D8361"),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: DropdownButton<String>(
                                                hint: Text(
                                                  '   Select Date',
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      // fontSize: displayHeight(context) * 0.035,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                value: selectedLocationId,
                                                items: dataMitraHomehistory
                                                    ?.map((item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item.toString(),
                                                    child:
                                                        Text(item.toString()),
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedLocationId = value;
                                                  });
                                                  print(
                                                      'Selected ID: $selectedLocationId');
                                                },
                                                style: TextStyle(
                                                  color: Colors
                                                      .white, // Ubah warna teks tombol dropdown
                                                  fontSize:
                                                      16.0, // Ubah ukuran teks tombol dropdown
                                                  fontWeight: FontWeight
                                                      .bold, // Ubah gaya teks tombol dropdown
                                                ),
                                                dropdownColor: HexColor(
                                                    "#3D8361"), // Ubah warna latar belakang dropdown
                                                elevation:
                                                    2, // Ubah tinggi bayangan dropdown
                                                icon: Icon(
                                                  Icons
                                                      .arrow_drop_down, // Ubah ikon dropdown
                                                  color: Colors
                                                      .white, // Ubah warna ikon dropdown
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                          ]),
                        ),
                        Center(
                          child: Column(children: [
                            Container(
                                height: displayHeight(context) * 0.812,
                                width: displayHeight(context) * 0.56,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: displayHeight(context) * 0.03,
                                    ),
                                    Container(
                                      width: displayHeight(context) * 0.4,
                                      height: displayHeight(context) * 0.3,
                                      decoration: BoxDecoration(
                                        color: HexColor("#D6CDA4"),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height:
                                                  displayHeight(context) * 0.03,
                                            ),
                                            Container(
                                              height:
                                                  displayHeight(context) * 0.07,
                                              width:
                                                  displayHeight(context) * 0.3,
                                              decoration: BoxDecoration(
                                                  color: HexColor("#3D8361"),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: DropdownButton<String>(
                                                hint: Text(
                                                  '   Select Mitra',
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      // fontSize: displayHeight(context) * 0.035,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                value: selectedLocationId,
                                                items: dataMitraHomehistory
                                                    ?.map((item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item.toString(),
                                                    child:
                                                        Text(item.toString()),
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedLocationId = value;
                                                  });
                                                  print(
                                                      'Selected ID: $selectedLocationId');
                                                },
                                                style: TextStyle(
                                                  color: Colors
                                                      .white, // Ubah warna teks tombol dropdown
                                                  fontSize:
                                                      16.0, // Ubah ukuran teks tombol dropdown
                                                  fontWeight: FontWeight
                                                      .bold, // Ubah gaya teks tombol dropdown
                                                ),
                                                dropdownColor: HexColor(
                                                    "#3D8361"), // Ubah warna latar belakang dropdown
                                                elevation:
                                                    2, // Ubah tinggi bayangan dropdown
                                                icon: Icon(
                                                  Icons
                                                      .arrow_drop_down, // Ubah ikon dropdown
                                                  color: Colors
                                                      .white, // Ubah warna ikon dropdown
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  displayHeight(context) * 0.03,
                                            ),
                                            Container(
                                              height:
                                                  displayHeight(context) * 0.07,
                                              width:
                                                  displayHeight(context) * 0.3,
                                              decoration: BoxDecoration(
                                                  color: HexColor("#3D8361"),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: DropdownButton<String>(
                                                hint: Text(
                                                  '   Select Date',
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      // fontSize: displayHeight(context) * 0.035,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                value: selectedLocationId,
                                                items: dataMitraHomehistory
                                                    ?.map((item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item.toString(),
                                                    child:
                                                        Text(item.toString()),
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedLocationId = value;
                                                  });
                                                  print(
                                                      'Selected ID: $selectedLocationId');
                                                },
                                                style: TextStyle(
                                                  color: Colors
                                                      .white, // Ubah warna teks tombol dropdown
                                                  fontSize:
                                                      16.0, // Ubah ukuran teks tombol dropdown
                                                  fontWeight: FontWeight
                                                      .bold, // Ubah gaya teks tombol dropdown
                                                ),
                                                dropdownColor: HexColor(
                                                    "#3D8361"), // Ubah warna latar belakang dropdown
                                                elevation:
                                                    2, // Ubah tinggi bayangan dropdown
                                                icon: Icon(
                                                  Icons
                                                      .arrow_drop_down, // Ubah ikon dropdown
                                                  color: Colors
                                                      .white, // Ubah warna ikon dropdown
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                          ]),
                        )
                      ]),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
