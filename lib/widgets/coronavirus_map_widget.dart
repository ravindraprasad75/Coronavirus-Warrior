import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../main.dart';

class CoronavirusMapWidget extends StatelessWidget {
  CoronavirusMapWidget({
    Key key,
  }) : super(key: key);

  final Set gestureRecognizers = [
    Factory(() => EagerGestureRecognizer()),
  ].toSet();

  final url = Uri.dataFromString(
          '<html><body><iframe style="width:100%"; width="560" height="380" src="https://coronavirus.app/map?mode=infected&embed=true" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></body></html>',
          mimeType: 'text/html')
      .toString();

  @override
  Widget build(BuildContext context) {
    return WebView(
      key: globalWebKey,
      initialUrl: url,
      gestureRecognizers: gestureRecognizers,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
