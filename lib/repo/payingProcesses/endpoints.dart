import 'dart:convert';
import 'package:http/http.dart' as http;

class Endpoints {
  Future<Map<String, dynamic>> startPayment({
    required int amountKurus,
    required String orderId,
  }) async {
    final res = await http.post(
      Uri.parse("https://senin-domain.com/pay/start"),
      body: {"amount": amountKurus.toString(), "orderId": orderId},
    );

    if (res.statusCode != 200) {
      throw Exception("Payment start failed: ${res.body}");
    }
    return jsonDecode(res.body) as Map<String, dynamic>;
  }

  Future<String> getPaymentStatus(String orderId) async {
    final res = await http.get(
      Uri.parse("https://senin-domain.com/pay/status?orderId=$orderId"),
    );
    if (res.statusCode != 200) throw Exception("status error");
    return res.body; // paid / failed / pending gibi
  }
}
