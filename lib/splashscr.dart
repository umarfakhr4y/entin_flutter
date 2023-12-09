part of 'conn/auth.dart';

class Splashscr extends StatefulWidget {
  @override
  _SplashscrState createState() => _SplashscrState();
}

class _SplashscrState extends State<Splashscr> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash.png"),
              fit: BoxFit.cover)),
      child: Center(
        child: Container(
          height: displayHeight(context) * 0.3,
          width: displayHeight(context) * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: Colors.lightBlue[100],
            image: new DecorationImage(
              image: new ExactAssetImage('assets/images/entin_logo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
