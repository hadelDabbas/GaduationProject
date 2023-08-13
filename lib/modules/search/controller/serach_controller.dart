import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/sheard/auth_service.dart';

class SearchPageContrller extends GetxController {
  final _dio = Get.find<Dio>();
  final listSearch = <GetSearch>[].obs;

  final typeSearch = [
    'All',
    'User',
    'Groups',
    'Content',
    'Library',
    'Complaint',
    'Referance',
    'Book',
    'Writer'
  ].obs;
  final selectType = 'All'.obs;
  Future<void> searchBy(String text) async {
    if (text.isEmpty) return;
    listSearch.clear();

    switch (selectType.value) {
      case 'All':
        await searchAll(text);
        break;
      case 'User':
        await searchUser(text);
        break;
      case 'Groups':
        await searchgroup(text);
        break;
      case 'Content':
        await searchcontent(text);
        break;

      case 'Library':
        await searchLib(text);
        break;
      case 'Complaint':
        await searchComp(text);
        break;
      case 'Referance':
        await searchRef(text);
        break;
      case 'Book':
        await searchBook(text);
        break;
      case 'Writer':
        await searchwriter(text);
        break;
      default:
    }
  }

  Future<void> searchAll(String text) async {
    final id = Get.find<AuthService>().getDataFromStorage()!.Id;
    var result = await _dio.get(
      'https://localhost:7252/api/Search/Search?search=$text&IdUser=$id',
    );
    var list = <GetSearch>[];
    for (var element in result.data) {
      for (var element1 in element['search']) {
        list.add(GetSearch(element1['id'], element1[getName(element['type'])],
            element1[gettitle(element['type'])], element['type']));
      }
    }
    listSearch.assignAll(list);
  }

  Future<void> searchUser(String text) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchUsers?search=$text',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type']));
    }

    listSearch.assignAll(list);
  }

  Future<void> searchgroup(String text) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchGroups?search=$text',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type']));
    }
    listSearch.assignAll(list);
  }

  Future<void> searchcontent(String text) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchContent?search=$text',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type']));
    }
    listSearch.assignAll(list);
  }

  Future<void> searchLib(String text) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchLibrary?search=$text',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type']));
    }
    listSearch.assignAll(list);
  }

  Future<void> searchComp(String text) async {
    final id = Get.find<AuthService>().getDataFromStorage();
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchComplaint?search=$text&IdUser=$id',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type']));
    }
    listSearch.assignAll(list);
  }

  Future<void> searchRef(String text) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchReferance?search=$text',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type']));
    }
    listSearch.assignAll(list);
  }

  Future<void> searchBook(String text) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchBook?search=$text',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type']));
    }
    listSearch.assignAll(list);
  }

  Future<void> searchwriter(String text) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchWriter?search=$text',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type']));
    }
    listSearch.assignAll(list);
  }

  String getName(String type) {
    switch (type) {
      case 'user':
        return 'name';
      case 'group':
        return 'groupName';
      case 'refreance':
        return 'referenceName';
      case 'library':
        return 'libraryName';
    }
    return '';
  }

  String gettitle(String type) {
    switch (type) {
      case 'user':
        return 'email';
      case 'group':
        return 'description';
      case 'refreance':
        return 'link';
      case 'library':
        return 'libraryAddress';
    }
    return '';
  }
}

class GetSearch {
  int? id;
  String? name;
  String? title;
  String? type;
  GetSearch(this.id, this.name, this.title, this.type);
}
