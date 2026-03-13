import 'package:xml/xml.dart';
import 'package:yorgan_yastik/models/product_model.dart';

Product parseProduct(XmlElement item) {
  String getText(String tag) => item.getElement(tag)?.innerText.trim() ?? '';

  return Product(
    title: getText('post_title'),
    attributeName: getText('product_attribute_name1'),
    attributeValues: getText('product_attribute_value1').split(','),
    imageUrl: getText('featured_image'),
    stockStatus: getText('stock_status'),
    price: double.tryParse(getText('price')) ?? 0.0,
    taxStatus: int.tryParse(getText('tax_status')) ?? 0,
    productCategory: getText('product_category'),
  );
}
