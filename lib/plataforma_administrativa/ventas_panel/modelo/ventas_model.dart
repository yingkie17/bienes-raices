class VentaModel {
  String idVenta;
  String tipoVenta;
  int cantidadVenta;

  VentaModel({
    required this.tipoVenta,
    required this.cantidadVenta,
    required this.idVenta,
  });

  factory VentaModel.fromMap(Map<String, dynamic> obj) => VentaModel(
        idVenta: obj['idVenta'],
        tipoVenta: obj['tipoVenta'],
        cantidadVenta: obj['cantidadVenta'],
      );
}
