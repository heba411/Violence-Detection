import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_space/cubit/cubit.dart';
import 'package:safe_space/modules/signup/signup_screen.dart';
import '../../cubit/states.dart';
import '../layout/layout_screen.dart';

class sosScreen extends StatelessWidget
{
  Future<Map<String, dynamic>> fetchEmergencyNumbers(String countryname) async {
    final response = await http.get(Uri.parse('https://emergencynumberapi.com/api/data/all'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      for (var entry in data) {
        if (entry['Country']['Name'] == countryname)
        {
          return
            {
            'Ambulance': entry['Ambulance']['All'][0],
            'Fire': entry['Fire']['All'][0],
            'Police': entry['Police']['All'][0],
          };
        }
      }
      return {};
    } else
    {
      throw Exception('Failed to load emergency numbers');
    }
  }
  Future<Map<String, dynamic>> get_sos(BuildContext context) async
  {
    final country = CountrySingleton().country;
    Map<String, dynamic> emergencyNumbers = await fetchEmergencyNumbers(country!);
    print("Emergency Numbers: $emergencyNumbers");
    print(emergencyNumbers['Police']);
    return emergencyNumbers;
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            'Emergency Numbers',
            style: TextStyle(
                color: Color(0xFF028BA1),
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF028BA1),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => layoutScreen(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: get_sos(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF028BA1),
                  ),
                  width: double.infinity,
                  height: 1,
                ),
                Center(child: CircularProgressIndicator()),
              ],
            );
          }
          else if (snapshot.hasError) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF028BA1),
                  ),
                  width: double.infinity,
                  height: 1,
                ),
                Center(child: Text('Error: ${snapshot.error}')),
              ],
            );
          }
          else if (snapshot.hasData) {
            final emergencyNumbers = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF028BA1),
                  ),
                  width: double.infinity,
                  height: 1,
                ),
                SizedBox(height: 100,),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF028BA1),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    height: 80,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Icon(
                          Icons.local_police_outlined,
                          color: Colors.white,
                          size: 60,
                        ),
                        SizedBox(width: 100,),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Police',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                emergencyNumbers['Police'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 80,),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF028BA1),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    height: 80,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Icon(
                          Icons.medical_services_outlined,
                          color: Colors.white,
                          size: 60,
                        ),
                        SizedBox(width: 75,),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Ambulance',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                emergencyNumbers['Ambulance'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 80,),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF028BA1),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    height: 80,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Icon(
                          Icons.fire_truck,
                          color: Colors.white,
                          size: 60,
                        ),
                        SizedBox(width: 115,),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Fire',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                emergencyNumbers['Fire'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text('No emergency numbers available'));
          }
        },
      ),
    );
  }
}