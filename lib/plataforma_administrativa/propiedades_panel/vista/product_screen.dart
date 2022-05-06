import 'package:bienes_raices_app/imports/imports.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectedProduct),
      child: _productScreenBody(productService: productService),
    );
  }
}

class _productScreenBody extends StatelessWidget {
  const _productScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductService productService;

  @override
  Widget build(BuildContext context) {
    final productFormProvider = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Stack(
                children: [
                  ProductImage(url: productService.selectedProduct.foto1),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: 40,
                          color: Colors.white,
                        )),
                  ),
                  Positioned(
                    top: 60,
                    right: 20,
                    child: IconButton(
                        onPressed: () async {
                          // aca vamos accder a la camara o galeria
                          final picker = ImagePicker();
                          final XFile? pikedFile = await picker.pickImage(
                              source: ImageSource.camera, imageQuality: 100);
                          if (pikedFile == null) {
                            print('no selecciono nada');
                            return;
                          }
                          print('Tenemos imagen ${pikedFile.path}');
                          productService
                              .updateSelectedProductImage(pikedFile.path);
                        },
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              //Carrousel de iamgenes
              _SwiperCarrousel(),
              SizedBox(
                height: 30,
              ),
              //End of Carrousel de iamgenes
              //Aca vamos a crear el Formulario
              _ProductForm(),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),

      // El Boton para guardar
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: productService.isSaving
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : Icon(Icons.save_outlined),
        onPressed: productService.isSaving
            ? null
            : () async {
                if (!productFormProvider.isValidForm()) return;

                final String? imageUrl = await productService.uploadImage();
                if (imageUrl != null)
                  productFormProvider.propiedad.foto1 = imageUrl;
                print(imageUrl);

                await productService
                    .saveOrCreateProducts(productFormProvider.propiedad);
              },
      ),
    );
  }
}

class _SwiperCarrousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productService = Provider.of<ProductService>(context);
    final List carouselItems = [
      productService.selectedProduct.foto1,
      productService.selectedProduct.foto2,
      productService.selectedProduct.foto3,
      productService.selectedProduct.foto4,
      productService.selectedProduct.foto5,
      productService.selectedProduct.foto6,
      productService.selectedProduct.foto7,
      productService.selectedProduct.foto8,
      productService.selectedProduct.foto9,
      productService.selectedProduct.foto10,
    ];
    return Container(
      width: double.infinity,
      height: size.height * 0.6,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.9,
        itemHeight: size.height * 0.9,
        itemCount: carouselItems.length,
        itemBuilder: (context, int index) {
          final carrouselItem = carouselItems[index];
          return Center(
            child: Stack(
              children: [
                SwipeImage(url: carrouselItem),
                Positioned(
                  top: 20,
                  right: 20,
                  child: IconButton(
                      onPressed: () async {
                        // aca vamos accder a la camara o galeria
                        final picker = ImagePicker();
                        final XFile? pikedFile = await picker.pickImage(
                            source: ImageSource.camera, imageQuality: 100);

                        if (pikedFile == null) {
                          print('no selecciono nada');
                          return;
                        }

                        print('Tenemos imagen ${pikedFile.path}');
                        productService
                            .updateSelectedProductImage(pikedFile.path);
                      },
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                        color: Colors.indigo,
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  String time = '?';
  @override
  Widget build(BuildContext context) {
    final productFormProvider = Provider.of<ProductFormProvider>(context);
    final propiedad = productFormProvider.propiedad;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _BuildBoxDecoration(),
        //Aca agrefamos el contenido de los fields
        child: Form(
            key: productFormProvider.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(height: 40),
                //Aca va los campos del Form
                Center(
                  child: Text(
                    'Datos de la Propiedad',
                    style: TextStyle(
                      color: AppColors.deepBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                //------------Producto Disponible----------------//
                SwitchListTile.adaptive(
                    value: propiedad.estadoPropiedad,
                    title: Text('Propiedad Disponible'),
                    activeColor: AppColors.blue,
                    onChanged: (value) =>
                        productFormProvider.updateEstadoPropiedad(value)),
                //------------Exclusividad---------------//
                SwitchListTile.adaptive(
                    value: propiedad.exclusividadPropiedad!,
                    title: Text('Servicio de Exclusividad'),
                    activeColor: AppColors.blue,
                    onChanged: (value) =>
                        productFormProvider.updateExclusividad(value)),

                SizedBox(height: 20),
//------------Tipo de Propiedad----------------//
                TextFormField(
                  initialValue: propiedad.tipoPropiedad,
                  onChanged: (value) => propiedad.tipoPropiedad = value,
                  validator: (value) {
                    if (value == null || value.length < 1)
                      return 'El tipo de propiedad es obligatorio';
                  },
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Ejemplo: Casa, Departamento, Garzonier',
                      labelText: 'Tipo de Propiedad',
                      prefixIcon: Icons.house_outlined),
                ),
                SizedBox(height: 20),
//------------Tipo de Propiedad----------------//
                TextFormField(
                  initialValue: propiedad.modalidadPropiedad,
                  onChanged: (value) => propiedad.modalidadPropiedad = value,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Venta, Alquiler, Anticretico',
                      labelText: 'Modalidad de Servicio',
                      prefixIcon: Icons.business_outlined),
                ),
                SizedBox(height: 20),

//------------Fecha de Registro----------------//

                TextFormField(
                  initialValue: propiedad.fechaPropiedad,
                  onChanged: (value) => propiedad.fechaPropiedad = value,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '17/11/2022',
                      labelText: 'Fecha de Registro',
                      prefixIcon: Icons.date_range_outlined),
                ),
                SizedBox(height: 20),
//------------Precio de Propiedad----------------//
                TextFormField(
                  initialValue: propiedad.precioPropiedad.toString(),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  onChanged: (value) {
                    if (double.tryParse(value) == null) {
                      propiedad.precioPropiedad = 0;
                    } else {
                      propiedad.precioPropiedad = double.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: ' Ejemplo \$ 150.000',
                      labelText: 'Precio en dolares',
                      prefixIcon: Icons.money_off_outlined),
                ),
                SizedBox(height: 20),
                //------------Comision  de Propiedad----------------//
                TextFormField(
                  initialValue: propiedad.comisionPropiedad.toString(),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  onChanged: (value) {
                    if (double.tryParse(value) == null) {
                      propiedad.comisionPropiedad = 0;
                    } else {
                      propiedad.comisionPropiedad = double.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: ' Ejemplo \$ 150',
                      labelText: 'Comision en dolares',
                      prefixIcon: Icons.verified_outlined),
                ),
                SizedBox(height: 20),
//------------Ciudad----------------//
                TextFormField(
                  initialValue: propiedad.ciudadPropiedad,
                  onChanged: (value) => propiedad.ciudadPropiedad = value,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'La Paz',
                      labelText: 'Ciudad',
                      prefixIcon: Icons.location_city),
                ),
                SizedBox(height: 20),
//------------Ubicación----------------//
                TextFormField(
                  initialValue: propiedad.ubicacionPropiedad,
                  onChanged: (value) => propiedad.ubicacionPropiedad = value,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Ejemplo: Av. 6 de Agosto',
                      labelText: 'Ubicacion de la Propiedad',
                      prefixIcon: Icons.room_outlined),
                ),
                SizedBox(height: 20),
//------------Cantidad de Habitaciones----------------//
                TextFormField(
                  initialValue:
                      propiedad.cantidadHabitacionesPropiedad.toString(),
                  onChanged: (value) =>
                      propiedad.cantidadHabitacionesPropiedad =
                          int.fromEnvironment(value),
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Cantidad de Habitaciones',
                      labelText: 'Cantidad de Habitaciones',
                      prefixIcon: Icons.real_estate_agent_rounded),
                ),
                SizedBox(height: 20),

//------------Cantidad de Baños---------------//
                TextFormField(
                  initialValue: propiedad.cantidadBanosPropiedad.toString(),
                  onChanged: (value) => propiedad.cantidadBanosPropiedad =
                      int.fromEnvironment(value),
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Cantidad de Baños',
                      labelText: 'Cantidad de Baños',
                      prefixIcon: Icons.real_estate_agent_rounded),
                ),
                SizedBox(height: 20),

//------------Restricciones----------------//
                TextFormField(
                  initialValue: propiedad.restriccionesPropiedad,
                  onChanged: (value) =>
                      propiedad.restriccionesPropiedad = value,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Restricciones',
                      labelText: 'Ejemplo: Prohibido mascotas',
                      prefixIcon: Icons.dangerous),
                ),
                SizedBox(height: 20),

//------------Descripcion----------------//
                TextFormField(
                  initialValue: propiedad.descripcionPropiedad,
                  onChanged: (value) => propiedad.descripcionPropiedad = value,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Descripcion Corta',
                      labelText: 'Descripcion',
                      prefixIcon: Icons.description),
                ),
                SizedBox(height: 20),
//==================Datos del Cliente Propietario==================//
                Center(
                  child: Text(
                    'Datos del Propietario',
                    style: TextStyle(
                      color: AppColors.deepBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),

                //------------Nombre Propietario----------------//
                TextFormField(
                  initialValue: propiedad.nombrePropietario,
                  onChanged: (value) => propiedad.nombrePropietario = value,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Ejemplo: Juan de Dios',
                      labelText: 'Nombre del Propietario',
                      prefixIcon: Icons.person_add_alt_1_outlined),
                ),
                SizedBox(height: 20),
                //------------Apellido Propietario----------------//
                TextFormField(
                  initialValue: propiedad.apellidosPropietario,
                  onChanged: (value) => propiedad.apellidosPropietario = value,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Ejemplo: Arce',
                      labelText: 'Apellidos de Propietario',
                      prefixIcon: Icons.person_add_alt_rounded),
                ),
                SizedBox(height: 20),
                //------------Fecha de Nacimiento----------------//
                TextFormField(
                  initialValue: propiedad.fechaPropietario,
                  onChanged: (value) => propiedad.fechaPropietario = value,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '20/04/2021',
                      labelText: 'Fecha de Naciemiento',
                      prefixIcon: Icons.data_saver_on_rounded),
                ),
                SizedBox(height: 20),
                //------------Residencia----------------//
                TextFormField(
                  initialValue: propiedad.residenciaPropietario,
                  onChanged: (value) => propiedad.residenciaPropietario = value,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'La Paz, Bolivia Sopocachi, Pedro Salazar #233',
                      labelText: 'Lugar de residencia',
                      prefixIcon: Icons.location_city),
                ),
                SizedBox(height: 20),
                //------------Descripcion----------------//
                TextFormField(
                  initialValue: propiedad.celularPropietario,
                  onChanged: (value) => propiedad.celularPropietario = value,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '70770010',
                      labelText: 'Numero de Celular',
                      prefixIcon: Icons.mobile_friendly),
                ),
                SizedBox(height: 20),
              ],
            )),
      ),
    );
  }

  BoxDecoration _BuildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]);
}
