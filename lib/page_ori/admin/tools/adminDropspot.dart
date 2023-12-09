part of '../../auth.dart';

class AdminDropspot extends StatefulWidget {
  @override
  AdminDropspotState createState() => AdminDropspotState();
}

class AdminDropspotState extends State<AdminDropspot> {
  int _count = 1;
  String? selectedLocation; // Menyimpan lokasi yang dipilih
  String? selectedLocationId; // Menyimpan lokasi yang dipilih

  // AdminLokasi? adminLokasi;
  String? _penitipFix;
  List<String>? adminLokasi = [];
  List<String>? adminLokasiId = [];
  List<dynamic>? _dataPeniitip;

  AdminDropspotModel? adminDropspot;

  void initState() {
    super.initState();
    getLokasiListV();
    getLokasiListIdV();
    getDropspots();
    // getMitraList();
    // getDataLogin();
  }

  void getDropspots() {
    getDropspot().then((value) {
      setState(() {
        adminDropspot = value;
      });
      // print(dataMitraHome?.success.first.alamatRestoran);
    });
  }

  void getLokasiListV() {
    getLokasiList().then((value) {
      setState(() {
        adminLokasi = value;
      });
      // print(dataMitraHome?.success.first.alamatRestoran);
    });
  }

  void getLokasiListIdV() {
    getLokasiListid().then((value) {
      setState(() {
        adminLokasiId = value;
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
          "Dropspot",
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
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Select Location",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: displayHeight(context) * 0.035,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 50,
                    width: displayHeight(context) * 0.38,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(displayHeight(context) * 0.05),
                      color: HexColor("#3D8361"),
                    ),
                    child: DropdownButton<String>(
                      hint: Text(
                        'Select Location',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            // fontSize: displayHeight(context) * 0.035,
                            fontWeight: FontWeight.w500),
                      ),
                      value: selectedLocationId,
                      items: adminLokasi?.map((item) {
                        return DropdownMenuItem<String>(
                          value: item.toString(),
                          child: Text(item.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedLocationId = value;
                        });
                        print('Selected ID: $selectedLocationId');
                      },
                      style: TextStyle(
                        color: Colors.white, // Ubah warna teks tombol dropdown
                        fontSize: 16.0, // Ubah ukuran teks tombol dropdown
                        fontWeight:
                            FontWeight.bold, // Ubah gaya teks tombol dropdown
                      ),
                      dropdownColor: HexColor(
                          "#3D8361"), // Ubah warna latar belakang dropdown
                      elevation: 2, // Ubah tinggi bayangan dropdown
                      icon: Icon(
                        Icons.arrow_drop_down, // Ubah ikon dropdown
                        color: Colors.white, // Ubah warna ikon dropdown
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Divider(thickness: 1),
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: (selectedLocationId == null)
                          ? Container(
                              child: Center(
                                child: Text(""),
                              ),
                            )
                          : Container(
                              height: displayHeight(context) * 0.1,
                              width: displayHeight(context) * 0.45,
                              decoration: BoxDecoration(
                                  color: HexColor("#3D8361"),
                                  borderRadius: BorderRadius.circular(
                                      displayHeight(context) * 0.025)),
                              child: (selectedLocationId == null)
                                  ? Container(
                                      child: Center(
                                        child: Text(
                                          "Select Location First",
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              // fontSize: displayHeight(context) * 0.035,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                        "Add Spot",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            // fontSize: displayHeight(context) * 0.035,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                            )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        displayHeight(context) * 0.05,
                        displayHeight(context) * 0.035,
                        displayHeight(context) * 0.015,
                        displayHeight(context) * 0.015),
                    child: (selectedLocationId == null)
                        ? Container(
                            child: Center(
                              child: Text(""),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Spot List",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    // fontSize: displayHeight(context) * 0.035,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                  ),
                  Expanded(
                      child: (selectedLocationId == null)
                          ? Container(
                              child: Center(
                                child: Text(
                                  "Select Location First",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      // fontSize: displayHeight(context) * 0.035,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: adminDropspot?.success.length,
                              itemBuilder: (context, i) {
                                var dropspot = adminDropspot?.success[i];
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              displayHeight(context) * 0.02),
                                      child: Column(
                                        children: [
                                          Card(
                                            margin: EdgeInsets.fromLTRB(
                                                displayHeight(context) * 0.04,
                                                0,
                                                displayHeight(context) * 0.04,
                                                0),
                                            color: HexColor("#D6CDA4"),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                ListTile(
                                                    leading: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: displayHeight(
                                                                  context) *
                                                              0.01,
                                                        ),
                                                        child: Icon(
                                                            Icons.location_on)),
                                                    title: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0,
                                                              displayHeight(
                                                                      context) *
                                                                  0.02,
                                                              0,
                                                              displayHeight(
                                                                      context) *
                                                                  0.005),
                                                      child: Text(
                                                          selectedLocationId ??
                                                              'null',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color: Colors.black,
                                                            fontSize:
                                                                displayHeight(
                                                                        context) *
                                                                    0.02,
                                                          )),
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
                                                            dropspot!
                                                                .namaDropspot,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  displayHeight(
                                                                          context) *
                                                                      0.02,
                                                            )),
                                                      ],
                                                    )),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0,
                                                              0,
                                                              displayHeight(
                                                                      context) *
                                                                  0.02,
                                                              displayHeight(
                                                                      context) *
                                                                  0.01),
                                                      child: Text(
                                                          dropspot.createdAt
                                                              .toString()
                                                              .substring(0, 11),
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color:
                                                                Colors.black45,
                                                            fontSize:
                                                                displayHeight(
                                                                        context) *
                                                                    0.015,
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              }))
                ],
              ))
        ],
      ),
    );
  }
}
