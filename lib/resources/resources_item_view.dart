import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/resources/nepal_resources_model.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcesItemView extends StatelessWidget {
  final Resources data;
  const ResourcesItemView({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: WHITE,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Text(
                'Type - ${data.resourceType}',
                style: TextStyle(
                  color: STEXT,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Text(
                data.description ?? '',
                style: TextStyle(
                  color: STEXT,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              SizedBox(
                height: 28,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: SizedBox()),
                    FlatButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text('Open Map',
                          style: TextStyle(
                            color: WHITE,
                            fontWeight: FontWeight.w600,
                          ),),
                      onPressed: () {
                        launch(
                          'https://www.google.com/maps/search/?api=1&query=${data.point.coordinates[0]},${data.point.coordinates[1]}',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
