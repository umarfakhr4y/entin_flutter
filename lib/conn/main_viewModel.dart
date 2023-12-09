part of 'auth.dart';

// String token;
final storage = new FlutterSecureStorage();
String token = "";
String tokenstorage = "";
String role = "";
late DataLogin data;

// String tokenRead = await storage.read(key: 'namatoken');

class UserViewModel {
  Future<DataLogin> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? tokenbaru = prefs.getString('tokensave');

    String token = storage.read(key: 'tokenLogin').toString();
    try {
      print("ini baru " + tokenbaru.toString());
      var url = "http://192.168.100.2:8000/api/userdetail";

      var hasil = await http
          .get(Uri.parse(url), headers: {'Authorization': 'Bearer $tokenbaru'});
      print('masuk; response code: ${hasil.statusCode}');
      if (hasil.statusCode != 200) {
        print("Gagal login");
        return Future.error("error");
      }
      data = dataLoginFromJson(hasil.body.toString());
      print("Sukses ngambil data ngab");
      return data;
    } catch (e) {
      print("Error pada catch disini $e");
      return Future.error("error");
    }
  }
}

Future loginUser(String email, String password) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    var data = {"email": email, "password": password};
    print(data);

    // var url = "http://localhost:8000/api/login";
    // var url = "http://10.0.0.2:8000/api/login";
    var url = "http://192.168.100.2:8000/api/login";
    // var url = "http://127.0.0.1/api/login";
    // var url = "https://coperationv2.herokuapp.com/api/login";
    var hasil = await http.post(Uri.parse(url), body: (data));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Login coy");
      return "gagal";
    }
    print("Sukses cuy");
    token = (tokenFromJson(hasil.body)).token;
    role = (tokenFromJson(hasil.body)).role.first;
    // print(token);
    // await storage.write(key: 'tokenLogin', value: token);
    await storage.write(key: 'tokenLogin', value: token);
    await prefs.setString('tokensave', '$token');
    // tokenstorage = await storage.read(key: 'tokenLogin').toString();

    // print("ini token" + token);
    // print("ini token" + tokenstorage);
    // print("ini token" + role);

    if (tokenstorage != null) {
      print("token berhasil disimpan");
      print("ini token dari storage " + tokenstorage);
    }
    if (role == "admin") {
      print("login sebagai Admin");
      return "admin";
    }
    if (role == "mitra") {
      print("login sebagai Mitra");
      return "mitra";
    }
    if (role == "pengguna") {
      print("login sebagai Pengguna");
      return "pengguna";
    } else {
      return "gagal";
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future regisUser(
    String name, String email, String password, DateTime lahir) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  try {
    var data = {
      "name": name,
      "email": email,
      "password": password,
      "image": "no_ingfo",
      "no_telp": "no_ingfo",
      "alamat": "no_ingfo",
      "lahir": lahir.toIso8601String(),
      "role": "pengguna"
    };
    print(data);
    // return;
    var url = "http://192.168.100.2:8000/api/admin/register";

    var hasil = await http.post(Uri.parse(url), body: (data));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Login coy");
      return null;
    }
    print("Sukses cuy");
    token = (dataRegisFromJson(hasil.body)).success.token;
    role = (dataRegisFromJson(hasil.body)).success.role.first;
    // print(token);
    // await storage.write(key: 'tokenLogin', value: token);
    // await storage.write(key: 'tokenLogin', value: token);
    await prefs.setString('tokensave', '$token');
    // tokenstorage = await storage.read(key: 'tokenLogin').toString();

    // print("ini token" + token);
    // print("ini token" + tokenstorage);
    // print("ini token" + role);

    if (token != null) {
      print("token berhasil disimpan");
      print("ini token dari storage " + token);
    }
    // return;
    if (hasil.statusCode == 200) {
      print("Daftar Sukses");
      return "suksescuy11";
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future logOut() async {
  // String? token = await storage.read(key: 'tokenLogin');
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? tokenbaru = prefs.getString('tokensave');

  // String value = await storage.read(key: 'tokenLogin');
  try {
    // print("ini tokennya " + token.toString());
    var url = "http://192.168.100.2:8000/api/logout";

    var hasil = await http
        .get(Uri.parse(url), headers: {'Authorization': 'Bearer $tokenbaru'});
    print('masuk; response code: ${hasil.statusCode}');
    if (hasil.statusCode == 200) {
      await prefs.remove('tokensave');
      print("ini token setelah dihapus" + tokenbaru.toString());
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('tokenauto');
    }
    return "logout";
  } catch (e) {
    print(e);
  }
}
