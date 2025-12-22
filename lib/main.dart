import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesa_machinetask/core/network/dio_client.dart';
import 'package:nesa_machinetask/features/product_editscreen/data/datasource/product_updatedatasource.dart';
import 'package:nesa_machinetask/features/product_editscreen/data/repository/product_updaterepositoryimp.dart';
import 'package:nesa_machinetask/features/product_editscreen/domain/usecase/update_productusecase.dart';
import 'package:nesa_machinetask/features/product_editscreen/presentation/bloc/editproduct_bloc.dart';
import 'package:nesa_machinetask/features/product_screen/data/product_datasource/product_datasource.dart';
import 'package:nesa_machinetask/features/product_screen/data/repository/product_repositoryimp.dart';
import 'package:nesa_machinetask/features/product_screen/domain/usecases/product_usecase.dart';
import 'package:nesa_machinetask/features/product_screen/presentation/bloc/product_bloc.dart';
import 'package:nesa_machinetask/features/product_screen/presentation/ui/product_screen.dart';
import 'package:nesa_machinetask/features/products_detailed/data/datasource/product_detailsdatasource.dart';
import 'package:nesa_machinetask/features/products_detailed/data/repository/product_detailrepositoryimp.dart';
import 'package:nesa_machinetask/features/products_detailed/domain/usecase/product_detailusecase.dart';
import 'package:nesa_machinetask/features/products_detailed/presentation/bloc/productdetails_bloc.dart';

void main() {
  final dio = DioClient.create();
  final remote = ProductRemoteDataSource(dio);
  final repo = ProductRepositoryImpl(remote);
  final getProducts = GetProducts(repo);

  final remotedetail = ProductDetailsdatasource(dio);
  final remoterepro = ProductDetailrepositoryImp(remotedetail);
  final getProductsDetails = GetProductDetailsUseCase(remoterepro);

  final remoteedit = ProductUpdateRemoteDataSource(dio);
  final remotereproedit = ProductUpdateRepositoryImpl(remoteedit);
  final productupdate = UpdateProductUseCase(remotereproedit);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(create: (_) => ProductBloc(getProducts)),
        BlocProvider<ProductDetailsBloc>(
          create: (_) => ProductDetailsBloc(getProductsDetails),
        ),
        BlocProvider<EditProductBloc>(
          create: (_) => EditProductBloc(productupdate),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: ProductListPage(),
    );
  }
}
