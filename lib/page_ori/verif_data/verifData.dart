part of '../auth.dart';

class verifPengguna extends StatefulWidget {
  final String? nameoper;
  final String? emailoper;
  // final int userid_oper;
  const verifPengguna({required this.nameoper, required this.emailoper});

  @override
  _verifPenggunaState createState() => _verifPenggunaState();
}

TextEditingController no_telp = TextEditingController();
TextEditingController alamat = TextEditingController();

class _verifPenggunaState extends State<verifPengguna> {
  bool _isLoading = false;
  void initState() {
    print(widget.nameoper);
    print(widget.emailoper);
    super.initState();
  }

  void addInfo() {
    addinfoPengguna(widget.nameoper.toString(), widget.emailoper.toString(),
            no_telp.text, alamat.text)
        .then((value) {
              setState(() {
                if (value == true) {
                  // print(value);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => PenggunaHome()),
                    (Route<dynamic> route) => false,
                  );
                } else {
                  CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      confirmBtnColor: HexColor("#3D8361"),
                      title: "Error",
                      text: "Please Try Again Later");
                }
              });
            });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: _buildWidget());
  }

  Widget _buildWidget() {
    return Container(
        color: HexColor("#EEF2E6"),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please Complete your account',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: displayHeight(context) * 0.045,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: displayHeight(context) * 0.025,
              ),
              SizedBox(
                height: displayHeight(context) * 0.07,
                width: displayHeight(context) * 0.4,
                child: TextFormField(
                  controller: no_telp,
                  style: GoogleFonts.poppins(color: Color(0xFF000000)),
                  cursorColor: Color(0xFF9b9b9b),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    floatingLabelStyle: TextStyle(color: HexColor("#5E5E5E")),
                    filled: true,
                    fillColor: HexColor("#D6CDA4"),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor("#D6CDA4")),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor("#ABA587")),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: "Phone Number ",
                    hintStyle: TextStyle(
                        color: Color(0xFF9b9b9b),
                        fontSize: displayHeight(context) * 0.02,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.025,
              ),
              SizedBox(
                height: displayHeight(context) * 0.07,
                width: displayHeight(context) * 0.4,
                child: TextFormField(
                  controller: alamat,
                  style: GoogleFonts.poppins(color: Color(0xFF000000)),
                  cursorColor: Color(0xFF9b9b9b),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    floatingLabelStyle: TextStyle(color: HexColor("#5E5E5E")),
                    filled: true,
                    fillColor: HexColor("#D6CDA4"),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor("#D6CDA4")),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor("#ABA587")),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: "Address ",
                    hintStyle: TextStyle(
                        color: Color(0xFF9b9b9b),
                        fontSize: displayHeight(context) * 0.02,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.025,
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(0, 0, displayHeight(context) * 0.02, 0),
                child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => HexColor("#3D8361")),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          displayHeight(context) * 0.015,
                          0,
                          displayHeight(context) * 0.015,
                          0),
                      child: _isLoading == true
                          ? SizedBox(
                              height: displayHeight(context) * 0.03,
                              width: displayHeight(context) * 0.03,
                              child: CircularProgressIndicator(
                                color: HexColor("#D6CDA4"),
                              ),
                            )
                          : Text("Send",
                              style: GoogleFonts.poppins(color: Colors.white))),
                  onPressed: () {
                    if (no_telp.text == "" || alamat.text == "") {
                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          confirmBtnColor: HexColor("#3D8361"),
                          title: "Error",
                          text: "Please enter valid Information");
                    } else {
                      addInfo();
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
