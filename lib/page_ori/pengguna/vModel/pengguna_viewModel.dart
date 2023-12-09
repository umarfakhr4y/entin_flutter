part of '../authModel.dart';

late DataBanner dataBanner;
late DataOrderPengguna dataOrderPengguna;
late DataMitraHome dataMitraHome;

Future getBannerVmodel() async {
  try {
    var url = "http://192.168.100.2:8000/api/bannerPengguna";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin Banner");
      return null;
    }

    if (hasil.statusCode == 200) {
      print("Sukses Dapetin Banner");
      // print(hasil.body.le);
      dataBanner = dataBannerFromJson(hasil.body.toString());
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future getPenggunaOrder(int id) async {
  try {
    var url = "http://192.168.100.2:8000/api/orderusers/${id}";

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
      final data = dataOrderPenggunaFromJson(hasil.body.toString());
      return data;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future getPenggunaOrderComplete(int id) async {
  try {
    var url = "http://192.168.100.2:8000/api/orderuserscomplete/${id}";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin order data complete");
      return null;
    }

    if (hasil.statusCode == 200) {
      print("Sukses Dapetin order data complete");
      // print(hasil.body.le);
      final data = dataOrderPenggunaCompleteFromJson(hasil.body.toString());
      return data;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

Future getMitraVmodel() async {
  try {
    var url = "http://192.168.100.2:8000/api/data";

    var hasil = await http.get(Uri.parse(url));
    // print(hasil);
    print(hasil.statusCode.toString());

    if (hasil.statusCode != 200) {
      print("gagal Dapetin Banner");
      return null;
    }

    if (hasil.statusCode == 200) {
      print("Sukses Dapetin Data");
      // print(hasil.body.le);
      final data = dataMitraHomeFromJson(hasil.body);

      // dataMitraHome = dataMitraHomeFromJson(hasil.body.toString());
      return data;
    }
  } catch (e) {
    print(e.toString());
    // log(e.toString());
  }
}

// Future getSpecRestoVmodel(int id) async {
//   // return print(id);
//   try {
//     var url = "http://192.168.100.2:8000/api/users/${id}";

//     var hasil = await http.get(Uri.parse(url));
//     // print(hasil);
//     print(hasil.statusCode.toString());

//     if (hasil.statusCode != 200) {
//       print("gagal Dapetin Banner");
//       return null;
//     }

//     if (hasil.statusCode == 200) {
//       // print(hasil.body.le);
//       final data = restoSpecbyIdFromJson(hasil.body);
//       print("Sukses Dapetin Data");
//       return data;
//     }
//   } catch (e) {
//     print(e.toString());
//     // log(e.toString());
//   }
// }

class getRestoID {
  Future<RestoSpecbyId?> getSpecRestoVmodel(int id) async {
    try {
      var url = "http://192.168.100.2:8000/api/users/${id}";

      var hasil = await http.get(Uri.parse(url));
      // print(hasil);
      print(hasil.statusCode.toString());

      if (hasil.statusCode != 200) {
        print("gagal Dapetin Banner");
        return null;
      }

      if (hasil.statusCode == 200) {
        // print(hasil.body.le);
        final data = restoSpecbyIdFromJson(hasil.body);
        print("Sukses Dapetin Data");
        return data;
      }
    } catch (e) {
      print(e.toString());
      // log(e.toString());
    }
  }
}
