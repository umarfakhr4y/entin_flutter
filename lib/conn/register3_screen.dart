import 'package:flutter/material.dart';
import 'register2_screen.dart';
import 'login_screen.dart';
import 'package:http/http.dart' as http;

class Register3Screen extends StatefulWidget {
  @override
  _Register3ScreenState createState() => _Register3ScreenState();
}

class _Register3ScreenState extends State<Register3Screen> {
  TextEditingController namaOutlet = TextEditingController();
  TextEditingController nomorTelponOutlet = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController nomorRekening = TextEditingController();
  TextEditingController bank = TextEditingController();

  Future registerUser(String namaOutlets, String nomorTelponOutlets,
      String alamats, String nomorRekenings, String banks) async {
    try {
      var data = {
        "nama_outlet": namaOutlets,
        "no_telp_outlet": nomorTelponOutlets,
        "alamat": alamats,
        "no_rek": nomorRekenings,
        "bank": banks
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

  void register3() {
    registerUser(namaOutlet.text, nomorTelponOutlet.text, alamat.text,
            nomorRekening.text, bank.text)
        .then((value) {
      setState(() {
        if (value == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        } else {
          print("gagal Daftar");
        }
      });
    });
  }

  @override
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
                        builder: (context) => Register2Screen(),
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
                            'Isi Data Outlet',
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
                        'Lengkapi data dengan benar dan sesuai, jika terdapat ketidaksesuaian maka pendaftaran tidak bisa dilanjutkan.',
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
                  'Nama Outlet',
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
                    labelText: 'Masukkan Nama Outlet',
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Nomor Telepon Outlet',
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
                    labelText: 'Masukkan Nomor Telepon Outlet',
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Alamat Lengkap Outlet',
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
                    labelText: 'Masukkan Alamat Outlet',
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Nomor Rekening',
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
                    labelText: 'Masukkan Nomor Rekening',
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Bank',
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
                    labelText: 'Masukkan Nama Bank',
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
                      builder: (context) => LoginScreen(),
                    ),
                  );
                  // Add your logic here for the "Selanjutnya" button
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: Text(
                  'Daftar Sebagai Mitra',
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
