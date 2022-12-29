// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:uuid/uuid.dart';

class BloodPressureEntry extends Equatable {
  final double systolicBP;
  final double diastolicBP;
  final String patientID;
  final DateTime dateTaken;
  final BloodPressureType bloodPressureType;

  const BloodPressureEntry({
    required this.systolicBP,
    required this.diastolicBP,
    required this.patientID,
    required this.dateTaken,
    required this.bloodPressureType,
  });

  BloodPressureEntry copyWith({
    double? systolicBP,
    double? diastolicBP,
    String? patientID,
    DateTime? dateTaken,
    BloodPressureType? bloodPressureType,
  }) {
    return BloodPressureEntry(
      systolicBP: systolicBP ?? this.systolicBP,
      diastolicBP: diastolicBP ?? this.diastolicBP,
      patientID: patientID ?? this.patientID,
      dateTaken: dateTaken ?? this.dateTaken,
      bloodPressureType: bloodPressureType ?? this.bloodPressureType,
    );
  }

  void updateBloodPressureType(BloodPressureType? bloodPressureType) => copyWith(bloodPressureType: bloodPressureType);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'systolicBP': systolicBP,
      'diastolicBP': diastolicBP,
      'patientID': patientID,
      'dateTaken': dateTaken.millisecondsSinceEpoch,
      'bloodPressureType': BloodPressureType.values.indexOf(bloodPressureType),
    };
  }

  factory BloodPressureEntry.fromMap(Map<String, dynamic> map) {
    return BloodPressureEntry(
      systolicBP: map['systolicBP'].toDouble(),
      diastolicBP: map['diastolicBP'].toDouble(),
      patientID: map['patientID'] as String,
      dateTaken: DateTime.fromMillisecondsSinceEpoch(map['dateTaken']),
      bloodPressureType: BloodPressureType.values[map['bloodPressureType'] ?? 0],
    );
  }

  String toJson() => json.encode(toMap());

  factory BloodPressureEntry.fromJson(String source) => BloodPressureEntry.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<BloodPressureEntry> fromListJson(String source) {
    final List result = json.decode(source) as List;
    return result.map((e) => BloodPressureEntry.fromJson(e)).toList();
  }

  static String toListJson(List<BloodPressureEntry> listOfBPEs) {
    return json.encode(listOfBPEs.map((e) => e.toJson()).toList());
  }

  @override
  String toString() {
    return 'BloodPressureEntry(systolicBP: $systolicBP, diastolicBP: $diastolicBP, patientID: $patientID, dateTaken: $dateTaken)';
  }

  @override
  List<Object> get props {
    return [
      systolicBP,
      diastolicBP,
      patientID,
      dateTaken,
      bloodPressureType,
    ];
  }
}

enum BloodPressureType {
  dangerouslyLow,
  low,
  normal,
  high,
  dangerouslyHigh,
  urgency,
  emergency,
}

final bloodPressuresRM = RM.inject<List<BloodPressureEntry>>(
  () => [],
  persist: () => PersistState(
    key: "blood pressure entries",
    fromJson: (source) => BloodPressureEntry.fromListJson(source),
    toJson: (state) => BloodPressureEntry.toListJson(state),
  ),
);

final systolicBPRM = RM.inject(() => 120.0);
final diastolicBPRM = RM.inject(() => 80.0);
final patientIDRM = RM.inject(() => Uuid().v1());
final dateTakenRM = RM.inject(() => DateTime.now());
final bloodPressureTypeRM = RM.inject(() => BloodPressureType.normal);
