import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/category.dart';


class NetworkService {
  static const String baseUrl = 'https://coinoneglobal.in/crm/';
  static const String categoryUrl = 'https://coinoneglobal.in/teresa_trial/webtemplate.asmx/FnGetTemplateCategoryList?PrmCmpId=1&PrmBrId=2';
  static const String subCategoryUrl = 'https://coinoneglobal.in/teresa_trial/webtemplate.asmx/FnGetTemplateSubCategoryList?PrmCmpId=1&PrmBrId=2&PrmCategoryId=';

  Future<List<Product>> fetchCategories() async {
    final response = await http.get(Uri.parse(categoryUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Product>> fetchSubCategories(int categoryId) async {
    final response = await http.get(Uri.parse('$subCategoryUrl$categoryId'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load subcategories');
    }
  }
}
