class StartPaymentResponse {
  final String iframeUrl;
  final String orderId;
  final String status;

  StartPaymentResponse({
    required this.iframeUrl,
    required this.orderId,
    required this.status,
  });

  factory StartPaymentResponse.fromJson(Map<String, dynamic> json) {
    return StartPaymentResponse(
      iframeUrl: json['iframeUrl'] as String,
      orderId: json['orderId'] as String,
      status: json['status'] as String,
    );
  }
}

class PaymentStatusResponse {
  final String status; // paid | failed | pending
  final String message;

  PaymentStatusResponse({required this.status, required this.message});

  factory PaymentStatusResponse.fromJson(Map<String, dynamic> json) {
    return PaymentStatusResponse(
      status: json['status'] as String,
      message: (json['message'] ?? '') as String,
    );
  }
}
