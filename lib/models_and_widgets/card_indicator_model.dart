import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';

returnIcon(String key) {
  switch (key) {
    case 'Engine':
      return Icons.drive_eta;
    case 'Door':
      return Icons.airport_shuttle;
    case 'Latitude':
      return Icons.add_location;
    case 'Longitude':
      return Icons.add_location;
    case 'MPU Pitch':
      return Icons.adjust;
    case 'MPU Roll':
      return Icons.adjust;
    case 'MPU Yaw':
      return Icons.adjust;
    case 'Temperature':
      return Icons.ac_unit;
    case 'Motion':
      return Icons.directions_run;
    case 'Towing':
      return Icons.build;
    case 'Alcohol':
      return Icons.format_color_reset;
  }
}

returnIndication(String key, String value) {
  IconData icon;
  switch (key) {
    case 'Engine':
      value == 'On'
          ? icon = FontAwesomeIcons.solidSmile
          : icon = FontAwesomeIcons.solidAngry;
      return icon;
    case 'Door':
      value == 'Closed'
          ? icon = FontAwesomeIcons.solidSmile
          : icon = FontAwesomeIcons.solidAngry;
      return icon;
    case 'Latitude':
      value == ''
          ? icon = FontAwesomeIcons.solidAngry
          : icon = FontAwesomeIcons.solidSmile;
      return icon;
    case 'Longitude':
      value == ''
          ? icon = FontAwesomeIcons.solidAngry
          : icon = FontAwesomeIcons.solidSmile;
      return icon;
    case 'MPU Pitch':
      double.parse(value) >= 30
          ? icon = FontAwesomeIcons.solidAngry
          : icon = FontAwesomeIcons.solidSmile;
      return icon;
    case 'MPU Roll':
      double.parse(value) >= 30
          ? icon = FontAwesomeIcons.solidAngry
          : icon = FontAwesomeIcons.solidSmile;
      return icon;
    case 'MPU Yaw':
      value == ''
          ? icon = FontAwesomeIcons.solidAngry
          : icon = FontAwesomeIcons.solidSmile;
      return icon;
    case 'Temperature':
      double.parse(value) >= 45
          ? icon = FontAwesomeIcons.solidAngry
          : icon = FontAwesomeIcons.solidSmile;
      return icon;
    case 'Motion':
      value == 'Yes'
          ? icon = FontAwesomeIcons.solidAngry
          : icon = FontAwesomeIcons.solidSmile;
      return icon;
    case 'Towing':
      value == 'Yes'
          ? icon = FontAwesomeIcons.solidAngry
          : icon = FontAwesomeIcons.solidSmile;
      return icon;
    case 'Alcohol':
      double.parse(value) >= 65
          ? icon = FontAwesomeIcons.solidAngry
          : icon = FontAwesomeIcons.solidSmile;
      return icon;
  }
}
