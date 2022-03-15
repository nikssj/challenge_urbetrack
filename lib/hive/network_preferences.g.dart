// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_preferences.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetworkPreferencesAdapter extends TypeAdapter<NetworkPreferences> {
  @override
  final int typeId = 1;

  @override
  NetworkPreferences read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NetworkPreferences(
      fields[0] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, NetworkPreferences obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isOnline);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkPreferencesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
