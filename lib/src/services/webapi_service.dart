import 'dart:convert';

// import 'package:cmflutter0/src/models/reportsummary_response.dart';
import 'package:cmflutter0/src/models/youtuce_response.dart';
import 'package:dio/dio.dart';

class WebApiService {
  Future<List<Youtube>> feed() async {
    final dio = Dio();
    final result = await dio.get(
        "https://codemobiles.com/adhoc/youtubes/index_new.php?username=admin&password=password&type=songs");
    final youtubeResponse = youtubeResponseFromJson(result.data);

    // print(youtubeResponse.youtubes[0].title);
    return youtubeResponse.youtubes;
  }

  // Future<List<Rowstable1>> getreport() async {
  //   final dio = Dio();
  //   final result = await dio.get(
  //       "https://event.rtbtechnology.com/webapi/api/reportevent/2024-02-27");
  //   final reportResponse = summaryResponseFromJson(result.data);

  //   // print(reportResponse.rowstable1[0].brnName);
  //   return reportResponse.rowstable1;
  // }
}
