part of 'conn/auth.dart';

class VerifForgot extends StatefulWidget {
  @override
  _VerifForgotState createState() => _VerifForgotState();
}

class _VerifForgotState extends State<VerifForgot> {
  void initState() {
    super.initState();
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
                'Verification',
                style: TextStyle(
                    fontSize: displayHeight(context) * 0.045,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: displayHeight(context) * 0.015,
              ),
              SizedBox(
                height: displayHeight(context) * 0.1,
                width: displayHeight(context) * 0.35,
                child: Container(
                  child: Text(
                    'Enter the verification code we just sent you on your email address',
                    style: TextStyle(
                        color: HexColor("#5E5E5E"),
                        fontSize: displayHeight(context) * 0.02,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.1,
                width: displayHeight(context) * 0.45,
                child: TextFormField(
                  maxLength: 4,
                  textAlign: TextAlign.center,
                  // controller: email,
                  style: GoogleFonts.poppins(color: Color(0xFF000000)),
                  cursorColor: Color(0xFF9b9b9b),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: HexColor("#5E5E5E")),
                    filled: true,
                    fillColor: HexColor("#D6CDA4"),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor("#D6CDA4")),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor("#ABA587")),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  // validator: (emailValue) {
                  //   if (emailValue!.isEmpty) {
                  //     return 'Silahkan Masukan Email Anda';
                  //   }
                  //   emailvalid = emailValue;
                  //   return null;
                  // },
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'If you didnt receive a code,',
                    style: TextStyle(
                        fontSize: displayHeight(context) * 0.02,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: displayHeight(context) * 0.008,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Resend',
                      style: TextStyle(
                          color: HexColor("#7eadd2"),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, displayHeight(context) * 0.04,
                    displayHeight(context) * 0.02, 0),
                child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => HexColor("#3D8361")),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)))),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          displayHeight(context) * 0.015,
                          0,
                          displayHeight(context) * 0.015,
                          0),
                      child: Text("Sent",
                          style: GoogleFonts.poppins(color: Colors.white))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PwChanged()),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
