import 'dart:convert';
import 'package:http/http.dart' as http;

// ─── Response Models ────────────────────────────────────────────────

class StartResponse {
  final String orderId;
  final String iframeUrl;

  StartResponse({required this.orderId, required this.iframeUrl});

  factory StartResponse.fromJson(Map<String, dynamic> json) {
    return StartResponse(
      orderId: json['orderId']?.toString() ?? "",
      iframeUrl: json['iframeUrl'] as String,
    );
  }
}

class StatusResponse {
  final String orderId;
  final String status; // "paid" | "failed" | "pending"

  StatusResponse({required this.orderId, required this.status});

  factory StatusResponse.fromJson(Map<String, dynamic> json) {
    return StatusResponse(
      orderId: json['orderId'] as String,
      status: json['status']?.toString() ?? 'pending',
    );
  }
}

// ─── API Client ─────────────────────────────────────────────────────

class ToslaPaymentApi {
  final String baseUrl;

  ToslaPaymentApi({required this.baseUrl});

  // POST /start.php
  // Flutter sends cart amount, gets back iframeUrl for 3D payment screen
  Future<StartResponse> start({
    required String orderId,
    required int amountKurus,
    required String userId,
  }) async {
    final uri = Uri.parse('${baseUrl}start.php');

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'orderId': orderId,
        'amountKurus': amountKurus,
        'userId': userId,
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return StartResponse.fromJson(json);
    } else {
      throw Exception('start.php failed: ${response.body}');
    }
  }

  // GET /status.php?orderId=...
  // Check payment status: "paid", "failed", or "pending"
  Future<StatusResponse> status({required String orderId}) async {
    final uri = Uri.parse(
      '${baseUrl}status.php',
    ).replace(queryParameters: {'orderId': orderId});

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return StatusResponse.fromJson(json);
    } else {
      throw Exception('status.php failed: ${response.body}');
    }
  }
}
