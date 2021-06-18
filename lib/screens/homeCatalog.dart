import 'package:flutter/material.dart';
import 'package:store_demo/Models/cards.dart';
import 'package:store_demo/widgets/homeCatalogAppbar.dart';
import 'package:http/http.dart' as http;
import 'package:store_demo/Config/apiConfig.dart';
import 'package:store_demo/Models/groupModel.dart';
import 'package:store_demo/Models/imageModel.dart';
import 'package:store_demo/Models/userModel.dart';
import 'dart:convert';

import 'package:store_demo/widgets/loading_Widget.dart';


class HomeCatalog extends StatefulWidget {
  @override
  _HomeCatalogState createState() => _HomeCatalogState();
}

class _HomeCatalogState extends State<HomeCatalog> {
  var sessionCode = "";
  String jwt = "";
  bool dataloaded = false;
  //Logger lg = Logger();
  UserModel userM;
  List<GroupModel> groupList = List();
  List<ImageModel> imageList = List();
  GroupModel selectedGroup;

  int selectedIndex = 0;


    void _onItemTapped(int index) {
    setState(() {
       selectedIndex = index;
    });
  }


  @override
  void initState() {
    callApi();
   // super.onInit();
  }



  Future<void> callApi() async {
      await verifyUser();
      await getProductGroups();
      await getImages();
      setState(() {
        dataloaded = true;
      });
    }


    Future<void> verifyUser() async {
      Map data = {
        'clientCode': apiConfig.CLIENTCODE,
        'username': apiConfig.USERNAME,
        'password': apiConfig.PASSWORD,
        'request': 'verifyUser',
        'sendContentType': '1'
      };

      try {
        var response = await http.post(apiConfig.BASE, body: data);
        var res = jsonDecode(response.body);

        sessionCode = res["records"][0]["sessionKey"];
        jwt = res["records"][0]["token"];

        userM = UserModel.fromJson(res["records"][0]);
        print(userM.toString());
        print("SessCode------------------------->>>>>>>>" + sessionCode);
        print("JWT------------------------->>>>>>>>" + jwt);
      } catch (e) {

      }
    }

    Future<void> getProductGroups() async {
      Map data = {
        'clientCode': apiConfig.CLIENTCODE,
        'username': apiConfig.USERNAME,
        'password': apiConfig.PASSWORD,
        'request': 'getProductGroups',
        'sendContentType': '1',
        'sessionKey': sessionCode
      };

      try {
        var response = await http.post(apiConfig.BASE, body: data);
        var res = jsonDecode(response.body);
        for (int i = 0; i < res['records'].length; i++) {
          groupList.add(GroupModel.fromJson(res['records'][i]));
        }
      } on Exception catch (e) {
      }
    }

    Future<void> getImages() async {
      Map<String, String> headers = {'JWT': jwt};
      try {
        var response =
        await http.get(apiConfig.CDN + "images?context=Cat", headers: headers);
        var res = jsonDecode(response.body);
        for (int i = 0; i < res["images"].length; i++) {
          imageList.add(ImageModel.fromJson(res["images"][i]));
        }

      } catch (e) {
      }
    }

    void onCategoryTap(int idx) {
      selectedGroup = groupList[idx];
      print("Selected Group===================>>>" +
          selectedGroup.name +
          "=====>" +
          selectedGroup.id);
      //TODO:
    }


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CustomAppBar(),
            Align(
              child: Text('Spring Summer',
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
              ),),
              alignment: Alignment.topLeft,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Divider(
                height: 1,
                thickness: 1,
              ),
            ),
            Container(
               height: MediaQuery.of(context).size.height * 0.79-100,
              // width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: ! dataloaded ?
                LoadingWidget()
              : Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: imageList.length,
                  itemBuilder: ( ctx , idx) {
                    return Cardswid(apiConfig.CDN +
                                  "images/" +
                                  imageList[idx].tenant +
                                  "/" +
                                  imageList[idx].key,
                        groupList[idx].name);
                  },
                ),
              ),

              // child: SingleChildScrollView(
              //    child: Column(children: [
              //      Cardswid(apiConfig.CDN +
              //          "images/" +
              //          imageList[idx].tenant +
              //          "/" +
              //          imageList[idx].key,'Men'),
              //         SizedBox(height: 10),
              //      Cardswid('assets/images/woman.jpg','Women'),
              //         SizedBox(height: 10),
              //      Cardswid('assets/images/child.jpg','Child'),
              //     ]
              //     )
              // ),
              //
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart,
                color: Colors.blueAccent),
            title: Text('Catalog'),
            backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,
                color:Colors.blueAccent),
            title: Text('Search'),
            backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,
              color: Colors.blueAccent,),
            title: Text('Settings'),
            backgroundColor: Colors.white,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 30,
        onTap: _onItemTapped,
        elevation: 2
      ),
    );
  }
}
