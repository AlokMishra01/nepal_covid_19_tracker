import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:nepal_covid_19_tracker/utils/date_time_parser.dart';
import 'package:url_launcher/url_launcher.dart';

import 'nepal_hospital_model.dart';

class HospitalItemView extends StatelessWidget {
  final Data data;
  const HospitalItemView({Key key, this.data}) : super(key: key);

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
                data.name,
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              CachedNetworkImage(
                imageUrl: data.imageUrl,
              ),
              SizedBox(
                height: data.notes != '' ? 2.0 : 0,
              ),
              data.notes != ''
                  ? Text(
                      'NOTE: ${data.notes}',
                      style: TextStyle(
                        color: STEXT,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: data.contactPerson == '' ? 0 : 2.0,
              ),
              data.contactPerson != ''
                  ? Text(
                      'CONTACT PERSON: ${data.contactPerson} (${data.contactPersonNumber})',
                      style: TextStyle(
                        color: STEXT,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: data.phone == '' ? 0 : 2.0,
              ),
              data.phone != ''
                  ? Text(
                      'PHONE: ${data.phone}',
                      style: TextStyle(
                        color: STEXT,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: data.address == '' ? 0 : 2.0,
              ),
              data.address != ''
                  ? Text(
                      'ADDRESS: ${data.address}',
                      style: TextStyle(
                        color: STEXT,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: data.website == '' ? 0 : 2.0,
              ),
              data.website != ''
                  ? Text(
                      'WEBSITE: ${data.website}',
                      style: TextStyle(
                        color: STEXT,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: data.email == '' ? 0 : 2.0,
              ),
              data.email != ''
                  ? Text(
                      'EMAIL: ${data.email}',
                      style: TextStyle(
                        color: STEXT,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: data.capacity.beds == '' ? 0 : 2.0,
              ),
              data.capacity.beds != ''
                  ? Text(
                      'Beds: ${ data.capacity.beds} ,'
                      'IsolationBeds: ${ data.capacity.isolationBeds} ,'
                      'OccupiedBeds: ${ data.capacity.occupiedBeds} ,'
                      'Ventilators: ${ data.capacity.ventilators} ,'
                      'Doctors: ${ data.capacity.doctors} ,'
                      'Nurses: ${ data.capacity.nurses}',
                      style: TextStyle(
                        color: STEXT,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: 2.0,
              ),
              Text(
                'GOVERMENT APPROVED: ${data.governmentApproved ? 'YES' : 'NO'}',
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
                    FlatButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text('Open Map',
                          style: TextStyle(
                            color: WHITE,
                            fontWeight: FontWeight.w600,
                          )),
                      onPressed: () {
                        launch(
                            'https://www.google.com/maps/search/?api=1&query=${data.location.coordinates[0]},${data.location.coordinates[1]}');
                      },
                    ),
                    FlatButton(
                      color: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text('Call Hospital',
                          style: TextStyle(
                            color: WHITE,
                            fontWeight: FontWeight.w600,
                          )),
                      onPressed: () {
                        launch("tel://${data.phone.split(',').first}");
                      },
                    ),
                    Column(
                      children: [
                        Text(
                          'Last Update',
                          style: TextStyle(
                            color: STEXT,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          timeDiffNow(data.updatedAt),
                          style: TextStyle(
                            color: PRIMARY_COLOR,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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
