import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'dart:io' as io;
import 'package:dio/dio.dart' as dio;

import 'notification_utils.dart';
import 'package:path_provider/path_provider.dart';

class FileUtils {
  static Future<PlatformFile?> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    List<PlatformFile> files;
    files = [];
    if (result != null) {
      files = result.files;
      return files.first;
    }

    return null;
  }

  static Future<PlatformFile?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any,
    );
    List<PlatformFile> files;
    files = [];
    if (result != null) {
      files = result.files;
      return files.first;
    }

    return null;
  }

  static Future<PlatformFile?> pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ["pdf"]);
    List<PlatformFile> files;
    files = [];
    if (result != null) {
      files = result.files;
      return files.first;
    }

    return null;
  }

  static Future<List<PlatformFile>?> pickFiles() async {
    NotificationUtils.showLoading();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.any,
    );
    NotificationUtils.hideLoading();
    List<PlatformFile> files;
    files = [];
    if (result != null) {
      files = result.files;

      return files;
    }

    return null;
  }

  static Future<List<PlatformFile>?> pickImages() async {
    NotificationUtils.showLoading();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );
    NotificationUtils.hideLoading();
    List<PlatformFile> files;
    files = [];
    if (result != null) {
      files = result.files;

      return files;
    }

    return null;
  }

  static Future handleFileClick(String pdf) async {
    String fileName = pdf.split("/").last;
    fileName = fileName + ".pdf";
    print(fileName);

    io.Directory appDocDir = await getApplicationDocumentsDirectory();
    io.File fileDir = io.File(appDocDir.path + "/" + fileName);

    if (await fileDir.exists()) {
      print("exists");
      print(fileDir.path);
      OpenFile.open(fileDir.path);
    } else {
      try {
        NotificationUtils.showLoading();
        print(fileDir.path);
        io.File file = io.File(fileDir.path);

        var raf = file.openSync(mode: io.FileMode.write);
        dio.Response response = await dio.Dio().get(
          pdf,
          options: dio.Options(
              responseType: dio.ResponseType.bytes,
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }),
        );
        print(response.headers);
        raf.writeFromSync(response.data);
        print(raf.lengthSync());

        await raf.close();
        NotificationUtils.hideLoading();
      } catch (e) {
        print(e.toString());
        NotificationUtils.hideLoading();
        NotificationUtils.showSnackBar(content: "error_download".tr);
      }
    }
  }
}
