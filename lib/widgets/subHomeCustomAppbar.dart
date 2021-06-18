import 'package:flutter/material.dart';

class CatalogAppBarW extends StatelessWidget {
  // const CatalogAppBarW({
  //    Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(width: 15,),
          Text( "Catalog",
                style: TextStyle(
                color: Color(0xff2e7ff6),
                fontSize: 22,
                fontWeight: FontWeight.w700,
              )),
          Expanded(child: SizedBox()),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Color(0xff2e7ff6),
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
