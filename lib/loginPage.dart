part of 'conn/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isChecked = true;
  bool _isLoading = false;
  // bool _loading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _obscureText = false;
  var emailvalid;
  var passwordvalid;
  final _formKey = GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void initState() {
    super.initState();
  }

  void klikLogin() {
    _isLoading == false;
    loginUser(email.text, password.text).then((value) => {
          setState(() {
            // if (value == "admin") {
            //     Navigator.pushAndRemoveUntil(
            //       context,
            //       MaterialPageRoute(builder: (context) => (AdminHome())),
            //       (Route<dynamic> route) => false,
            //     );
            //   }
            if (value == "admin") {
              _isLoading = false;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => AdminMain()),
                (Route<dynamic> route) => false,
              );
            }
            if (value == "mitra") {
              _isLoading = false;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MitraMain()),
                (Route<dynamic> route) => false,
              );
            }
            if (value == "pengguna") {
              _isLoading = false;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => PenggunaHome()),
                (Route<dynamic> route) => false,
              );
              print("berhasil login");
            } if (value == "gagal") {
              _isLoading = false;
              CoolAlert.show(
                  context: context,
                  type: CoolAlertType.error,
                  confirmBtnColor: HexColor("#3D8361"),
                  title: "Error",
                  text: "Please check your Email and Password");
            }
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: _buildWidget());
  }

  Widget _buildWidget() {
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
                        height: displayHeight(context) * 0.05,
                      ),
                      Center(
                          child: Text("LOGIN",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: displayHeight(context) * 0.04,
                                  fontWeight: FontWeight.w500))),
                      Padding(
                        padding: EdgeInsets.all(displayHeight(context) * 0.01),
                        child: Container(
                          height: displayHeight(context) * 0.25,
                          width: displayHeight(context) * 0.25,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20),
                            // color: Colors.lightBlue[100],
                            image: new DecorationImage(
                              image: new ExactAssetImage(
                                  'assets/images/entin_logo.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 0, displayHeight(context) * 0.05),
                        child: Text("Sign in to continue"),
                      )
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
                            validator: (emailValue) {
                              if (emailValue!.isEmpty) {
                                return 'Silahkan Masukan Email Anda';
                              }
                              emailvalid = emailValue;
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.02,
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.07,
                          width: displayHeight(context) * 0.4,
                          child: TextFormField(
                            obscureText: _obscureText,
                            controller: password,
                            style:
                                GoogleFonts.poppins(color: Color(0xFF000000)),
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.emailAddress,
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
                            validator: (emailValue) {
                              if (emailValue!.isEmpty) {
                                return 'Silahkan Masukan Email Anda';
                              }
                              emailvalid = emailValue;
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.001,
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgotPW()),
                                );
                              },
                              child: Text(
                                "Forgot Password",
                                style: GoogleFonts.poppins(
                                  fontSize: displayHeight(context) * 0.015,
                                  color: Colors.blueAccent,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            )),
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
                                        : Text("Login",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white))),
                                onPressed: () {
                                  if (email.text == "" || password.text == "") {
                                    CoolAlert.show(
                                        context: context,
                                        type: CoolAlertType.error,
                                        confirmBtnColor: HexColor("#3D8361"),
                                        title: "Error",
                                        text:
                                            "Please enter valid Email and Password");
                                  } else {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    klikLogin();
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.1,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Dont have an account?',
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
                                        builder: (context) => Register()),
                                    (Route<dynamic> route) => false,
                                  );
                                },
                                child: Text(
                                  'Sign up',
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
