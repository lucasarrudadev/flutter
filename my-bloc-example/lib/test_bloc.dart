import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shit_mode.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum events {
  getShit,
}

enum states {
  loading,
  loaded,
}

class TestBloc extends Bloc<events, List<ShitModel>> {
  @override
  List<ShitModel> get initialState => [ShitModel('loading', -1)];

  @override
  Stream<List<ShitModel>> mapEventToState(events event) async* {
    switch (event) {
      case events.getShit:
        yield [ShitModel('loading', -1)];
        List<ShitModel> shitModelList = [];
        try {
          await Future.delayed(Duration(seconds: 5));
          http.Response response = await http
              .get('http://localhost:8000/api/groupRequests', headers: {
            'Authorization':
                'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzUxYjQ0MmI4MmMwMDdhOTJhNmUzNjk5YzJiNDIzNDM0ZmYzODFlMDVmMmU5Y2VlMjgxYjk0OTdjYzgwYzZkNDE0OTYyOWUyYjE1MTIwOWMiLCJpYXQiOjE1ODg0ODQwNDUsIm5iZiI6MTU4ODQ4NDA0NSwiZXhwIjoxNjA0MzgxNjQ0LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.qx_allI23tWJNROvYBo1dAcoL8sYSMsP6rpY5Tw0fZvBuw5ALM0NL7MvkcfuH4XyOsTlbXecxrpKlZ4pgybsECneEEjiU5wOoXobc4UDroBtIClRacKLzyHfOYcaYe730ogThf53720qTWsta8G2XNgMPTPXoIru0v561fMPXnCMQnnM1JMrU3XI-umwETSJP3NVzhxQLGb5CMtBdi-KLJCIa_--oSeNBOPmMHmWUlhyeJqUo0BxxwJ9XUJUUuUfnGrcXpGks5Wiqz0maTQkCQ34qFcVR-QAqJsI-lp5fy1ysAG53qXZGFOY0kZE8NdwyNXg2hmDwvS6yalPZPNHsukCsHNIEY3xajC1zHgKYuBXxXvUM2K4C9GBmh1dc6ZdjbSZ9YtvmDPl6BlXzes9jblrWamkiGIS_hw5N1P-I1MTQJanFAG3t53IuyIM3vTV_Xg90vINJEx_XVg9_Opt0IpYHauYYwHV2oMSqN-8m7kk8fYZcQndiMt80nlyb-cb11TDmbJCl1rcsFWH1QzDilSIwU9nX9cYjuN8o0B_JeMI4TctyHdJ19YL3iINJI2piO88sqltDVL5E-J02f5x75kWsQFNf4Rmui2POKUWBsNRqGXm6DSHo53-dkMYg239E1rGjmKIX10X3qOmB4u90IEBgHeORXCZo48_6Gj7hio'
          });
          json.decode(response.body)['data'].forEach((shitModel) {
            shitModelList.add(ShitModel.fromJson(shitModel));
            print(shitModel['email']);
          });
        } catch (e) {}

        yield shitModelList;
        break;
    }
  }

//  void dispose() {
//    this.close();
//  }
}
