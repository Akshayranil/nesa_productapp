import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesa_machinetask/core/network/dio_client.dart';
import 'package:nesa_machinetask/features/product_screen/data/product_datasource/product_datasource.dart';
import 'package:nesa_machinetask/features/product_screen/data/repository/product_repositoryimp.dart';
import 'package:nesa_machinetask/features/product_screen/domain/usecases/product_usecase.dart';
import 'package:nesa_machinetask/features/product_screen/presentation/bloc/product_bloc.dart';
import 'package:nesa_machinetask/features/product_screen/presentation/ui/product_screen.dart';

void main() {
    final dio = DioClient.create();
  final remote = ProductRemoteDataSource(dio);
  final repo = ProductRepositoryImpl(remote);
  final getProducts = GetProducts(repo);
  runApp( MultiBlocProvider(
    providers: [
      BlocProvider<ProductBloc>(create: (_)=>ProductBloc(getProducts)),
    ],
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: ProductListPage(),
    );
  }
}




