part of '../../auth.dart';

// String token;
final storage = new FlutterSecureStorage();
// String tokenRead = await storage.read(key: 'namatoken');

Future getDropspot() async {
  try {
    // print(id);
    var url = "http://192.168.100.2:8000/api/dropspot/1";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin dropspot");
      return null;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      final data = adminDropspotModelFromJson(hasil.body);
      print("Sukses Dapetin dropspot");
      return data;
    }
  } catch (e) {
    print(e.toString() + "INI E");
    // log(e.toString());
  }
}

Future<List<String>?> getLokasiList() async {
  try {
    var url = "http://192.168.100.2:8000/api/lokasi";

    var hasil = await http.get(Uri.parse(url));
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("Gagal Mendapatkan Data");
      return null;
    }

    if (hasil.statusCode == 200) {
      final jsonResponse = json.decode(hasil.body);
      final data = jsonResponse['Success'];

      List<String> lokasiList = [];
      List<String> idList = [];

      data.forEach((item) {
        lokasiList.add(item['nama_lokasi']);
      });

      print("Sukses Mendapatkan Lokasi");
      return lokasiList;
    }
  } catch (e) {
    print(e.toString() + " INI E");
    // log(e.toString());
  }

  return null;
}

Future<List<String>?> getLokasiListid() async {
  try {
    var url = "http://192.168.100.2:8000/api/lokasi";

    var hasil = await http.get(Uri.parse(url));
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("Gagal Mendapatkan Data");
      return null;
    }

    if (hasil.statusCode == 200) {
      final jsonResponse = json.decode(hasil.body);
      final data = jsonResponse['Success'];

      List<String> lokasiList = [];
      List<String> idList = [];

      data.forEach((item) {
        idList.add(item['id_lokasi']);
      });

      print("Sukses Mendapatkan Lokasi");
      return idList;
    }
  } catch (e) {
    print(e.toString() + " INI E");
    // log(e.toString());
  }

  return null;
}

Future getMitraListt() async {
  try {
    // print(id);
    var url = "http://192.168.100.2:8000/api/data";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin Data");
      return null;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      final data = adminListMitraFromJson(hasil.body);
      print("Sukses Dapetin Data");
      return data;
    }
  } catch (e) {
    print(e.toString() + "INI E");
    // log(e.toString());
  }
}

Future getMitraListtactive() async {
  try {
    // print(id);
    var url = "http://192.168.100.2:8000/api/dataactive";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin Data active");
      return null;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      final data = adminListMitraFromJson(hasil.body);
      print("Sukses Dapetin Dataa active");
      return data;
    }
  } catch (e) {
    print(e.toString() + "INI E");
    // log(e.toString());
  }
}

Future getMitraListtnotactive() async {
  try {
    // print(id);
    var url = "http://192.168.100.2:8000/api/datanotactive";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin Data not active");
      return null;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      final data = adminListMitraFromJson(hasil.body);
      print("Sukses Dapetin Data not active");
      return data;
    }
  } catch (e) {
    print(e.toString() + "INI E");
    // log(e.toString());
  }
}
