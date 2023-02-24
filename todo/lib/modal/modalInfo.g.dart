// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modalInfo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModalInfoAdapter extends TypeAdapter<ModalInfo> {
  @override
  final int typeId = 1;

  @override
  ModalInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModalInfo(
      titleText: fields[0] as String,
      content: fields[1] as String,
      datetimeInfo: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ModalInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.titleText)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.datetimeInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModalInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
