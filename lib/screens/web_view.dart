import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  const WebViewScreen(this.url, {super.key});

  @override
  State<WebViewScreen> createState() => _WebViewAppState(url);
}

class _WebViewAppState extends State<WebViewScreen> {
  late final WebViewController controller;
  final String url;
  _WebViewAppState(this.url);
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}