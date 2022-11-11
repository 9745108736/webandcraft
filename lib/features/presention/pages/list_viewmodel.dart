import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../core/data/data_manager.dart';
import '../../../core/data/data_manager_impl.dart';
import '../models/list_model.dart';

class ListViewModel extends BaseViewModel {
  DataManager dataManager = DataManagerImpl();
  late List<TempResponseModel> tempResponseModelList;
  bool isLoading = true;
  TextEditingController searchTf = TextEditingController();

  getList() async {
    var response = await dataManager.getList(
      url: "5d565297300000680030a986",
    );
    var _listRes = json.decode(response.body);

    if (response.body != null) {
      tempResponseModelList = <TempResponseModel>[];
      _listRes.forEach((v) {
        tempResponseModelList.add(TempResponseModel.fromJson(v));
      });
    }
    isLoading = false;
    return tempResponseModelList;
  }
}
