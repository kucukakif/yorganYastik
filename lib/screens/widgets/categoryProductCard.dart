import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yorgan_yastik/theme/app_colors.dart';

class CategoryProductCard extends StatelessWidget {
  const CategoryProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.priceText,
    required this.rating,
    required this.ratingCountText,
    this.badgeText = "BEST SELLER",
    this.onFavorite,
    this.onAddToCart,
  });

  final String imageUrl;
  final String title;
  final String subtitle;
  final int priceText; // "89.00" gibi
  final double rating; // 4.8 gibi
  final String ratingCountText; // "(1.2k)" gibi
  final String badgeText;
  final VoidCallback? onFavorite;
  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            blurRadius: 18,
            offset: const Offset(0, 10),
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
        horizontal: width * .03,
        vertical: height * .015,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // IMAGE AREA
          AspectRatio(
            aspectRatio: 1.4, // görsel alanı oranı
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: AppColors().borderColor,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Center(
                        child: Icon(Icons.broken_image_outlined, size: 36),
                      ),
                    ),
                  ),
                ),

                // favorite button
                Positioned(
                  top: 20,
                  right: 20,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child: InkWell(
                      onTap: onFavorite,
                      child: Icon(
                        Icons.favorite_border,
                        color: Color(0xFF8A98AD),
                        size: 19,
                      ),
                    ),
                  ),
                ),

                // badge
                Positioned(
                  left: 18,
                  bottom: 18,
                  child: Container(
                    alignment: Alignment.center,
                    width: width * .28,
                    height: height * .031,
                    decoration: BoxDecoration(
                      color: AppColors().mainColor,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Text(
                      badgeText,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // CONTENT AREA
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title + price
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 19,
                          height: 1.1,
                          fontWeight: FontWeight.w700,
                          color: AppColors().fontColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      NumberFormat.currency(
                        locale: "tr_TR",
                        symbol: "₺",
                      ).format(priceText),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors().mainColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF738096),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 14),

                // rating row
                Row(
                  children: [
                    ...List.generate(4, (_) => const Star(full: true)),
                    const Star(full: false),
                    const SizedBox(width: 12),
                    Text(
                      '${rating.toStringAsFixed(1)} $ratingCountText',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF8A98AD),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                // button
                SizedBox(
                  width: double.infinity,
                  height: height * .05,
                  child: ElevatedButton.icon(
                    onPressed: onAddToCart,
                    icon: const Icon(
                      Icons.shopping_basket_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Sepete Ekle",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        AppColors().mainColor,
                      ),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Star extends StatelessWidget {
  const Star({required this.full});
  final bool full;

  @override
  Widget build(BuildContext context) {
    return Icon(
      full ? Icons.star : Icons.star_border,
      size: 15,
      color: const Color(0xFFF2B233),
    );
  }
}
