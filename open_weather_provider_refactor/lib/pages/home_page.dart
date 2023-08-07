import 'package:flutter/material.dart';
import 'package:open_weather_provider/constants/constants.dart';
import 'package:open_weather_provider/pages/settings_page.dart';
import 'package:open_weather_provider/widgets/error_dialog.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';
import '../providers/providers.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;
  late final WeatherProvider _weatherProv;
  late final void Function() _removeListener;

  @override
  void initState() {
    super.initState();
    _weatherProv = context.read<WeatherProvider>();
    _removeListener = _weatherProv.addListener(_registerListener);
  }

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  void _registerListener(WeatherState weatherState) {
    if (weatherState.status == WeatherStatus.error) {
      errorDialog(
        context,
        weatherState.error.errMsg,
      );
    }
  }

  String showTemperature(double temperature) {
    final tempUnit = context.watch<TempSettingsState>().tempUnit;

    if (tempUnit == TempUnit.fahrenheit) {
      return '${((temperature * 9 / 5) + 32).toStringAsFixed(2)}℉';
    }

    return '${temperature.toStringAsFixed(2)}℃';
  }

  Widget showIcon(String icon) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/loading.gif',
      image: 'https://$kIconHost/img/wn/$icon@4x.png',
      width: 97,
      height: 97,
    );
  }

  Widget formatText(String description) {
    final formattedString = description.titleCase;
    return Text(
      formattedString,
      style: const TextStyle(fontSize: 24),
      textAlign: TextAlign.center,
    );
  }

  Widget _showWeather() {
    final state = context.watch<WeatherState>();

    if (state.status == WeatherStatus.initial) {
      return const Center(
        child: Text(
          'Search for a city',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );
    }

    if (state.status == WeatherStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state.status == WeatherStatus.error && state.weather.name == '') {
      return const Center(
        child: Text(
          'Search for a city',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );
    }

    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 6,
        ),
        Text(
          state.weather.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              TimeOfDay.fromDateTime(
                state.weather.lastUpdate,
              ).format(context),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '(${state.weather.country})',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              showTemperature(state.weather.temp),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(
                  showTemperature(state.weather.tempMax),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  showTemperature(state.weather.tempMin),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            showIcon(state.weather.icon),
            Expanded(
              flex: 3,
              child: formatText(state.weather.description),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Weather'),
        actions: [
          IconButton(
            onPressed: () async {
              _city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchPage();
                  },
                ),
              );

              if (_city != null) {
                context.read<WeatherProvider>().loadWeather(
                      _city!,
                    );
              }
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const SettingsPage();
                  }),
                );
              },
              icon: const Icon(
                Icons.settings,
              ))
        ],
      ),
      body: _showWeather(),
    );
  }
}
