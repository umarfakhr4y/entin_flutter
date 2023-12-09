part of '../auth.dart';

class MitraMain extends StatefulWidget {
  @override
  MitraMainState createState() => MitraMainState();
}

class MitraMainState extends State<MitraMain> {
  int _count = 1;
  DataLogin? dataLogin;
  PersistentTabController? _controller;

  final _controllerr = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [MitraHome(), mitraChat(), profileMitra()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        title: ("Home"),
        activeColorPrimary: HexColor("#3D8361"),
        inactiveColorPrimary: HexColor("#84A590"),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.chat_outlined),
        title: ("Chat"),
        activeColorPrimary: HexColor("#3D8361"),
        inactiveColorPrimary: HexColor("#84A590"),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_2_outlined),
        title: ("Account"),
        activeColorPrimary: HexColor("#3D8361"),
        inactiveColorPrimary: HexColor("#84A590"),
      ),
    ];
  }

  void initState() {
    super.initState();
    // getDataLogin();
  }

  // void klikLogout() {
  //   logOut();
  // }

  void klikLogout() {
    logOut().then((value) {
      setState(() {
        setState(() {
          // _loading = true;
          // SimpleDialog(
          //   title: CircularProgressIndicator(),
          // );
        });
        if (value == "logout") {
          setState(() {
            // _loading = false;
          });
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Login()),
            (Route<dynamic> route) => false,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: _buildWidget());
  }

  Widget _buildWidget() {
    return PersistentTabView(
      context,
      controller: _controllerr,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: HexColor("#EEF2E6"), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: HexColor("#EEF2E6"),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
