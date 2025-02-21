import 'dart:developer';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AllSectionController extends GetxController {
  var thirdSectionData = <Map<String, dynamic>>[].obs;
  var fourthSectionData = <Map<String, dynamic>>[].obs;
  var skillsSectionData = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    await Future.wait([
      fetchThirdSectionData(),
      fetchFourthSectionData(),
      fetchSkillsData(),
    ]);
  }

  Future<void> fetchThirdSectionData() async {
    isLoading.value = true;
    try {
      final response =
          await Supabase.instance.client.from('third_section_data').select();
      if (response.isEmpty) {
        throw Exception('No data found');
      }
      thirdSectionData.value = List<Map<String, dynamic>>.from(response);
      log("Formatted third Section data: ${thirdSectionData.value}");
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
      final response =
          await Supabase.instance.client.from('fourth_section_data').select();
      if (response.isEmpty) {
        throw Exception('No data found');
      }
      fourthSectionData.value = List<Map<String, dynamic>>.from(response);
      log("Formatted fourth Section data: ${fourthSectionData.value}");
    } catch (e) {
      log("Error fetching data: $e");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchSkillsData() async {
    isLoading.value = true;
    try {
      final response =
          await Supabase.instance.client.from('skills_section').select();
      if (response.isEmpty) {
        log("No data found in skills section");
        throw Exception('No data found in skills section');
      }
      skillsSectionData.value = List<Map<String, dynamic>>.from(response);
      log("Formatted skills data: ${skillsSectionData.value}");
    } catch (e) {
      log("Error fetching data in skills section: $e");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
