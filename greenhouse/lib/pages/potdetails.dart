import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:greenhouse/widgets/lamp.dart';
import 'package:greenhouse/widgets/plantinfo.dart';
import 'package:greenhouse/widgets/temp.dart';
import 'package:greenhouse/widgets/watering.dart';

class PotDetails extends StatefulWidget {
  const PotDetails({super.key});

  @override
  _PotDetailsState createState() => _PotDetailsState();
}

class _PotDetailsState extends State<PotDetails> {
  FlutterBluePlus flutterBlue = FlutterBluePlus();
  BluetoothDevice? device;
  BluetoothCharacteristic? characteristic;
  double _fanSpeed = 0;
  double _lampBrightness = 50.0;
  bool _watering = false;
  double _temperature = 22.0;

  @override
  void initState() {
    super.initState();
    startScan();
  }

  void startScan() async {
    FlutterBluePlus.startScan(timeout: Duration(seconds: 4));
    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult r in results) {
        if (r.device.name == "YourArduinoDeviceName") { // Change to your device name
          FlutterBluePlus.stopScan();
          connectToDevice(r.device);
          break;
        }
      }
    });
  }

  void connectToDevice(BluetoothDevice d) async {
    await d.connect();
    device = d;
    List<BluetoothService> services = await d.discoverServices();
    for (BluetoothService s in services) {
      for (BluetoothCharacteristic c in s.characteristics) {
        if (c.properties.write) {
          characteristic = c;
        }
        if (c.properties.notify) {
          c.setNotifyValue(true);
          c.value.listen((value) {
            setState(() {
              _temperature = double.parse(String.fromCharCodes(value)); // Receiving temperature data
            });
          });
        }
      }
    }
  }

  void sendCommand(String command, int value) async {
    if (characteristic != null) {
      await characteristic!.write(utf8.encode('$command$value\n'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pot1',
          style: TextStyle(color: Color(0xFFFFFFFF)), // Correct color for the text
        ),
        backgroundColor: const Color(0xFF011F31),
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.white, // Customize icon color
        ),
      ),
      body: Container(
        color: const Color(0xFF00273F), // Set the background color for the whole body
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Add some padding for better layout
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Controllers',
                  style: TextStyle(
                    color: Colors.white, // Light color for text
                    fontSize: 40,
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
                const SizedBox(height: 20), // Add spacing between sections
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Horizontal scroll for the Row
                  child: Row(
                    children: [
                      const plantinfo(), // Assuming you have a PlantInfo widget
                      const SizedBox(width: 16), // Spacing between widgets
                      Lamp(
                        onBrightnessChanged: (value) {
                          setState(() {
                            _lampBrightness = value;
                            sendCommand('L', value.toInt()); // Sending lamp brightness command
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20), // Add spacing between sections
                Temp(
                  temperature: _temperature,
                  onFanSpeedChanged: (value) {
                    setState(() {
                      _fanSpeed = value;
                      sendCommand('F', value.toInt()); // Sending fan speed command
                    });
                  },
                ),
                const SizedBox(height: 20), // Add spacing between sections
                Watering(
                  onWateringChanged: (value) {
                    setState(() {
                      _watering = value;
                      sendCommand('W', value ? 1 : 0); // Sending watering command
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
