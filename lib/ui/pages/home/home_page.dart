import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nx/models/enums/load_status.dart';
import 'package:nx/ui/components/grid_delegate_custom.dart';
import 'package:nx/ui/pages/detail_product/detail_product_page.dart';

import 'home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit _cubit;

  @override
  void initState() {
    _cubit = HomeCubit();
    super.initState();
    _cubit.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFb9a381),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 8),
              Row(
                children: const <Widget>[
                  Icon(Icons.menu),
                  Spacer(),
                  Icon(Icons.search_rounded),
                  SizedBox(width: 12),
                  Icon(Icons.settings),
                  SizedBox(width: 18),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                "Best Products Here",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              _buildListTitle(),
              const SizedBox(height: 18),
              Expanded(
                child: _buildGridProducts(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridProducts() {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: _cubit,
      buildWhen: (prev, current) => prev.productStatus != current.productStatus,
      builder: (context, state) {
        if (state.productStatus == LoadStatus.loading) {
          return const Text("Loading...");
        } else if (state.productStatus == LoadStatus.failure) {
          return const Text("Load failse");
        } else {
          return GridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.only(right: 18),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 2,
              crossAxisSpacing: 22,
              mainAxisSpacing: 24,
              height: 242,
            ),
            itemCount: state.products.length,
            itemBuilder: (BuildContext context, int index) {
              final product = state.products[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailProductPage(
                        product: product,
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    SizedBox(
                      child: Container(
                        padding: const EdgeInsets.only(top: 12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Expanded(
                                  child: Image.network(
                                    product.urlImage!,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Center(
                                  child: Text(
                                    product.nameProduct!,
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  "\$${product.price!}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 32),
                              ],
                            ),
                            const Positioned(
                              top: 0,
                              right: 12,
                              child: Icon(
                                Icons.favorite_border_rounded,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }

  Widget _buildListTitle() {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: _cubit,
      buildWhen: (prev, current) => prev.indexSelected != current.indexSelected,
      builder: (context, state) {
        return SizedBox(
          height: 32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            itemCount: state.listTitle.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _cubit.changeTitleSelected(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: state.indexSelected == index ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Center(
                    child: Text(
                      state.listTitle[index],
                      style: TextStyle(
                        color: state.indexSelected == index ? Colors.white : Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
