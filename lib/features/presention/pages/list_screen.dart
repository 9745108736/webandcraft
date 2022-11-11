import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/utils/colors.dart';
import '../../../widgets/text_widget.dart';
import '../models/list_model.dart';
import 'list_viewmodel.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGoodPurple,
        title:
            DemoRobotoTextWidget(text: "Welcome user", fontColor: kGoodMidGray),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ViewModelBuilder<ListViewModel>.reactive(
        onModelReady: (model) async {
          debugPrint("model.isloaidng - ${model.isLoading}");
          await model.getList();
          debugPrint(model.tempResponseModelList.length.toString());
          debugPrint("model.isloaidng - ${model.isLoading}");
          setState(() {});
        },
        viewModelBuilder: () => ListViewModel(),
        builder: (context, model, child) {
          return model.isLoading == true
              ? const CircularProgressIndicator()
              : Column(
                  children: [
                    TextField(
                        onChanged: (value) {
                          debugPrint("value - $value");


                            model.tempResponseModelList.forEach((item) {
                              if (item.name!.contains(value)) {
                                model.tempResponseModelList.clear();
                                model.tempResponseModelList.add(item);
                                setState(() {});
                              }
                            });

                        },
                        decoration: const InputDecoration(
                          hintText: "Search Data",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                          ),
                        )),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return _itemCard(
                              tempResponseModel:
                                  model.tempResponseModelList[index]);
                        },
                        itemCount: model.tempResponseModelList.length,
                      ),
                    ),
                  ],
                );
        });
  }

  Widget _itemCard({TempResponseModel? tempResponseModel}) {
    return ListTile(
      leading: CircleAvatar(
        radius: 35,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: tempResponseModel?.profileImage ?? "",
            fit: BoxFit.cover,
            width: 80,
            height: 70,
          ),
        ),
      ),
      // leading: Image.network(""),
      title: DemoRobotoMonoTextWidget(text: tempResponseModel?.name ?? ""),
      subtitle:
          DemoRobotoTextWidget(text: tempResponseModel?.company?.name ?? ""),
    );
  }
}
