import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:logger/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import '../utils/constant/asset_constant.dart';
import '../widgets/drawer_widget.dart';

class MessageWeb extends StatefulWidget {
  const MessageWeb({super.key});

  @override
  State<MessageWeb> createState() => _MessageWebState();
}

class _MessageWebState extends State<MessageWeb> {
  @override
  Widget build(BuildContext context) {

    String url='${AssetConstants.baseUrlweb}uae_webview/message.html' ;
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height;

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    WebViewController controller = WebViewController.fromPlatformCreationParams(params)
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
          onNavigationRequest: (NavigationRequest request) {
            //return NavigationDecision.navigate;
            //Logger().d(request.url);
            if (request.url.contains('pdf')) {
              Logger().d(request.url);
              FileDownloader.downloadFile(
                url: request.url.toString(),
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Embassador message"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightBlue,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.80,
                  child: WebViewWidget(controller: controller)),
              SizedBox(height: height * 0.01,),
            ],
          ),
        ),
        drawer: const DrawerWidget(),
      ),
    );
  }
}