// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Uses the http_server package.
// Similar to mini_file_server.dart, which uses straight Dart APIs.
// For all requests serves index.html in the same directory
// as this script.
// Also see static_file_server.dart.

import 'dart:io';
import 'package:http_server/http_server.dart';

void main() {

  VirtualDirectory staticFiles = new VirtualDirectory('.');

  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 4046).then((server) {
    server.listen((req) {
      staticFiles.serveFile(new File('index.html'), req);
    });
  });
}
