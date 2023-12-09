part of '../../auth.dart';

Future getData(int id) async {
  try {
    // print(id);
    var url = "http://192.168.100.2:8000/api/data/${id}";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin Data");
      return null;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      final data = dataRestoFromJson(hasil.body);
      print("Sukses Dapetin Data");
      return data;
    }
  } catch (e) {
    print(e.toString() + "INI E");
    // log(e.toString());
  }
}

Future getDatarev(int id) async {
  try {
    // print(id);
    var url = "http://192.168.100.2:8000/api/data/${id}";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin Data");
      return null;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      final data = dataRevRerataFromJson(hasil.body);
      print("Sukses Dapetin Data");
      return data;
    }
  } catch (e) {
    print(e.toString() + "INI E");
    // log(e.toString());
  }
}

Future editData(int id, String nama, String notelp, String alamat) async {
  try {
    // print(id);
    var data = {
      "name_restoran": nama,
      "notelp_restoran": notelp,
      "alamat_restoran": alamat,
    };
    var url = "http://192.168.100.2:8000/api/data/${id}";

    var hasil = await http.put(Uri.parse(url), body: data);
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin menu");
      return null;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      // final data = restoSpecbyIdFromJson(hasil.body);
      print("Sukses hapus makanan");
      return "sukses";
    }
  } catch (e) {
    print(e.toString() + "INI E");
    // log(e.toString());
  }
}

Future addmakanan(String name_barang, String stock, String tipe, String price,
    String data_id) async {
  try {
    // print(id);
    var url = "http://192.168.100.2:8000/api/tambahmakanan";

    var data = {
      "name_barang": name_barang,
      "stock_barang": stock,
      "jenis_barang": tipe,
      "harga_barang": price,
      "data_id": data_id
    };
    // return data;
    var hasil = await http.post(Uri.parse(url), body: data);
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal add makanan");
      return hasil.statusCode;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      print("sukses add makanan");
      return hasil.statusCode;
    }
  } catch (e) {
    print(e.toString() + "INI E");
    // log(e.toString());
  }
}

Future addminuman(String name_barang, String stock, String tipe, String price,
    String data_id) async {
  try {
    // print(id);
    var url = "http://192.168.100.2:8000/api/tambahminuman";

    var data = {
      "name_barang": name_barang,
      "stock_barang": stock,
      "jenis_barang": tipe,
      "harga_barang": price,
      "data_id": data_id
    };
    // return data;
    var hasil = await http.post(Uri.parse(url), body: data);
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal add makanan");
      return hasil.statusCode;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      print("sukses add makanan");
      return hasil.statusCode;
    }
  } catch (e) {
    print(e.toString() + "INI E");
    // log(e.toString());
  }
}

Future getMenu(int id) async {
  try {
    // print(id);
    var url = "http://192.168.100.2:8000/api/users/${id}";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin menu");
      return null;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      final data = restoSpecbyIdFromJson(hasil.body);
      print("Sukses Dapetin menu");
      return data;
    }
  } catch (e) {
    print(e.toString() + "INI E");
    // log(e.toString());
  }
}

Future getRating(int id) async {
  try {
    // print(id);
    var url = "http://192.168.100.2:8000/api/rating/${id}";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin menu");
      return null;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      final data = dataRatingFromJson(hasil.body);
      print("Sukses Dapetin menu");
      return data;
    }
  } catch (e) {
    print(e.toString() + "INI E");
    // log(e.toString());
  }
}

Future getMitraOrderRecent(int id) async {
  try {
    var url = "http://192.168.100.2:8000/api/mitra/order/${id}";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin order data");
      return null;
    }

    if (hasil.statusCode == 200) {
      print("Sukses Dapetin order data");
      // print(hasil.body.le);
      final data = dataOrderMitraFromJson(hasil.body.toString());
      return data;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future getMitraOrderRequest(int id) async {
  try {
    var url = "http://192.168.100.2:8000/api/mitra/orderreq/${id}";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin order data");
      return null;
    }

    if (hasil.statusCode == 200) {
      print("Sukses Dapetin order data");
      // print(hasil.body.le);
      final data = dataOrderMitraRequestFromJson(hasil.body.toString());
      return data;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future getMitraOrderOnProgress(int id) async {
  try {
    var url = "http://192.168.100.2:8000/api/mitra/orderonpr/${id}";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin order data");
      return null;
    }

    if (hasil.statusCode == 200) {
      print("Sukses Dapetin order data");
      // print(hasil.body.le);
      final data = dataOrderMitraOnProgressFromJson(hasil.body.toString());
      return data;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future getMitraOrderComplete(int id) async {
  try {
    var url = "http://192.168.100.2:8000/api/mitra/ordercomplete/${id}";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin order data");
      return null;
    }

    if (hasil.statusCode == 200) {
      print("Sukses Dapetin order data");
      // print(hasil.body.le);
      final data = dataOrderMitraCompleteFromJson(hasil.body.toString());
      return data;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future editMinuman(
    int id, String nama, String stock, String jenis, String harga) async {
  try {
    // print(id);
    var data = {
      "name_barang": nama,
      "stock_barang": stock,
      "jenis_barang": jenis,
      "harga_barang": harga,
    };
    var url = "http://192.168.100.2:8000/api/editminuman/${id}";

    var hasil = await http.put(Uri.parse(url), body: data);
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal edit minuman");
      return null;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      // final data = restoSpecbyIdFromJson(hasil.body);
      print("Sukses edit minuman");
      return "sukses";
    }
  } catch (e) {
    print(e.toString() + "INI E");
    // log(e.toString());
  }
}

Future editMakanan(
    int id, String nama, String stock, String jenis, String harga) async {
  try {
    // print(id);
    var data = {
      "name_barang": nama,
      "stock_barang": stock,
      "jenis_barang": jenis,
      "harga_barang": harga,
    };
    var url = "http://192.168.100.2:8000/api/editmakanan/${id}";

    var hasil = await http.put(Uri.parse(url), body: data);
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal edit makanan");
      return null;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      // final data = restoSpecbyIdFromJson(hasil.body);
      print("Sukses edit makanan");
      return "sukses";
    }
  } catch (e) {
    print(e.toString() + "INI E");
    // log(e.toString());
  }
}

Future deleteMakanan(int id) async {
  try {
    // print(id);
    var url = "http://192.168.100.2:8000/api/delmakanan/${id}";

    var hasil = await http.delete(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin menu");
      return null;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      // final data = restoSpecbyIdFromJson(hasil.body);
      print("Sukses hapus makanan");
      return "sukses";
    }
  } catch (e) {
    print(e.toString() + "INI E");
    // log(e.toString());
  }
}

Future deleteMinuman(int id) async {
  try {
    // print(id);
    var url = "http://192.168.100.2:8000/api/delminuman/${id}";

    var hasil = await http.delete(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin menu");
      return null;
    }

    if (hasil.statusCode == 200) {
      // print(hasil.body.le);
      // final data = restoSpecbyIdFromJson(hasil.body);
      print("Sukses hapus minuman");
      return "sukses";
    }
  } catch (e) {
    print(e.toString() + "INI E");
    // log(e.toString());
  }
}
