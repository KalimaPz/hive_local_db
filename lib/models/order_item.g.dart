// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderItemAdapter extends TypeAdapter<OrderItem> {
  @override
  final int typeId = 1;

  @override
  OrderItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderItem(
      orderPartnerId: fields[0] as String,
      orderRiderId: fields[1] as String,
      orderDateTime: fields[2] as String,
      orderType: fields[3] as String,
      orderLines: (fields[4] as List).cast<OrderLines>(),
    );
  }

  @override
  void write(BinaryWriter writer, OrderItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.orderPartnerId)
      ..writeByte(1)
      ..write(obj.orderRiderId)
      ..writeByte(2)
      ..write(obj.orderDateTime)
      ..writeByte(3)
      ..write(obj.orderType)
      ..writeByte(4)
      ..write(obj.orderLines);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderLinesAdapter extends TypeAdapter<OrderLines> {
  @override
  final int typeId = 2;

  @override
  OrderLines read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderLines(
      productWeight: fields[0] as int,
      productTotalWeight: fields[1] as int,
      productQuantity: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, OrderLines obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.productWeight)
      ..writeByte(1)
      ..write(obj.productTotalWeight)
      ..writeByte(2)
      ..write(obj.productQuantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderLinesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
