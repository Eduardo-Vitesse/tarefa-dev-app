// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PeriodAdapter extends TypeAdapter<Period> {
  @override
  final int typeId = 1;

  @override
  Period read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Period(
      name: fields[0] as String,
      start: fields[1] as String,
      finished: fields[2] as String,
      category: fields[3] as String,
      goalOne: fields[4] as String,
      goalTwo: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Period obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.start)
      ..writeByte(2)
      ..write(obj.finished)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.goalOne)
      ..writeByte(5)
      ..write(obj.goalTwo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeriodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
