part of 'home_cubit.dart';

class HomeState extends Equatable {
  List<String> listTitle;
  int indexSelected;
  List<ProductEntity> products;
  LoadStatus productStatus;

  HomeState({
    this.listTitle = const ["All", "Shampoo", "Body lotion", "Mask", "Sunscreen"],
    this.indexSelected = 0,
    this.products = const [],
    this.productStatus = LoadStatus.initial,
  });

  HomeState copyWith({
    List<String>? listTitle,
    int? indexSelected,
    List<ProductEntity>? products,
    LoadStatus? productStatus,
  }) {
    return HomeState(
      listTitle: listTitle ?? this.listTitle,
      indexSelected: indexSelected ?? this.indexSelected,
      products: products ?? this.products,
      productStatus: productStatus ?? this.productStatus,
    );
  }

  @override
  List<Object?> get props => [
        listTitle,
        indexSelected,
        products,
        productStatus,
      ];
}
