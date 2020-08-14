import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';
import 'package:nepal_covid_19_tracker/utils/date_time_parser.dart';

import 'faq_model.dart';

class FAQItemView extends StatelessWidget {
  final Data data;
  const FAQItemView({Key key, this.data}) : super(key: key);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Q. ${data.questionNp}',
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
              'Ans. ${data.answerNp}',
              style: TextStyle(
                color: STEXT,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
