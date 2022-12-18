import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/locutoras.dart';
import '../navigation/routes.dart';

const baseUrl = 'https://mujeresradio.tamarones.com/public/rest-locutora';

class StaggeredGridView extends StatefulWidget {
  const StaggeredGridView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StaggeredGridViewState createState() => _StaggeredGridViewState();
}

class _StaggeredGridViewState extends State<StaggeredGridView> {
  var uri = Uri.parse(baseUrl);
  List<Locutora> _locutoras = <Locutora>[];

  Future<List<Locutora>> getData() async {
    var response = await http.get(uri, headers: {"Accept": "application/json"});
    String body = utf8.decode(response.bodyBytes);
    var data = json.decode(body);
    var registros = <Locutora>[];
    for (data in data) {
      registros.add(Locutora.fromJson(data));
    }
    return registros;
  }

  @override
  void initState() {
    super.initState();
    // get data form API
    getData().then((value) {
      setState(() {
        _locutoras.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
        scrollDirection: Axis.vertical,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        itemCount: _locutoras.length,
        itemBuilder: (context, index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () => Get.toNamed(Routes.profile, arguments: {
                  'image': _locutoras[index].image,
                  'id': _locutoras[index].id,
                  'nameLocutora': _locutoras[index].nameLocutora,
                  'namePrograma': _locutoras[index].namePrograma
                }),
                //child: Image.asset("assets/images/Image0.jpg", fit: BoxFit.cover)
                //child: Image.network(_locutoras[index].image!, fit: BoxFit.cover)
                child: CachedNetworkImage(
                  imageUrl: _locutoras[index].image!,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  fit: BoxFit.cover,
                ),
              ));
        });
  }
}
