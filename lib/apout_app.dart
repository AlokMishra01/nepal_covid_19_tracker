import 'package:flutter/material.dart';
import 'package:nepal_covid_19_tracker/utils/colors.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Material(
      color: WHITE,
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR.withOpacity(0.1),
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          elevation: 0,
          title: Text("About Application"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 16,
              ),
              Image.asset(
                'assets/images/covid.png',
                width: width / 3,
                height: width / 3,
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  'Nepal COVID-19 Tracker',
                  style: TextStyle(
                    color: PRIMARY_COLOR,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Center(
                child: Text(
                  'This is an android mobile application that provides the COVID-19 spread mainly in Nepal. '
                  'This gives also provides the symptoms of COVID-19 and gives how to take preventive measures. '
                  'This gives detailed information about the district and municipality level stats of COVID-19. '
                  'This also gives the latest news on COVID-19.\n'
                  'If you face any issue with this please comment on the play store and I will fix this as soon as possible.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: STEXT,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    'Developed By ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: STEXT,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Alok Mishra',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: PRIMARY_COLOR,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    'Contact ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: STEXT,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'alokmishradeveloper@outlook.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: PRIMARY_COLOR,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
