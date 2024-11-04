import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelectedItemsRecord extends FirestoreRecord {
  SelectedItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  bool hasProduct() => _product != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "subTotal" field.
  double? _subTotal;
  double get subTotal => _subTotal ?? 0.0;
  bool hasSubTotal() => _subTotal != null;

  // "cart" field.
  DocumentReference? _cart;
  DocumentReference? get cart => _cart;
  bool hasCart() => _cart != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  void _initializeFields() {
    _product = snapshotData['product'] as DocumentReference?;
    _nombre = snapshotData['nombre'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _subTotal = castToType<double>(snapshotData['subTotal']);
    _cart = snapshotData['cart'] as DocumentReference?;
    _creator = snapshotData['creator'] as DocumentReference?;
    _cantidad = castToType<int>(snapshotData['cantidad']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('selectedItems');

  static Stream<SelectedItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SelectedItemsRecord.fromSnapshot(s));

  static Future<SelectedItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SelectedItemsRecord.fromSnapshot(s));

  static SelectedItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SelectedItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SelectedItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SelectedItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SelectedItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SelectedItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSelectedItemsRecordData({
  DocumentReference? product,
  String? nombre,
  String? description,
  String? image,
  double? price,
  double? subTotal,
  DocumentReference? cart,
  DocumentReference? creator,
  int? cantidad,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product': product,
      'nombre': nombre,
      'description': description,
      'image': image,
      'price': price,
      'subTotal': subTotal,
      'cart': cart,
      'creator': creator,
      'cantidad': cantidad,
    }.withoutNulls,
  );

  return firestoreData;
}

class SelectedItemsRecordDocumentEquality
    implements Equality<SelectedItemsRecord> {
  const SelectedItemsRecordDocumentEquality();

  @override
  bool equals(SelectedItemsRecord? e1, SelectedItemsRecord? e2) {
    return e1?.product == e2?.product &&
        e1?.nombre == e2?.nombre &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.price == e2?.price &&
        e1?.subTotal == e2?.subTotal &&
        e1?.cart == e2?.cart &&
        e1?.creator == e2?.creator &&
        e1?.cantidad == e2?.cantidad;
  }

  @override
  int hash(SelectedItemsRecord? e) => const ListEquality().hash([
        e?.product,
        e?.nombre,
        e?.description,
        e?.image,
        e?.price,
        e?.subTotal,
        e?.cart,
        e?.creator,
        e?.cantidad
      ]);

  @override
  bool isValidKey(Object? o) => o is SelectedItemsRecord;
}
