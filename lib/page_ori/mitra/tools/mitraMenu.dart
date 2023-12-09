part of '../../auth.dart';

class mitraMenu extends StatefulWidget {
  @override
  final int idOper;
  final int iddataOper;
  const mitraMenu({required this.idOper, required this.iddataOper});
  mitraMenuState createState() => mitraMenuState();
}

class mitraMenuState extends State<mitraMenu> {
  TextEditingController resto_name = TextEditingController();
  TextEditingController resto_notelp = TextEditingController();
  TextEditingController resto_alamat = TextEditingController();

  TextEditingController name_makan = TextEditingController();
  TextEditingController stock_makan = TextEditingController();
  TextEditingController jenis_makan = TextEditingController();
  TextEditingController harga_makan = TextEditingController();

  TextEditingController name_minum = TextEditingController();
  TextEditingController stock_minum = TextEditingController();
  TextEditingController jenis_minum = TextEditingController();
  TextEditingController harga_minum = TextEditingController();

  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  RestoSpecbyId? restoSpecbyId;
  DataResto? dataResto;
  int? idData;
  var idMakanan;
  var idMinuman;

  void initState() {
    super.initState();
    ambilMenu();
    ambilDataResto();
  }

  void klikLogout() {
    logOut();
  }

  void ambilMenu() {
    getMenu(widget.idOper).then((value) {
      // print(widget.idOper);
      setState(() {
        restoSpecbyId = value;
        idData = restoSpecbyId?.user.first.data.first.id;
      });
      if (restoSpecbyId == null) {
        print("kosong");
      } else {
        print('ga kosong');
      }
    });
  }

  void ambilDataResto() {
    // return print(widget.iddataOper);
    getData(widget.iddataOper).then((value) {
      // print(widget.idOper);
      setState(() {
        dataResto = value;
      });
      if (dataResto == null) {
        print("kosong coy");
      } else {
        resto_name.text = dataResto!.data.nameRestoran;
        resto_alamat.text = dataResto!.data.alamatRestoran;
        resto_notelp.text = dataResto!.data.notelpRestoran;
      }
    });
  }

  void klikeditData() {
    editData(widget.iddataOper, resto_name.text, resto_alamat.text,
            resto_notelp.text)
        .then((value) {
      setState(() {
        // restoSpecbyId = value;
        if (value == "sukses") {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            showCancelBtn: false,
            confirmBtnText: "OK",
            closeOnConfirmBtnTap: true,
            title: "Success",
            text: "Success Editing Restaurant Information",
            // barrierDismissible:
            //     false,

            autoCloseDuration: Duration(seconds: 2),
          );
        }
      });
    });
  }

  void klikeditMakanan() {
    // return print(idMakanan);
    editMakanan(idMakanan, name_makan.text, stock_makan.text, jenis_makan.text,
            harga_makan.text)
        .then((value) {
      setState(() {
        // restoSpecbyId = value;
        if (value == "sukses") {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            showCancelBtn: false,
            confirmBtnText: "OK",
            closeOnConfirmBtnTap: true,
            title: "Success",
            text: "Success Editing Food",
            // barrierDismissible:
            //     false,

            autoCloseDuration: Duration(seconds: 2),
          );
        }
      });
    });
  }

  void klikeditMinuman() {
    // return print(idMakanan);
    editMinuman(idMinuman, name_minum.text, stock_minum.text, jenis_minum.text,
            harga_minum.text)
        .then((value) {
      setState(() {
        // restoSpecbyId = value;
        if (value == "sukses") {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            showCancelBtn: false,
            confirmBtnText: "OK",
            closeOnConfirmBtnTap: true,
            title: "Success",
            text: "Success Editing Drink",
            // barrierDismissible:
            //     false,

            autoCloseDuration: Duration(seconds: 2),
          );
        }
      });
    });
  }

  void deleteMakan(int idvoidmakan) {
    deleteMakanan(idvoidmakan).then((value) {
      setState(() {
        // restoSpecbyId = value;
        if (value == "sukses") {
          print("berhasil apus makan");
          Navigator.pop(context);
        }
      });
    });
  }

  void deleteMinum(int idvoidminum) {
    deleteMinuman(idvoidminum).then((value) {
      setState(() {
        // restoSpecbyId = value;
        if (value == "sukses") {
          print("berhasil apus minum");
        }
      });
    });
  }

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
                "Menu",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    // fontSize: displayHeight(context) * 0.02,
                    fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(
                    icon: new Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => mitraAddMenu(
                                  iddataoper: widget.iddataOper,
                                )),
                      );
                    }),
              ],
            ),
            body: Column(children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PopupItemLauncher(
                      tag: 'bisain',
                      child: SizedBox(
                        height: displayHeight(context) * 0.18,
                        width: displayHeight(context) * 0.48,
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: HexColor("#3D8361"),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.all(displayHeight(context) * 0.02),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: displayHeight(context) * 0.02,
                                  ),
                                  SizedBox(
                                    height: displayHeight(context) * 0.05,
                                    width: displayHeight(context) * 0.05,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        // color: Colors.lightBlue[100],
                                        image: new DecorationImage(
                                          image: new ExactAssetImage(
                                            'assets/images/emot/buka.png',
                                            // scale: displayHeight(context) * 0.04
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: displayHeight(context) * 0.02,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          displayHeight(context) * 0.015,
                                          displayHeight(context) * 0.015,
                                          0,
                                          displayHeight(context) * 0.015),
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height:
                                                displayHeight(context) * 0.02,
                                          ),
                                          SizedBox(
                                            height:
                                                displayHeight(context) * 0.08,
                                            width:
                                                displayHeight(context) * 0.25,
                                            child: Expanded(
                                              child: Text(
                                                "Adjust your opening hours!",
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize:
                                                      displayHeight(context) *
                                                          0.025,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                  SizedBox(
                                    width: displayHeight(context) * 0.04,
                                  ),
                                  SizedBox(
                                    height: displayHeight(context) * 0.02,
                                    width: displayHeight(context) * 0.02,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        // color: Colors.lightBlue[100],
                                        image: new DecorationImage(
                                          image: new ExactAssetImage(
                                            'assets/images/emot/adown.png',
                                            // scale: displayHeight(context) * 0.04
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      popUp: PopUpItem(
                          padding:
                              EdgeInsets.all(0), // Padding inside of the card
                          color: HexColor("#EEF2E6"), // Color of the card
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  32)), // Shape of the card
                          elevation: 2, // Elevation of the card
                          tag:
                              'bisain', // MUST BE THE SAME AS IN `PopupItemLauncher`
                          child: Expanded(
                              child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    "Adjust your opening hours!",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: displayHeight(context) * 0.025,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                ),
                                SizedBox(
                                  height: displayHeight(context) * 0.07,
                                  width: displayHeight(context) * 0.4,
                                  child: TextFormField(
                                    controller: resto_name,
                                    style: GoogleFonts.poppins(
                                        color: Color(0xFF000000)),
                                    cursorColor: Color(0xFF9b9b9b),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      floatingLabelStyle:
                                          TextStyle(color: HexColor("#5E5E5E")),
                                      filled: true,
                                      fillColor: HexColor("#D6CDA4"),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor("#D6CDA4")),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor("#ABA587")),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      labelText: "Restaurant Name ",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF9b9b9b),
                                          fontSize:
                                              displayHeight(context) * 0.02,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                ),
                                SizedBox(
                                  height: displayHeight(context) * 0.07,
                                  width: displayHeight(context) * 0.4,
                                  child: TextFormField(
                                    controller: resto_notelp,
                                    style: GoogleFonts.poppins(
                                        color: Color(0xFF000000)),
                                    cursorColor: Color(0xFF9b9b9b),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      floatingLabelStyle:
                                          TextStyle(color: HexColor("#5E5E5E")),
                                      filled: true,
                                      fillColor: HexColor("#D6CDA4"),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor("#D6CDA4")),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor("#ABA587")),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      labelText: "Restaurant Phone number ",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF9b9b9b),
                                          fontSize:
                                              displayHeight(context) * 0.02,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                ),
                                SizedBox(
                                  height: displayHeight(context) * 0.07,
                                  width: displayHeight(context) * 0.4,
                                  child: TextFormField(
                                    controller: resto_alamat,
                                    style: GoogleFonts.poppins(
                                        color: Color(0xFF000000)),
                                    cursorColor: Color(0xFF9b9b9b),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      floatingLabelStyle:
                                          TextStyle(color: HexColor("#5E5E5E")),
                                      filled: true,
                                      fillColor: HexColor("#D6CDA4"),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor("#D6CDA4")),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor("#ABA587")),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      labelText: "Restaurant Address ",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF9b9b9b),
                                          fontSize:
                                              displayHeight(context) * 0.02,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TimePickerSpinnerPopUp(
                                      mode: CupertinoDatePickerMode.time,
                                      initTime: DateTime.now(),
                                      minTime: DateTime.now()
                                          .subtract(const Duration(days: 24)),
                                      maxTime: DateTime.now()
                                          .add(const Duration(days: 24)),
                                      barrierColor: Colors
                                          .black12, //Barrier Color when pop up show
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 10, 12, 10),
                                      cancelText: 'Cancel',
                                      confirmText: 'OK',
                                      pressType: PressType.singlePress,
                                      timeFormat: 'hh:mm',
                                      // Customize your time widget
                                      // timeWidgetBuilder: (dateTime) {},
                                      onChange: (dateTime) {
                                        // Implement your logic with select dateTime
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: displayHeight(context) * 0.02,
                                          right: displayHeight(context) * 0.02),
                                      child: Text(
                                        "-",
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize:
                                              displayHeight(context) * 0.02,
                                        ),
                                      ),
                                    ),
                                    TimePickerSpinnerPopUp(
                                      mode: CupertinoDatePickerMode.time,
                                      initTime: DateTime.now(),
                                      minTime: DateTime.now()
                                          .subtract(const Duration(days: 10)),
                                      maxTime: DateTime.now()
                                          .add(const Duration(days: 10)),
                                      barrierColor: Colors
                                          .black12, //Barrier Color when pop up show
                                      minuteInterval: 1,
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 10, 12, 10),
                                      cancelText: 'Cancel',
                                      confirmText: 'OK',
                                      pressType: PressType.singlePress,
                                      timeFormat: 'hh:mm',
                                      // Customize your time widget
                                      // timeWidgetBuilder: (dateTime) {},
                                      onChange: (dateTime) {
                                        // Implement your logic with select dateTime
                                      },
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    klikeditData();
                                  },
                                  child: Text(
                                    'Save',
                                    style: GoogleFonts.poppins(
                                        color: HexColor("#3D8361"),
                                        fontSize: displayHeight(context) * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ))),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.01,
                    ),
                    Container(
                      // padding: const EdgeInsets.all(8.0),
                      color: HexColor("#EEF2E6"),
                      width: displayHeight(context) * 0.6,
                      height: displayHeight(context) * 0.685,
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
                              height: displayHeight(context) * 0.6,
                              // color: Colors.red,
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      displayHeight(context) * 0.02,
                                      0,
                                      displayHeight(context) * 0.02,
                                      0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: ListView.builder(
                                              padding: EdgeInsets.all(0),
                                              itemCount: restoSpecbyId
                                                  ?.user
                                                  .first
                                                  .data
                                                  .first
                                                  .makanan
                                                  .length,
                                              itemBuilder: (context, i) {
                                                var makanan = restoSpecbyId!
                                                    .user
                                                    .first
                                                    .data
                                                    .first
                                                    .makanan[i];
                                                return Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              displayHeight(
                                                                      context) *
                                                                  0.02,
                                                              displayHeight(
                                                                      context) *
                                                                  0.01,
                                                              displayHeight(
                                                                      context) *
                                                                  0.02,
                                                              0),
                                                      child: ExpansionTileCard(
                                                        onExpansionChanged:
                                                            (value) {
                                                          setState(() {
                                                            idMakanan =
                                                                makanan.id;
                                                            name_makan.text =
                                                                makanan
                                                                    .nameBarang;
                                                            stock_makan.text =
                                                                makanan
                                                                    .stockBarang
                                                                    .toString();
                                                            jenis_makan.text =
                                                                makanan
                                                                    .jenisBarang;
                                                            harga_makan.text =
                                                                makanan
                                                                    .hargaBarang
                                                                    .toString();
                                                          });
                                                        },
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
                                                            makanan.nameBarang),
                                                        subtitle: Text('Rp. ' +
                                                            makanan.hargaBarang
                                                                .toString()),
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
                                                                  horizontal:
                                                                      3.0,
                                                                  vertical: 3.0,
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    ListTile(
                                                                      title:
                                                                          Text(
                                                                        'Stock',
                                                                      ),
                                                                      subtitle: Text(makanan
                                                                              .stockBarang
                                                                              .toString() +
                                                                          " Buah"),
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
                                                            buttonMinWidth:
                                                                90.0,
                                                            children: <Widget>[
                                                              PopupItemLauncher(
                                                                tag:
                                                                    'editmakanan',
                                                                child: Column(
                                                                  children: <
                                                                      Widget>[
                                                                    Icon(
                                                                        Icons
                                                                            .edit,
                                                                        color: Colors
                                                                            .blue),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              2.0),
                                                                    ),
                                                                    Text(
                                                                      'Edit',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.blue),
                                                                    ),
                                                                  ],
                                                                ),
                                                                popUp: PopUpItem(
                                                                    padding: EdgeInsets.all(0), // Padding inside of the card
                                                                    color: HexColor("#EEF2E6"), // Color of the card
                                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)), // Shape of the card
                                                                    elevation: 2, // Elevation of the card
                                                                    tag: 'editmakanan', // MUST BE THE SAME AS IN `PopupItemLauncher`
                                                                    child: Expanded(
                                                                        child: Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              10),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Center(
                                                                            child:
                                                                                Text(
                                                                              "Edit " + restoSpecbyId!.user.first.data.first.makanan[i].nameBarang,
                                                                              style: GoogleFonts.poppins(
                                                                                color: Colors.black,
                                                                                fontSize: displayHeight(context) * 0.025,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Divider(
                                                                            color:
                                                                                Colors.white,
                                                                            thickness:
                                                                                0.2,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                displayHeight(context) * 0.07,
                                                                            width:
                                                                                displayHeight(context) * 0.4,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: name_makan,
                                                                              style: GoogleFonts.poppins(color: Color(0xFF000000)),
                                                                              cursorColor: Color(0xFF9b9b9b),
                                                                              keyboardType: TextInputType.emailAddress,
                                                                              decoration: InputDecoration(
                                                                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                                                                floatingLabelStyle: TextStyle(color: HexColor("#5E5E5E")),
                                                                                filled: true,
                                                                                fillColor: HexColor("#D6CDA4"),
                                                                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: HexColor("#D6CDA4")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: HexColor("#ABA587")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                labelText: "Food Name",
                                                                                hintStyle: TextStyle(color: Color(0xFF9b9b9b), fontSize: displayHeight(context) * 0.02, fontWeight: FontWeight.normal),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Divider(
                                                                            color:
                                                                                Colors.white,
                                                                            thickness:
                                                                                0.2,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                displayHeight(context) * 0.07,
                                                                            width:
                                                                                displayHeight(context) * 0.4,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: stock_makan,
                                                                              style: GoogleFonts.poppins(color: Color(0xFF000000)),
                                                                              cursorColor: Color(0xFF9b9b9b),
                                                                              keyboardType: TextInputType.emailAddress,
                                                                              decoration: InputDecoration(
                                                                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                                                                floatingLabelStyle: TextStyle(color: HexColor("#5E5E5E")),
                                                                                filled: true,
                                                                                fillColor: HexColor("#D6CDA4"),
                                                                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: HexColor("#D6CDA4")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: HexColor("#ABA587")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                labelText: "Food Stock",
                                                                                hintStyle: TextStyle(color: Color(0xFF9b9b9b), fontSize: displayHeight(context) * 0.02, fontWeight: FontWeight.normal),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Divider(
                                                                            color:
                                                                                Colors.white,
                                                                            thickness:
                                                                                0.2,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                displayHeight(context) * 0.07,
                                                                            width:
                                                                                displayHeight(context) * 0.4,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: jenis_makan,
                                                                              style: GoogleFonts.poppins(color: Color(0xFF000000)),
                                                                              cursorColor: Color(0xFF9b9b9b),
                                                                              keyboardType: TextInputType.emailAddress,
                                                                              decoration: InputDecoration(
                                                                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                                                                floatingLabelStyle: TextStyle(color: HexColor("#5E5E5E")),
                                                                                filled: true,
                                                                                fillColor: HexColor("#D6CDA4"),
                                                                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: HexColor("#D6CDA4")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: HexColor("#ABA587")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                labelText: "Type",
                                                                                hintStyle: TextStyle(color: Color(0xFF9b9b9b), fontSize: displayHeight(context) * 0.02, fontWeight: FontWeight.normal),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Divider(
                                                                            color:
                                                                                Colors.white,
                                                                            thickness:
                                                                                0.2,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                displayHeight(context) * 0.07,
                                                                            width:
                                                                                displayHeight(context) * 0.4,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: harga_makan,
                                                                              style: GoogleFonts.poppins(color: Color(0xFF000000)),
                                                                              cursorColor: Color(0xFF9b9b9b),
                                                                              keyboardType: TextInputType.emailAddress,
                                                                              decoration: InputDecoration(
                                                                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                                                                floatingLabelStyle: TextStyle(color: HexColor("#5E5E5E")),
                                                                                filled: true,
                                                                                fillColor: HexColor("#D6CDA4"),
                                                                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: HexColor("#D6CDA4")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: HexColor("#ABA587")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                labelText: "Food Price",
                                                                                hintStyle: TextStyle(color: Color(0xFF9b9b9b), fontSize: displayHeight(context) * 0.02, fontWeight: FontWeight.normal),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              klikeditMakanan();
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Save',
                                                                              style: GoogleFonts.poppins(color: HexColor("#3D8361"), fontSize: displayHeight(context) * 0.02, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ))),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  CoolAlert.show(
                                                                      context: context,
                                                                      type: CoolAlertType.warning,
                                                                      showCancelBtn: true,
                                                                      confirmBtnColor: HexColor("#3D8361"),
                                                                      title: "Warning",
                                                                      text: "Are you sure to delete this product",
                                                                      // barrierDismissible:
                                                                      //     false,
                                                                      cancelBtnText: "Cancel",
                                                                      onCancelBtnTap: () {},
                                                                      confirmBtnText: "Confirm",
                                                                      closeOnConfirmBtnTap: false,
                                                                      onConfirmBtnTap: () {
                                                                        deleteMakan(restoSpecbyId!
                                                                            .user
                                                                            .first
                                                                            .data
                                                                            .first
                                                                            .makanan[i]
                                                                            .id);
                                                                      });
                                                                  // CoolAlert.show(
                                                                  //     context:
                                                                  //         context,
                                                                  //     type: CoolAlertType
                                                                  //         .success,
                                                                  //     confirmBtnColor:
                                                                  //         HexColor(
                                                                  //             "#3D8361"),
                                                                  //     title:
                                                                  //         "Success",
                                                                  //     text:
                                                                  //         "Selected Food has been deleted",
                                                                  //     confirmBtnText:
                                                                  //         "Ok",
                                                                  //     // closeOnConfirmBtnTap:
                                                                  //     //     true,
                                                                  //     onConfirmBtnTap:
                                                                  //         () {
                                                                  //       print(
                                                                  //           "asd");
                                                                  //       Navigator
                                                                  //           .pushAndRemoveUntil(
                                                                  //         context,
                                                                  //         MaterialPageRoute(
                                                                  //             builder: (context) =>
                                                                  //                 MitraHome()),
                                                                  //         (Route<dynamic>
                                                                  //                 route) =>
                                                                  //             false,
                                                                  //       );

                                                                  //     });
                                                                },
                                                                child: Column(
                                                                  children: <
                                                                      Widget>[
                                                                    Icon(
                                                                        Icons
                                                                            .delete,
                                                                        color: Colors
                                                                            .red),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              2.0),
                                                                    ),
                                                                    Text(
                                                                      'Delete',
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
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              })),
                                    ],
                                  ))),
                          ///////////////////////////////////////////////////////////////////////////////////////
                          Container(
                              height: 10,
                              // color: Colors.red,
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      displayHeight(context) * 0.02,
                                      0,
                                      displayHeight(context) * 0.02,
                                      0),
                                  child: Expanded(
                                      child: ListView.builder(
                                          padding: EdgeInsets.all(0),
                                          itemCount: restoSpecbyId?.user.first
                                              .data.first.minuman.length,
                                          itemBuilder: (context, i) {
                                            var minuman = restoSpecbyId!.user
                                                .first.data.first.minuman[i];
                                            return Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      displayHeight(context) *
                                                          0.02,
                                                      displayHeight(context) *
                                                          0.01,
                                                      displayHeight(context) *
                                                          0.02,
                                                      0),
                                                  child: ExpansionTileCard(
                                                    onExpansionChanged:
                                                        (value) {
                                                      setState(() {
                                                        idMinuman = minuman.id;
                                                        name_minum.text =
                                                            minuman.nameBarang;
                                                        stock_minum.text =
                                                            minuman.stockBarang
                                                                .toString();
                                                        jenis_minum.text =
                                                            minuman.jenisBarang;
                                                        harga_minum.text =
                                                            minuman.hargaBarang
                                                                .toString();
                                                      });
                                                    },
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
                                                        minuman.nameBarang),
                                                    subtitle: Text('Rp. ' +
                                                        minuman.hargaBarang
                                                            .toString()),
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
                                                            child: Column(
                                                              children: [
                                                                ListTile(
                                                                  title: Text(
                                                                    'Stock',
                                                                  ),
                                                                  subtitle: Text(restoSpecbyId!
                                                                          .user
                                                                          .first
                                                                          .data
                                                                          .first
                                                                          .minuman[
                                                                              i]
                                                                          .stockBarang
                                                                          .toString() +
                                                                      " Buah"),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                      ButtonBar(
                                                        alignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        buttonHeight: 52.0,
                                                        buttonMinWidth: 90.0,
                                                        children: <Widget>[
                                                          PopupItemLauncher(
                                                            tag: 'editminuman',
                                                            child: Column(
                                                              children: <
                                                                  Widget>[
                                                                Icon(Icons.edit,
                                                                    color: Colors
                                                                        .blue),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          2.0),
                                                                ),
                                                                Text(
                                                                  'Edit',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blue),
                                                                ),
                                                              ],
                                                            ),
                                                            popUp: PopUpItem(
                                                                padding:
                                                                    EdgeInsets.all(
                                                                        0), // Padding inside of the card
                                                                color: HexColor(
                                                                    "#EEF2E6"), // Color of the card
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            32)), // Shape of the card
                                                                elevation:
                                                                    2, // Elevation of the card
                                                                tag:
                                                                    'editminuman', // MUST BE THE SAME AS IN `PopupItemLauncher`
                                                                child: Expanded(
                                                                    child:
                                                                        Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  child: Column(
                                                                    children: [
                                                                      Center(
                                                                        child:
                                                                            Text(
                                                                          "Edit " +
                                                                              restoSpecbyId!.user.first.data.first.makanan[i].nameBarang,
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                displayHeight(context) * 0.025,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        color: Colors
                                                                            .white,
                                                                        thickness:
                                                                            0.2,
                                                                      ),
                                                                      SizedBox(
                                                                        height: displayHeight(context) *
                                                                            0.07,
                                                                        width: displayHeight(context) *
                                                                            0.4,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              name_minum,
                                                                          style:
                                                                              GoogleFonts.poppins(color: Color(0xFF000000)),
                                                                          cursorColor:
                                                                              Color(0xFF9b9b9b),
                                                                          keyboardType:
                                                                              TextInputType.emailAddress,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            contentPadding:
                                                                                EdgeInsets.symmetric(horizontal: 10),
                                                                            floatingLabelStyle:
                                                                                TextStyle(color: HexColor("#5E5E5E")),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                HexColor("#D6CDA4"),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(borderSide: BorderSide(color: HexColor("#D6CDA4")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(borderSide: BorderSide(color: HexColor("#ABA587")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                            labelText:
                                                                                "Food Name",
                                                                            hintStyle: TextStyle(
                                                                                color: Color(0xFF9b9b9b),
                                                                                fontSize: displayHeight(context) * 0.02,
                                                                                fontWeight: FontWeight.normal),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        color: Colors
                                                                            .white,
                                                                        thickness:
                                                                            0.2,
                                                                      ),
                                                                      SizedBox(
                                                                        height: displayHeight(context) *
                                                                            0.07,
                                                                        width: displayHeight(context) *
                                                                            0.4,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              stock_minum,
                                                                          style:
                                                                              GoogleFonts.poppins(color: Color(0xFF000000)),
                                                                          cursorColor:
                                                                              Color(0xFF9b9b9b),
                                                                          keyboardType:
                                                                              TextInputType.emailAddress,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            contentPadding:
                                                                                EdgeInsets.symmetric(horizontal: 10),
                                                                            floatingLabelStyle:
                                                                                TextStyle(color: HexColor("#5E5E5E")),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                HexColor("#D6CDA4"),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(borderSide: BorderSide(color: HexColor("#D6CDA4")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(borderSide: BorderSide(color: HexColor("#ABA587")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                            labelText:
                                                                                "Food Stock",
                                                                            hintStyle: TextStyle(
                                                                                color: Color(0xFF9b9b9b),
                                                                                fontSize: displayHeight(context) * 0.02,
                                                                                fontWeight: FontWeight.normal),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        color: Colors
                                                                            .white,
                                                                        thickness:
                                                                            0.2,
                                                                      ),
                                                                      SizedBox(
                                                                        height: displayHeight(context) *
                                                                            0.07,
                                                                        width: displayHeight(context) *
                                                                            0.4,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              jenis_minum,
                                                                          style:
                                                                              GoogleFonts.poppins(color: Color(0xFF000000)),
                                                                          cursorColor:
                                                                              Color(0xFF9b9b9b),
                                                                          keyboardType:
                                                                              TextInputType.emailAddress,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            contentPadding:
                                                                                EdgeInsets.symmetric(horizontal: 10),
                                                                            floatingLabelStyle:
                                                                                TextStyle(color: HexColor("#5E5E5E")),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                HexColor("#D6CDA4"),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(borderSide: BorderSide(color: HexColor("#D6CDA4")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(borderSide: BorderSide(color: HexColor("#ABA587")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                            labelText:
                                                                                "Type",
                                                                            hintStyle: TextStyle(
                                                                                color: Color(0xFF9b9b9b),
                                                                                fontSize: displayHeight(context) * 0.02,
                                                                                fontWeight: FontWeight.normal),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        color: Colors
                                                                            .white,
                                                                        thickness:
                                                                            0.2,
                                                                      ),
                                                                      SizedBox(
                                                                        height: displayHeight(context) *
                                                                            0.07,
                                                                        width: displayHeight(context) *
                                                                            0.4,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              harga_minum,
                                                                          style:
                                                                              GoogleFonts.poppins(color: Color(0xFF000000)),
                                                                          cursorColor:
                                                                              Color(0xFF9b9b9b),
                                                                          keyboardType:
                                                                              TextInputType.emailAddress,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            contentPadding:
                                                                                EdgeInsets.symmetric(horizontal: 10),
                                                                            floatingLabelStyle:
                                                                                TextStyle(color: HexColor("#5E5E5E")),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                HexColor("#D6CDA4"),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(borderSide: BorderSide(color: HexColor("#D6CDA4")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(borderSide: BorderSide(color: HexColor("#ABA587")), borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                            labelText:
                                                                                "Food Price",
                                                                            hintStyle: TextStyle(
                                                                                color: Color(0xFF9b9b9b),
                                                                                fontSize: displayHeight(context) * 0.02,
                                                                                fontWeight: FontWeight.normal),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          klikeditMinuman();
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Save',
                                                                          style: GoogleFonts.poppins(
                                                                              color: HexColor("#3D8361"),
                                                                              fontSize: displayHeight(context) * 0.02,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ))),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              CoolAlert.show(
                                                                  context:
                                                                      context,
                                                                  type: CoolAlertType
                                                                      .warning,
                                                                  showCancelBtn:
                                                                      true,
                                                                  confirmBtnColor:
                                                                      HexColor(
                                                                          "#3D8361"),
                                                                  title:
                                                                      "Warning",
                                                                  text:
                                                                      "Are you sure to delete this product",
                                                                  // barrierDismissible:
                                                                  //     false,
                                                                  cancelBtnText:
                                                                      "Cancel",
                                                                  onCancelBtnTap:
                                                                      () {},
                                                                  confirmBtnText:
                                                                      "Confirm",
                                                                  closeOnConfirmBtnTap:
                                                                      false,
                                                                  onConfirmBtnTap:
                                                                      () {
                                                                    deleteMinum(restoSpecbyId!
                                                                        .user
                                                                        .first
                                                                        .data
                                                                        .first
                                                                        .minuman[
                                                                            i]
                                                                        .id);
                                                                  });
                                                            },
                                                            child: Column(
                                                              children: <
                                                                  Widget>[
                                                                Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: Colors
                                                                        .red),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          2.0),
                                                                ),
                                                                Text(
                                                                  'Delete',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            );
                                          })))),
                        ],
                        onChange: (index) => print(index),
                      ),
                    ),
                  ],
                ),
              )
            ]));
  }
}
