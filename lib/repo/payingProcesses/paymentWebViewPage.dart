import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:yorgan_yastik/repo/payingProcesses/api_client.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = 'payment';
  const PaymentScreen({
    super.key,
    required this.orderId,
    required this.amountKurus,
    required this.userId,
  });

  final String orderId;
  final int amountKurus;
  final String userId;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final api = ToslaPaymentApi(
    baseUrl: "https://yorganyastik.com.tr/tosla_api/",
  );

  WebViewController? _web;
  bool _loading = true;
  bool _checking = false;
  late String _orderId;

  @override
  void initState() {
    super.initState();
    _orderId = widget.orderId;
    _startAndOpen();
  }

  Future<void> _startAndOpen() async {
    try {
      if (mounted) setState(() => _loading = true);

      final start = await api.start(
        orderId: widget.orderId,
        amountKurus: widget.amountKurus,
        userId: widget.userId,
      );

      print("🚀 Start isteği atılıyor...");

      _orderId = start.orderId;
      print("✅ iframeUrl: ${start.iframeUrl}");
      print("✅ orderId: ${start.orderId}");

      final controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted);

      // ✅ Android SSL bypass
      if (controller.platform is AndroidWebViewController) {
        (controller.platform as AndroidWebViewController).setOnShowFileSelector(
          (_) async => [],
        );
      }

      controller
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (url) {
              print("🌐 URL: $url");
              // ❌ _loading = true KALDIRILDI — gereksiz beyaz ekran
            },
            onPageFinished: (url) {
              print("✅ PageFinished: $url");
              if (!mounted) return;
              setState(() => _loading = false);

              // ✅ Polling burada başlasın — sayfa yüklenince
              _startPolling();
            },
            onWebResourceError: (err) {
              print("❌ WebResourceError: ${err.description}");
              print("❌ errorCode: ${err.errorCode}");
              print("❌ url: ${err.url}");
              if (!mounted) return;
              setState(() => _loading = false);
            },
            onNavigationRequest: (request) {
              print("🔀 Nav: ${request.url}");
              return NavigationDecision.navigate;
            },
            onHttpAuthRequest: (HttpAuthRequest request) {
              request.onProceed(WebViewCredential(user: '', password: ''));
            },
          ),
        )
        ..loadRequest(
          Uri.parse(start.iframeUrl),
          // ✅ SSL hatalarını geç
          headers: {'Cache-Control': 'no-cache'},
        );

      if (!mounted) return;
      setState(() {
        _web = controller;
        _loading = true;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _loading = false);
      Get.back();
      Get.snackbar(
        "Ödeme Hatası",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  bool _pollingActive = false;

  void _startPolling() {
    if (_pollingActive) return;
    _pollingActive = true;

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return false;

      try {
        final st = await api.status(orderId: _orderId);
        print("📊 Polling: ${st.status}");

        if (st.status == "paid") {
          Get.offNamed("/orderDetail", arguments: _orderId);
          return false;
        }
        if (st.status == "failed") {
          Get.back();
          Get.snackbar(
            "Ödeme Başarısız",
            "Lütfen tekrar deneyin",
            snackPosition: SnackPosition.BOTTOM,
          );
          return false;
        }
      } catch (e) {
        print("⚠️ Polling hata: $e");
      }

      return mounted; // mounted değilse dur
    });
  }

  Future<void> _checkStatusAndExit() async {
    if (_checking) return;
    _checking = true;

    try {
      for (int i = 0; i < 10; i++) {
        final st = await api.status(orderId: _orderId);

        if (st.status == "paid") {
          Get.offNamed("/orderDetail", arguments: _orderId);
          return;
        }

        if (st.status == "failed") {
          Get.back();
          Get.snackbar(
            "Ödeme Başarısız",
            "Lütfen tekrar deneyin",
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }

        await Future.delayed(const Duration(seconds: 1));
      }

      Get.back();
      Get.snackbar(
        "Ödeme Durumu",
        "Ödeme kontrol ediliyor, sonra tekrar bakın",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Durum Hatası",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      _checking = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        await _checkStatusAndExit();
      },
      child: Scaffold(
        backgroundColor: AppColors().backGroungdColor,
        appBar: AppBar(
          backgroundColor: AppColors().backGroungdColor,
          title: const Text("Ödeme"),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: _checking ? null : _checkStatusAndExit,
          ),
        ),
        body: Stack(
          children: [
            // ✅ Always show WebView even while loading
            if (_web != null)
              Positioned.fill(child: WebViewWidget(controller: _web!)),
            if (_loading)
              const Positioned.fill(
                child: ColoredBox(
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
