import 'package:flutter/material.dart';
import 'package:store_demo/widgets/subHomeCustomAppbar.dart';


class SubHomeCatalog extends StatefulWidget {
  const SubHomeCatalog({ Key  key}) : super(key: key);

  @override
  _SubHomeCatalogState createState() => _SubHomeCatalogState();
}

class _SubHomeCatalogState extends State<SubHomeCatalog> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Column(
        children: [
          CatalogAppBarW(),
        ],
      ),

    );
  }
}
