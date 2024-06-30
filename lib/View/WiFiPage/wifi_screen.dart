import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';

class WiFiScreen extends StatefulWidget {
  @override
  _WiFiScreenState createState() => _WiFiScreenState();
}

class _WiFiScreenState extends State<WiFiScreen> {
  List<WifiNetwork?>? _wifiNetworks;

  @override
  void initState() {
    super.initState();
    _loadWifiNetworks();
  }

  Future<void> _loadWifiNetworks() async {
    var networks = await WiFiForIoTPlugin.loadWifiList();
    setState(() {
      _wifiNetworks = networks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WiFi Networks"),
      ),
      body: _wifiNetworks == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _wifiNetworks?.length,
              itemBuilder: (context, index) {
                var network = _wifiNetworks![index];
                return ListTile(
                  title: Text(network?.ssid ?? "Unknown"),
                );
              },
            ),
    );
  }
}
