import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Cardswid extends Card {
  String imagestr = " ";
  String titlestr = " ";
  Cardswid(this.imagestr, this.titlestr);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
          children: [
           SizedBox(
             height: 250,
             width: MediaQuery.of(context).size.width - 20,
             child: Card(
                   elevation: 5,
                    semanticContainer: true,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child:
                ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imagestr,
                    placeholder: (context, url) => Container(
                      width: 254.44,
                      height: 180.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Color(0xffbebec4),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error),
                  ),
                  //   Image.network(
                //   imagestr,
                //   height: 290,
                //   width: MediaQuery.of(context).size.width,
                // fit: BoxFit.fitHeight,
                // ),),
          //          margin: EdgeInsets.all(1),
                ),    ),
          ),
          Positioned(
             bottom: 20,
              left: 25,
            child: Text(
                titlestr,
                style: TextStyle(fontSize: 25,
                color: Colors.white),
              )),
          
        ])
        );

  }
}
