import 'dart:async';

import 'package:cool_alert/cool_alert.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kakaem_pab_project/page_ori/pengguna/authModel.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:popup_card/popup_card.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

import '../../../conn/auth.dart';
import '../../../size_helper.dart';
import 'package:http/http.dart' as http;
import 'package:banner_carousel/banner_carousel.dart';
import 'package:expandable_card/expandable_card.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import '../conn/model/model.dart';
import './pengguna/model/dataMitraHome.dart';
import './pengguna/model/dataOrderPengguna.dart';
import 'pengguna/model/dataOrderPenggunaComplete.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'mitra/model/rating_model.dart';
import 'mitra/model/rerata_rating_model.dart';
import 'mitra/model/dataOrderMitra.dart';
import 'mitra/model/dataOrderMitraRequest.dart';
import 'mitra/model/dataOrderMitraComplete.dart';
import 'mitra/model/dataOrderMitraOnProgress.dart';
import 'admin/model/adminMitraList_model.dart';
import 'admin/model/adminLokasi_model.dart';
import 'admin/model/adminDropspot_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:hexcolor/hexcolor.dart';
import '../conn/auth.dart';

part 'admin/adminMain.dart';
part 'admin/adminHome.dart';
part 'admin/adminProfile.dart';
part 'admin/tools/adminTRHistory.dart';
part 'admin/tools/adminMitraList.dart';
part 'admin/tools/adminDropspot.dart';
part 'admin/tools/adminMenubyMitra.dart';
// part 'admin/adminMain.dart';

part 'admin/conn/admin_viewmodel.dart';
part 'mitra/mitraMain.dart';
part 'mitra/mitraHome.dart';
part 'mitra/mitraProfile.dart';
part 'mitra/mitraChat.dart';
part 'mitra/tools/mitraNotif.dart';
part 'mitra/tools/mitraAddMenu.dart';
part 'mitra/tools/mitraReview.dart';
part 'mitra/tools/mitraOrder.dart';
part 'mitra/tools/mitraMenu.dart';
part 'mitra/conn/mitraVmodel.dart';
part 'mitra/model/resto_model.dart';

part 'pengguna/penggunaMain.dart';
part 'pengguna/spesificRestoPengguna.dart';
part 'pengguna/chatPengguna.dart';
part 'pengguna/voucherPengguna.dart';
part 'pengguna/penggunaOrder.dart';
part 'pengguna/profilePengguna.dart';
part 'pengguna/cartPengguna.dart';
part 'verif_data/verifData.dart';
part 'verif_data/verif_vModel.dart';
