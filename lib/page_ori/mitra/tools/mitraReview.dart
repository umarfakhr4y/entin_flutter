part of '../../auth.dart';

class mitraReview extends StatefulWidget {
  @override
  final int idOper;
  const mitraReview({required this.idOper});
  mitraReviewState createState() => mitraReviewState();
}

class mitraReviewState extends State<mitraReview> {
  int _count = 1;
  DataRating? datarating;
  DataRevRerata? datarevrerata;

  void initState() {
    super.initState();
    print(widget.idOper);
    ambilRating();
    ambilrerata();
    // getDataLogin();
  }

  // void klikLogout() {
  //   logOut();
  // }
  void ambilrerata() {
    getDatarev(widget.idOper).then((value) {
      // print(widget.idOper);
      setState(() {
        datarevrerata = value;
      });
      if (datarevrerata == null) {
        print("dataResto kosong");
      } else {
        print('dataResto ga kosong');
      }
    });
  }

  void ambilRating() {
    getRating(widget.idOper).then((value) {
      // print(widget.idOper);
      setState(() {
        datarating = value;
      });
      if (datarating == null) {
        print("kosong");
      } else {
        print('ga kosong');
      }
    });
  }

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
    return datarating == null || datarevrerata == null
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
                "Review",
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
                Padding(
                  padding: EdgeInsets.only(left: displayHeight(context) * 0.04),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Latest Review From Your Costumer",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: displayHeight(context) * 0.02,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.015,
                ),

                SizedBox(
                  height: displayHeight(context) * 0.15,
                  width: displayHeight(context) * 0.48,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: HexColor("#D6CDA4"),
                      ),
                      child: Padding(
                          padding:
                              EdgeInsets.all(displayHeight(context) * 0.02),
                          child: Center(
                              child: Column(
                            children: [
                              Text("Overall Rating",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: displayHeight(context) * 0.02,
                                  )),
                              RatingBar.builder(
                                ignoreGestures: true,
                                initialRating:
                                    datarevrerata!.data.ratingRestoranOverall,
                                minRating: 1,
                                direction: Axis.horizontal,
                                // tapOnlyMode: true,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          )))),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.02,
                ),
                Column(children: <Widget>[
                  Row(children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                    Text("Costumer Review",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: displayHeight(context) * 0.015,
                        )),
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                  ]),
                ]),

                Expanded(
                    child: ListView.builder(
                        itemCount: datarating?.data.length,
                        itemBuilder: (context, i) {
                          var rating = datarating?.data[i];
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: displayHeight(context) * 0.02),
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
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          ListTile(
                                              leading: Padding(
                                                  padding: EdgeInsets.only(
                                                    top:
                                                        displayHeight(context) *
                                                            0.01,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage(
                                                        'http://192.168.100.2:8000/profile_img/${rating?.image}'),
                                                    radius:
                                                        displayHeight(context) *
                                                            0.035,
                                                  )),
                                              title: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0,
                                                    displayHeight(context) *
                                                        0.02,
                                                    0,
                                                    displayHeight(context) *
                                                        0.005),
                                                child: Text(rating!.name,
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: displayHeight(
                                                              context) *
                                                          0.02,
                                                    )),
                                              ),
                                              subtitle: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RatingBar.builder(
                                                    itemSize:
                                                        displayHeight(context) *
                                                            0.03,
                                                    glowColor: Colors.black,
                                                    glowRadius: 10,
                                                    ignoreGestures: true,
                                                    initialRating:
                                                        rating.ratingRestoran,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    // tapOnlyMode: true,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.0),
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    onRatingUpdate: (rating) {
                                                      print(rating);
                                                    },
                                                  ),
                                                  Text(rating.ulasan,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.black54,
                                                        fontSize: displayHeight(
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
                                                padding: EdgeInsets.fromLTRB(
                                                    0,
                                                    0,
                                                    displayHeight(context) *
                                                        0.02,
                                                    displayHeight(context) *
                                                        0.01),
                                                child: Text(
                                                    rating.createdAt
                                                        .toString()
                                                        .substring(0, 11),
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black45,
                                                      fontSize: displayHeight(
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
            ),
          );
  }
}
