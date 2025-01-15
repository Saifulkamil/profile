import 'dart:io';

import 'package:core_module/core_module.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController {
  File? image;
  var profilepathpicture = "".obs;
  var isprofilepath = false.obs;

  Future<void> ambilfoto() async {
    // Meminta izin penyimpanan
    final plugin = DeviceInfoPlugin();
    final android = await plugin.androidInfo;

    final storageStatus = android.version.sdkInt < 33
        ? await Permission.storage.request()
        : PermissionStatus.granted;
    if (storageStatus == PermissionStatus.granted) {
      // Mengambil gambar dari kamera
      final cameraImage = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 50);

      if (cameraImage != null) {
        File imageFile = File(cameraImage.path);

        // Mendapatkan direktori publik (Pictures)
        Directory? picturesDir = await getExternalStorageDirectory();
        String publicPath = '${picturesDir?.parent.path}/Pictures/Profile';
        Directory publicDir = Directory(publicPath);

        // Buat folder jika belum ada
        if (!publicDir.existsSync()) {
          publicDir.createSync(recursive: true);
        }

        // Salin file ke direktori publik dengan nama file unik
        String fileName =
            'IMG_Profile_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}.jpg';
        File savedFile = await imageFile.copy('${publicDir.path}/$fileName');

        // Tambahkan file ke list dan perbarui profil path
        setpicture(savedFile.path);

        // Untuk Android: MediaScanner agar file muncul di galeri
        if (Platform.isAndroid) {
          await Process.run('am', [
            'broadcast',
            '-a',
            'android.intent.action.MEDIA_SCANNER_SCAN_FILE',
            '-d',
            'file://${savedFile.path}'
          ]);
        }

        debugPrint('File berhasil disimpan di: ${savedFile.path}');
      }
    } else {
      // Izin ditolak
      print('Izin penyimpanan ditolak');
    }
  }

  Future<void> pilihFoto() async {
    // Memilih gambar dari galeri
    final galleryImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (galleryImage != null) {
      File imageFile = File(galleryImage.path);

      // Tidak perlu menyimpan ke direktori eksternal, cukup gunakan path dari galeri
      setpicture(imageFile.path); // Set path gambar yang dipilih

      debugPrint('File berhasil diambil dari galeri: ${imageFile.path}');
    }
  }

  void setpicture(String path) {
    profilepathpicture.value = path;
    image = File(path);
    isprofilepath.value = true;
  }
}
