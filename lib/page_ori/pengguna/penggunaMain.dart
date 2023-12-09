part of '../auth.dart';

class PenggunaHome extends StatefulWidget {
  @override
  PenggunaHomeState createState() => PenggunaHomeState();
}

class PenggunaHomeState extends State<PenggunaHome> {
  DataLogin? dataLogin;
  DataBanner? dataBanner;
  DataMitraHome? dataMitraHome;

  TextEditingController search = TextEditingController();
  static const String banner1 =
      "http://192.168.100.2:8000/bannerPengguna/bannerA.png";
  static const String banner2 =
      "http://192.168.100.2:8000/bannerPengguna/bannerB.png";
  static const String banner3 =
      "http://192.168.100.2:8000/bannerPengguna/bannerC.png";
  static const String banner4 =
      "http://192.168.100.2:8000/bannerPengguna/bannerD.png";

  static List<BannerModel> listBanners = [
    BannerModel(imagePath: banner1, id: "1"),
    BannerModel(imagePath: banner2, id: "2"),
    BannerModel(imagePath: banner3, id: "3"),
    BannerModel(imagePath: banner4, id: "4"),
  ];

  void initState() {
    super.initState();
    getDataLogin();
    getMitraList();
    // cekDatalengkap();
  }

  void klikLogout() {
    logOut();
  }

  void getBanner() {
    getBannerVmodel().then((value) {
      dataBanner = value;
      print(dataBanner?.success.first.image);
    });
  }

  void getMitraList() {
    getMitraVmodel().then((value) {
      dataMitraHome = value;
      print(dataMitraHome?.success.first.alamatRestoran);
    });
  }

  void getDataLogin() {
    UserViewModel().getUser().then((value) {
      setState(() {
        dataLogin = value;
        if (dataLogin?.success.noTelp == "no_ingfo" ||
            dataLogin?.success.alamat == "no_ingfo") {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.warning,
            confirmBtnColor: HexColor("#3D8361"),
            title: "Error",
            text: "Please Complete your Profile Information",
            barrierDismissible: false,
            closeOnConfirmBtnTap: false,
            onConfirmBtnTap: () {
              // print(dataLogin?.success.name);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => verifPengguna(
                          nameoper: dataLogin?.success.name,
                          emailoper: dataLogin?.success.email,
                        )),
              );
            },
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
    return dataMitraHome == null
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
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              toolbarHeight: displayHeight(context) * 0.07,
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: Padding(
                  padding: EdgeInsets.fromLTRB(displayHeight(context) * 0.03,
                      displayHeight(context) * 0.003, 0, 0),
                  child: GestureDetector(
                    child: dataLogin?.success.image == "no_ingfo"
                        ? ProfilePicture(
                            name: dataLogin!.success.name,
                            radius: displayHeight(context) * 0.09,
                            fontsize: 21,
                            // random: true,
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(
                                'http://192.168.100.2:8000/profile_img/${dataLogin?.success.image}'),
                            radius: displayHeight(context) * 0.05,
                          ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return profilePengguna();
                        ;
                      }));
                    },
                  )),
              title: Center(
                child: Text(
                  'What do you want to eat today',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: displayHeight(context) * 0.02,
                      fontWeight: FontWeight.w500),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.message,
                    size: 25,
                    color: Colors.black,
                  ),
                  tooltip: 'Go to the next page',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return chatPengguna();
                      ;
                    }));
                  },
                ),
              ],
            ),
            body: Center(
                child: Column(
              children: [
                SizedBox(
                  height: displayHeight(context) * 0.135,
                ),
                SizedBox(
                  height: displayHeight(context) * 0.045,
                  width: displayHeight(context) * 0.43,
                  child: TextFormField(
                    controller: search,
                    style: GoogleFonts.poppins(
                        color: Color(0xFF000000),
                        fontSize: displayHeight(context) * 0.02),
                    cursorColor: Color(0xFF9b9b9b),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: HexColor("#D6CDA4"),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor("#D6CDA4")),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor("#ABA587")),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: displayHeight(context) * 0.025,
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(
                          height: displayHeight(context) * 0.006,
                          color: Color(0xFF9b9b9b),
                          fontSize: displayHeight(context) * 0.016,
                          fontWeight: FontWeight.normal),
                    ),
                    validator: (emailValue) {},
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.03,
                ),
                BannerCarousel(
                  banners: listBanners,
                  customizedIndicators: IndicatorModel.animation(
                      width: 10,
                      height: 10,
                      spaceBetween: 2,
                      widthAnimation: 10),
                  height: displayHeight(context) * 0.2,
                  activeColor: HexColor("#3D8361"),
                  disableColor: HexColor("#D6C36D"),
                  animation: true,
                  borderRadius: 15,
                  width: displayHeight(context) * 0.473,
                  indicatorBottom: false,
                ),
                SizedBox(
                  height: displayHeight(context) * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "    Our Recommendation",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: displayHeight(context) * 0.02,
                      ),
                    ),
                    SizedBox(
                      width: displayHeight(context) * 0.001,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: IconButton(
                        icon: Icon(
                          Icons.fastfood,
                          size: 25,
                          color: Colors.black,
                        ),
                        tooltip: 'Go to the next page',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return penggunaOrder(
                              idOper: dataLogin!.success.id,
                            );
                          }));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 1),
                      child: IconButton(
                        icon: Icon(
                          Icons.discount_rounded,
                          size: 25,
                          color: Colors.black,
                        ),
                        tooltip: 'Go to the next page',
                        onPressed: () {
                          // getBanner();
                          // print(dataBanner?.success.first.image);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return voucherPengguna();
                            ;
                          }));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 1),
                      child: IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 25,
                          color: Colors.black,
                        ),
                        tooltip: 'Go to the next page',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return cartPengguna();
                            ;
                          }));
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: displayHeight(context) * 0.01,
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: dataMitraHome?.success.length,
                      itemBuilder: (context, i) {
                        return Padding(
                            padding: EdgeInsets.all(0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return spesificRestoPengguna(
                                        idOper:
                                            dataMitraHome!.success[i].usersId,
                                      );
                                    }));
                                  },
                                  child: SizedBox(
                                    height: displayHeight(context) * 0.18,
                                    width: displayHeight(context) * 0.48,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        // color: HexColor("#3D8361"),
                                        color: Colors.lightBlue[100],
                                        image: new DecorationImage(
                                          image: new NetworkImage(
                                              'http://192.168.100.2:8000/bannerMitraRestoran/${dataMitraHome!.success[i].bannerRestoran}'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: displayHeight(context) * 0.02,
                                ),
                              ],
                            ));
                      }),
                )
              ],
            )),
          );
  }
}
