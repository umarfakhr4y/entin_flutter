part of '../auth.dart';

Future addinfoPengguna(
    String name, String email, String no_telp, String alamat) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? tokenbaru = prefs.getString('tokensave');
  // return tokenbaru;

  try {
    var data = {
      "name": name,
      "email": email,
      "no_telp": no_telp,
      "alamat": alamat
    };
    print(data);

    var url = "http://192.168.100.2:8000/api/admin/update-profile";
    var hasil = await http.put(Uri.parse(url),
        headers: {'Authorization': 'Bearer $tokenbaru'}, body: (data));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Login coy");
      return false;
    } else {
      print("Berhasil Apdet info pengguna");
      return true;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}
