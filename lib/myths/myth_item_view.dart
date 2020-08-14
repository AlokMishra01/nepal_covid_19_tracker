import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:nepal_covid_19_tracker/utils/date_time_parser.dart';
import 'package:url_launcher/url_launcher.dart';

import 'nepali_myths_model.dart';

class MythItemView extends StatelessWidget {
  final Data data;
  const MythItemView({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launch(data.sourceUrl),
      child: Material(
        color: WHITE,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: data.imageUrl,
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                data.mythNp,
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                data.realityNp,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    timeDiffNow(data.updatedAt),
                    style: TextStyle(
                      color: PRIMARY_COLOR,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    ' - ${data.sourceName}',
                    style: TextStyle(
                      color: STEXT,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
