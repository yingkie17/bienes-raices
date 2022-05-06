import 'package:flutter/material.dart';
import 'package:bienes_raices_app/imports/imports.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class ProductService extends ChangeNotifier {
  final String _baseUrl =
      'flutter-bienes-raices-a3e64-default-rtdb.firebaseio.com';
  //vamos a crear una lista de Productos y vamos a necesitar exportar del product_model
  final List<Propiedades> propiedades = [];
  late Propiedades selectedProduct;
  final storage = new FlutterSecureStorage();
  File? newPictureFile;
  bool isLoading = true;

  bool isSaving = false;
  // Vamos a crear una validación que nos ayude a saber cuando este cargando nuestro producto
  //bool isLoading = true;
  // si nuestro ProductServices sea utilizado por primera vez va llamar el constructor
  ProductService() {
    //El constructor va llamas el loadProducts que va hacer la peticion con un Future
    this.loadProducts();
  }
  Future<List<Propiedades>> loadProducts() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'bienes_racies/propiedad.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final resp = await http.get(url).timeout(Duration(seconds: 90));

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final temptPropiedad = Propiedades.fromMap(value);
      temptPropiedad.idpropiedad = key;
      this.propiedades.add(temptPropiedad);
    });

    this.isLoading = false;
    notifyListeners();
    return this.propiedades;
    print(this.propiedades[0].tipoPropiedad);
  }

  Future saveOrCreateProducts(Propiedades propiedad) async {
    isSaving = true;
    notifyListeners();

    if (propiedad.idpropiedad == null) {
      await this.createProduct(propiedad);
    } else {
      await this.updateProduct(propiedad);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Propiedades propiedad) async {
    final url = Uri.https(
        _baseUrl,
        'bienes_racies/propiedad/${propiedad.idpropiedad}.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final resp = await http.put(url, body: propiedad.toJson());
    final decodeData = resp.body;
    print(decodeData);
    //Actualizar el Listado de productos
    final index = this
        .propiedades
        .indexWhere((element) => element.idpropiedad == propiedad.idpropiedad);
    this.propiedades[index] = propiedad;
    return propiedad.idpropiedad!;
  }

  Future<String> createProduct(Propiedades propiedad) async {
    final url = Uri.https(_baseUrl, 'bienes_racies/propiedad.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final resp = await http.post(url, body: propiedad.toJson());
    final decodeData = json.decode(resp.body);

    propiedad.idpropiedad = decodeData['name'];
    //añadimos la propiedad
    this.propiedades.add(propiedad);

    return propiedad.idpropiedad!;
  }

  void updateSelectedProductImage(String path) {
    this.selectedProduct.foto1 = path;
    this.newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    // si el usuario no selecciono ninguan imagen vamos a necesitar control de null
    if (this.newPictureFile == null) return null;

    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/unandes-proyectogrado/image/upload?upload_preset=zbiyixdh');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);
    imageUploadRequest.files.add(file);

    final stramResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(stramResponse);
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Ocurrio un Error en la App');
      print(resp.body);
      return null;
    }

    this.newPictureFile = null;
    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];

    print(resp.body);
  }
}
  // Realizamos el fetc de nuestro modelo
// Cuando la Instacia de Product Services sea llamada vamos a tener que ocupar un

 