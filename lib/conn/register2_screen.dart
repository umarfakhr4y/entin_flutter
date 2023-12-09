import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'register3_screen.dart';
import 'package:http/http.dart' as http;

class Register2Screen extends StatefulWidget {
  @override
  _Register2ScreenState createState() => _Register2ScreenState();
}

class _Register2ScreenState extends State<Register2Screen> {
  TextEditingController NamaPemilik = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController NomorKTP = TextEditingController();
  TextEditingController NomorHandphone = TextEditingController();
  TextEditingController password = TextEditingController();

  Future registerUser(String namapemilik, String email, String no_ktp,
      String no_hp, String password) async {
    try {
      var data = {
        "nama_pemilik": namapemilik,
        "email": email,
        "no_ktp": no_ktp,
        "no_hp": no_hp,
        "password": password
      };
      print(data);

      var url = "http://192.168.18.225:8000/api/resto/register";

      var hasil = await http.post(Uri.parse(url), body: (data));
      // print(hasil);
      print(hasil.statusCode.toString());

      if (hasil.statusCode != 200) {
        print("Gagal melanjutkan ");
        return "Gagal";
      }
      print("Sukses");

      if (hasil.statusCode == 200) {
        return hasil.statusCode;
      }
    } catch (e) {
      print(e);
    }
  }

  void register2() {
    registerUser(NamaPemilik.text, email.text, NomorKTP.text,
            NomorHandphone.text, password.text)
        .then((value) {
      setState(() {
        if (value == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Register3Screen()),
          );
        } else {
          print("gagal Daftar");
        }
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -80,
            left: -80,
            right: -20,
            child: Image.asset(
              'assets/images/Frame 1796 pendek.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Isi Data Pemilik',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Email dan nomor Handphone akan digunakan untuk komunikasi terkait proses pendaftaran, masuk ke Food Way Mitra, dll.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 190,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama Pemilik Usaha',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Masukkan nama sesuai KTP',
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Email Pemilik Usaha',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Masukkan Email',
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Nomor KTP',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Masukkan nomor KTP',
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Nomor Handphone',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Masukkan nomor Handphone',
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Masukkan Password',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 24,
            left: 16,
            right: 16,
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 1.0,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register3Screen(),
                    ),
                  );
                  // Add your logic here for the "Selanjutnya" button
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: Text(
                  'Selanjutnya',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
