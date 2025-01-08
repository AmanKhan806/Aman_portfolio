// ignore: file_names
import 'dart:developer';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AllSectionController extends GetxController {
  var thirdSectionData = <Map<String, dynamic>>[].obs;
  var fourthSectionData = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  Future<void> fetchThirdSectionData() async {
    isLoading.value = true;
    try {
      final response = await Supabase.instance.client
          .from('third_section_data')
          .select();
      if (response.isEmpty) {
        throw Exception('No data found');
      }
      thirdSectionData.value = List<Map<String, dynamic>>.from(response);
    } catch (e) {
      log("Error fetching data: $e");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchFourthSectionData() async {
    isLoading.value = true;
    try {
      final response = await Supabase.instance.client
          .from('fourth_section_data')
          .select();
      if (response.isEmpty) {
        throw Exception('No datajdjdisfi9sdound');
      }
      fourthSectionData.value = List<Map<String, dynamic>>.from(response);
    } catch (e) {
      log("Error fetching data: $e");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}



