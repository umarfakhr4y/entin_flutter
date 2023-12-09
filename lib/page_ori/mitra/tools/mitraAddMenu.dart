part of '../../auth.dart';

class mitraAddMenu extends StatefulWidget {
  @override
  final int iddataoper;
  const mitraAddMenu({required this.iddataoper});

  mitraAddMenuState createState() => mitraAddMenuState();
}

class mitraAddMenuState extends State<mitraAddMenu> {
  int _count = 1;
  TextEditingController menuname = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController price = TextEditingController();
  String? selectedCat;

  final List<String> categories = ['Food', 'Drink'];

  void initState() {
    super.initState();
    print("ini id data" + widget.iddataoper.toString());
    // getDataLogin();
  }

  void addmenu() {
    if (selectedCat == "Food") {
      addmakanan(menuname.text, stock.text, type.text, price.text,
              widget.iddataoper.toString())
          .then((value) {
        setState(() {
          if (value == 200) {
            CoolAlert.show(
                context: context,
                type: CoolAlertType.success,
                confirmBtnColor: HexColor("#3D8361"),
                title: "Success",
                text: "Add menu success");
          } else {
            CoolAlert.show(
                context: context,
                type: CoolAlertType.error,
                confirmBtnColor: HexColor("#3D8361"),
                title: "Error",
                text: "Please Make sure the data is correct");
          }
        });
      });
    } else if (selectedCat == "Drink") {
      addminuman(menuname.text, stock.text, type.text, price.text,
              widget.iddataoper.toString())
          .then((value) {
        setState(() {
          if (value == 200) {
            CoolAlert.show(
                context: context,
                type: CoolAlertType.success,
                confirmBtnColor: HexColor("#3D8361"),
                title: "Success",
                text: "Add menu success");
          } else {
            CoolAlert.show(
                context: context,
                type: CoolAlertType.error,
                confirmBtnColor: HexColor("#3D8361"),
                title: "Error",
                text: "Please Make sure the data is correct");
          }
        });
      });
    }
  }

  // void klikLogout() {
  //   logOut();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "Add Menu",
            style: GoogleFonts.poppins(
                color: Colors.black,
                // fontSize: displayHeight(context) * 0.02,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: displayHeight(context) * 0.04,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: displayHeight(context) * 0.09,
                    backgroundColor: Colors.grey,
                    child: Center(
                      child: Text(
                        "Add Photo",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: displayHeight(context) * 0.001,
                    top: displayHeight(context) * 0.11,
                    child: CircleAvatar(
                      backgroundColor: HexColor("#3D8361"),
                      child: Center(
                        child: Icon(Icons.add),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: displayHeight(context) * 0.03,
              ),
              SizedBox(
                height: displayHeight(context) * 0.07,
                width: displayHeight(context) * 0.4,
                child: TextFormField(
                  controller: menuname,
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
                    labelText: "Menu's name",
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
                  controller: stock,
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
                    labelText: "Stocks",
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
                  controller: type,
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
                    labelText: "Menu's type",
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
                  controller: price,
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
                    labelText: "Price",
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
                child: DropdownButtonFormField2(
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: HexColor("#3D8361"),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      // border: InputBorder.none,
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10.0)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0))),
                  isExpanded: true,
                  hint: const Text(
                    'Categories',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                  items: categories
                      .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          )))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCat = value.toString();
                    });
                    print(selectedCat!.toLowerCase());
                  },
                  onSaved: (value) {
                    selectedCat = value.toString();
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 160,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: HexColor("#3D8361"),
                    ),
                    elevation: 2,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  addmenu();
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin:
                        EdgeInsets.only(right: displayHeight(context) * 0.08),
                    height: displayHeight(context) * 0.05,
                    width: displayHeight(context) * 0.15,
                    decoration: BoxDecoration(
                        color: HexColor("#3D8361"),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      "Add",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    )),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
