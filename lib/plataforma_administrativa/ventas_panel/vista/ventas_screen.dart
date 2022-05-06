import 'package:bienes_raices_app/imports/imports.dart';
import 'package:flutter/material.dart';

class VentasScreen extends StatefulWidget {
  @override
  State<VentasScreen> createState() => _VentasScreenState();
}

class _VentasScreenState extends State<VentasScreen> {
  List<VentaModel> ventas = [
    new VentaModel(idVenta: '0', tipoVenta: 'Venta', cantidadVenta: 5),
    new VentaModel(idVenta: '1', tipoVenta: 'Alquiler', cantidadVenta: 5),
    new VentaModel(idVenta: '2', tipoVenta: 'Anticrético', cantidadVenta: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Panel de Ventas',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView.builder(
          itemCount: ventas.length,
          itemBuilder: (BuildContext context, int index) {
            return _ventasTile(ventas[index]);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: addNewVentas,
        ));
  }

  Widget _ventasTile(VentaModel ventas) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('direction: $direction');
        print('direction: ${ventas.idVenta}');
        //Vamos a llamar un procedimiento para borrar
      },
      background: Container(
        padding: EdgeInsets.only(left: 5),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Eliminar Servicio',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      key: Key(ventas.idVenta),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            ventas.tipoVenta.substring(0, 2),
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(ventas.tipoVenta),
        trailing: Text(
          '${ventas.cantidadVenta}',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
              fontSize: 20),
        ),
      ),
    );
  }

// Vamos agregar el metodo para aggregar una nueva categoria de servicio de ventas
  addNewVentas() {
    final textCotnroller = new TextEditingController();
    if (Platform.isAndroid) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Agregar nuevo servicio:'),
              content: TextField(
                controller: textCotnroller,
              ),
              actions: [
                MaterialButton(
                  elevation: 5,
                  onPressed: () => addVentasToList(textCotnroller.text),
                  child: Text('Aregar'),
                  textColor: Colors.blueAccent,
                ),
                MaterialButton(
                  elevation: 5,
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancelar'),
                  textColor: Colors.blueAccent,
                ),
              ],
            );
          });
    }

    //Cupertino Ventana para Ios

    showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text('Agregar nuevo servicio:'),
            content: CupertinoTextField(
              controller: textCotnroller,
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Agregar'),
                onPressed: () => addVentasToList(textCotnroller.text),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text('Cancelar'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

//Si no Se llena ningun servicio en field se cierra

  void addVentasToList(String tipoServicios) {
    print(tipoServicios);
    if (tipoServicios.length > 1) {
      this.ventas.add(new VentaModel(
          idVenta: DateTime.now().toString(),
          tipoVenta: tipoServicios,
          cantidadVenta: 0));
      setState(() {});
    }

    Navigator.pop(context);
  }
}
