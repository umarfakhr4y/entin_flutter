part of 'conn/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isChecked = true;
  var _isLoading = false;
  bool _loading = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController lahir = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController reppassword = TextEditingController();
  dynamic formatDate;

  bool _obscureText = true;
  bool _obscureText1 = true;
  var emailvalid;
  var _dates;
  var passwordvalid;
  late String formattedselectedDate;
  DateTime selectedDate = DateTime.now();
  // DateTime converted = DateTime.parse(formattedselectedDate);

  final _formKey = GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      _obscureText1 = !_obscureText1;
    });
  }

  void initState() {
    super.initState();
  }

  void klikRegis() {
    _isLoading == false;
    print(selectedDate);
    if (password.text != reppassword.text) {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          confirmBtnColor: HexColor("#3D8361"),
          title: "Error",
          text: "Password Not Match");
    } else {
      print("password match");
      regisUser(name.text, email.text, password.text, selectedDate)
          .then((value) => {
                setState(() {
                  if (value == "suksescuy11") {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => PenggunaHome()),
                      (Route<dynamic> route) => false,
                    );
                    print("object");
                  } else {
                    CoolAlert.show(
                        context: context,
                        type: CoolAlertType.error,
                        confirmBtnColor: HexColor("#3D8361"),
                        title: "Error",
                        text: "Please Try Again Later");
                  }
                })
              });
    }
    // return;
    _isLoading == false;
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null)
      setState(() {
        String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(picked);
        String formattedDateDisplay = DateFormat('yyyy-MM-dd').format(picked);
        // print(formattedDate);
        DateUtils.dateOnly(picked);
        lahir.text = formattedDateDisplay.toString();
        setState(() {
          selectedDate = picked;
          formattedselectedDate = formattedDate;
        });
        print(formattedselectedDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: _buildWidget());
  }

  Widget _buildWidget() {
    // DateTime? dateTime = await showOmniDateTimePicker(context: context);

    return Scaffold(
        backgroundColor: HexColor("#EEF2E6"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  // height: displayHeight(context) * 0.43,
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: displayHeight(context) * 0.12,
                      ),
                      Center(
                          child: Text("REGISTER",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: displayHeight(context) * 0.04,
                                  fontWeight: FontWeight.w500))),
                      SizedBox(
                        height: displayHeight(context) * 0.09,
                      ),
                    ],
                  )
                ],
              )),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: displayHeight(context) * 0.07,
                          width: displayHeight(context) * 0.4,
                          child: TextFormField(
                            controller: name,
                            style:
                                GoogleFonts.poppins(color: Color(0xFF000000)),
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              floatingLabelStyle:
                                  TextStyle(color: HexColor("#5E5E5E")),
                              filled: true,
                              fillColor: HexColor("#D6CDA4"),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor("#D6CDA4")),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor("#ABA587")),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              labelText: "Name ",
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: displayHeight(context) * 0.02,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.02,
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.07,
                          width: displayHeight(context) * 0.4,
                          child: TextFormField(
                            controller: email,
                            style:
                                GoogleFonts.poppins(color: Color(0xFF000000)),
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
                                  borderSide:
                                      BorderSide(color: HexColor("#D6CDA4")),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor("#ABA587")),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              labelText: "Email ",
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: displayHeight(context) * 0.02,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.02,
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.07,
                          width: displayHeight(context) * 0.4,
                          child: TextFormField(
                            readOnly: true,
                            controller: lahir,
                            onTap: () async {
                              _selectDate(context);
                            },
                            style:
                                GoogleFonts.poppins(color: Color(0xFF000000)),
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
                                  borderSide:
                                      BorderSide(color: HexColor("#D6CDA4")),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor("#ABA587")),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              labelText: "Date Birth ",
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: displayHeight(context) * 0.02,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.02,
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.07,
                          width: displayHeight(context) * 0.4,
                          child: TextFormField(
                            controller: password,
                            style:
                                GoogleFonts.poppins(color: Color(0xFF000000)),
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.name,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              floatingLabelStyle:
                                  TextStyle(color: HexColor("#5E5E5E")),
                              filled: true,
                              fillColor: HexColor("#D6CDA4"),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor("#D6CDA4")),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor("#ABA587")),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              labelText: "Password ",
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: displayHeight(context) * 0.02,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.02,
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.07,
                          width: displayHeight(context) * 0.4,
                          child: TextFormField(
                            controller: reppassword,
                            style:
                                GoogleFonts.poppins(color: Color(0xFF000000)),
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              floatingLabelStyle:
                                  TextStyle(color: HexColor("#5E5E5E")),
                              filled: true,
                              fillColor: HexColor("#D6CDA4"),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor("#D6CDA4")),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor("#ABA587")),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              labelText: "Repeat Password ",
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: displayHeight(context) * 0.02,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0, 0, displayHeight(context) * 0.02, 0),
                              child: OutlinedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => HexColor("#3D8361")),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)))),
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        displayHeight(context) * 0.015,
                                        0,
                                        displayHeight(context) * 0.015,
                                        0),
                                    child: _isLoading == true
                                        ? SizedBox(
                                            height:
                                                displayHeight(context) * 0.03,
                                            width:
                                                displayHeight(context) * 0.03,
                                            child: CircularProgressIndicator(
                                              color: HexColor("#D6CDA4"),
                                            ),
                                          )
                                        : Text("Register",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white))),
                                onPressed: () {
                                  if (name.text.isEmpty ||
                                      email.text.isEmpty ||
                                      password.text.isEmpty ||
                                      lahir.text.isEmpty ||
                                      reppassword.text.isEmpty) {
                                    CoolAlert.show(
                                        context: context,
                                        type: CoolAlertType.error,
                                        confirmBtnColor: HexColor("#3D8361"),
                                        title: "Error",
                                        text: "Please enter valid information");
                                  } else {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    klikRegis();
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.05,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Already have an account?',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: displayHeight(context) * 0.008,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                    (Route<dynamic> route) => false,
                                  );
                                },
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                      color: HexColor("#7eadd2"),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
