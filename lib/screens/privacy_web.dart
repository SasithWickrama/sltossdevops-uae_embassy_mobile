import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:logger/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import '../widgets/drawer_widget.dart';
import '../utils/constant/asset_constant.dart';

class PolicyWeb extends StatefulWidget {
  const PolicyWeb({super.key});

  @override
  State<PolicyWeb> createState() => _PolicyWebState();
}

class _PolicyWebState extends State<PolicyWeb> {
  @override
  Widget build(BuildContext context) {

    String url= '${AssetConstants.baseUrlweb}uae_webview/policy.html' ;
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
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Privacy Policy"),
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