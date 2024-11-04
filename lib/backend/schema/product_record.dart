import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductRecord extends FirestoreRecord {
  ProductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "imageProduct" field.
  String? _imageProduct;
  String get imageProduct => _imageProduct ?? '';
  bool hasImageProduct() => _imageProduct != null;

  // "precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  bool hasPrecio() => _precio != null;

  // "stockInicial" field.
  int? _stockInicial;
  int get stockInicial => _stockInicial ?? 0;
  bool hasStockInicial() => _stockInicial != null;

  // "stockFinal" field.
  int? _stockFinal;
  int get stockFinal => _stockFinal ?? 0;
  bool hasStockFinal() => _stockFinal != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _imageProduct = snapshotData['imageProduct'] as String?;
    _precio = castToType<double>(snapshotData['precio']);
    _stockInicial = castToType<int>(snapshotData['stockInicial']);
    _stockFinal = castToType<int>(snapshotData['stockFinal']);
    _descripcion = snapshotData['Descripcion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductRecord.fromSnapshot(s));

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductRecord.fromSnapshot(s));

  static ProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductRecordData({
  String? nombre,
  String? imageProduct,
  double? precio,
  int? stockInicial,
  int? stockFinal,
  String? descripcion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'imageProduct': imageProduct,
      'precio': precio,
      'stockInicial': stockInicial,
      'stockFinal': stockFinal,
      'Descripcion': descripcion,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductRecordDocumentEquality implements Equality<ProductRecord> {
  const ProductRecordDocumentEquality();

  @override
  bool equals(ProductRecord? e1, ProductRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.imageProduct == e2?.imageProduct &&
        e1?.precio == e2?.precio &&
        e1?.stockInicial == e2?.stockInicial &&
        e1?.stockFinal == e2?.stockFinal &&
        e1?.descripcion == e2?.descripcion;
  }

  @override
  int hash(ProductRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.imageProduct,
        e?.precio,
        e?.stockInicial,
        e?.stockFinal,
        e?.descripcion
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductRecord;
}
