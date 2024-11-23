import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:logger/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../utils/constant/asset_constant.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class WebViewLoad extends StatefulWidget {
  const WebViewLoad({super.key});

  @override
  State<WebViewLoad> createState() => _WebViewLoadState();
}

class _WebViewLoadState extends State<WebViewLoad> {

  String url="";
  String service= "Passport Services";

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    FlutterDownloader.initialize(debug: true, ignoreSsl: true);

  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height;
    final data = ModalRoute.of(context)?.settings.arguments;

    data == 'P1' ? url='${AssetConstants.baseUrlweb}uae_webview/p1.html' :
    data == 'P2' ? url='${AssetConstants.baseUrlweb}uae_webview/p2.html' :
    data == 'B' ? url='${AssetConstants.baseUrlweb}uae_webview/b.html' :
    data == 'M' ? url='${AssetConstants.baseUrlweb}uae_webview/m.html' :
    data == 'DOC' ? url='${AssetConstants.baseUrlweb}uae_webview/doc.html' :
    data == 'D' ? url='${AssetConstants.baseUrlweb}uae_webview/d.html' : url="";

    if(data == 'P1') {
      url='${AssetConstants.baseUrlweb}uae_webview/p1.html';
    }else if(data == 'P2') {
      url='${AssetConstants.baseUrlweb}uae_webview/p2.html';

    }else if(data == 'B'){
      url='${AssetConstants.baseUrlweb}uae_webview/b.html';
      service ="Birth Services";
    }else if(data == 'M'){
      url='${AssetConstants.baseUrlweb}uae_webview/m.html';
      service ="Marriage Services";
    }else if(data == 'D'){
      url='${AssetConstants.baseUrlweb}uae_webview/d.html';
      service ="Death Services";
    }else if(data == 'DOC'){
      url='${AssetConstants.baseUrlweb}uae_webview/doc.html';
      service ="Document Attestation";
    }else if(data == 'V'){
      url='${AssetConstants.baseUrlweb}uae_webview/v.html';
      service ="Visa Services";
    }else if(data == 'EMP1'){
      url='${AssetConstants.baseUrlweb}uae_webview/emp1.html';
      service ="SLBFE Registration";
    }else if(data == 'EMP2'){
      url='${AssetConstants.baseUrlweb}uae_webview/emp2.html';
      service ="Job Orders";
    }else if(data == 'EMP3'){
      url='${AssetConstants.baseUrlweb}uae_webview/emp3.html';
      service ="Domestic Workers";
    }else{
      url="";
    }

    WebViewController controller = WebViewController()
      ..clearCache()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) async {
            //return NavigationDecision.navigate;
            //Logger().d(request.url);
            if (request.url.contains('pdf')) {
              //Android
              Logger().d(request.url);
              FileDownloader.downloadFile(
                url: request.url.toString(),
              );

              //IOS
              //downloadFile(request.url.toString());

              // var directory;
              // if (Platform.isIOS) {
              //   directory = await getDownloadsDirectory();
              // } else {
              //   directory = "/storage/emulated/0/Download/";
              // }


              // final taskId = await FlutterDownloader.enqueue(
              //   url: request.url.toString(),
              //   headers: {}, // optional: header send with url (auth token etc)
              //   savedDir: directory,
              //   showNotification: true, // show download progress in status bar (for Android)
              //   openFileFromNotification: true,
              //   saveInPublicStorage: true,// click on notification to open downloaded file (for Android)
              // );
              //await FlutterDownloader.registerCallback(callback);

              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    Logger().d("test");
    Logger().d(data);
    Logger().d(url);



    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(service),
          backgroundColor: Colors.lightBlue,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: width,
                  height: height * 0.85,
                  child: WebViewWidget(controller: controller)),
              SizedBox(height: height * 0.01,),

            ],
          ),
        ),

      ),
    );

  }

  Future<void> downloadFile(String url, [String? filename]) async {
    var hasStoragePermission = await Permission.storage.isGranted;
    if (!hasStoragePermission) {
      final status = await Permission.storage.request();
      hasStoragePermission = status.isGranted;
    }
    if (hasStoragePermission) {
      final taskId = await FlutterDownloader.enqueue(
          url: url,
          headers: {},
          // optional: header send with url (auth token etc)
          savedDir: (await getTemporaryDirectory()).path,
          saveInPublicStorage: true,
          fileName: filename);
    }
  }
}
