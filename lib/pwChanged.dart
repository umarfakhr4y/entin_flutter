part of 'conn/auth.dart';

class PwChanged extends StatefulWidget {
  @override
  _PwChangedState createState() => _PwChangedState();
}

class _PwChangedState extends State<PwChanged> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: _buildWidget());
  }

  Widget _buildWidget() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/splash.png"),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: displayHeight(context) * 0.1,
                width: displayHeight(context) * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.lightBlue[100],
                  image: new DecorationImage(
                    image:
                        new ExactAssetImage('assets/images/emot/centang.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.02,
              ),
              Text(
                'Your Password Has been changed',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: displayHeight(context) * 0.03,
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(0, 0, displayHeight(context) * 0.02, 0),
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => HexColor("#3D8361")),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(displayHeight(context) * 0.05,
                        0, displayHeight(context) * 0.05, 0),
                    child: Text("Explore Menu",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400)),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ));
  }
}
