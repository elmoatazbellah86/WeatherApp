import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weather_cubits/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubits/weather_state.dart';
//import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
//import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widget/succes_body_widget.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

class HomePage extends StatelessWidget {
  // void updateUi() {
  //   setState(() {});
  // }

  WeatherModel? weatherData;

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage(
                      //updateUi: updateUi
                    );
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('Weather App'),
        //backgroundColor: ThemeData,
      ),
      body:
      //  Provider.of<WeatherProvider>(context).weatherData == null
      BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoding) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherSucces) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weathermodel;
            return SuccesBody(weatherData: state.weatherModel); //weatherData
          } else if (state is WeatherFailure) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('oops no weather 😔😔 ', style: TextStyle(fontSize: 30)),
                  Text('searching now 🔍', style: TextStyle(fontSize: 30)),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather☀️🌧️❄️🌤️  start',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('searching now 🔍', style: TextStyle(fontSize: 20)),
                ],
              ),
            );
          }
        },
      ),

      // true  ? Center: container
    );
  }
}
