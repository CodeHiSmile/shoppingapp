import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nx/models/entities/product_entity.dart';
import 'package:nx/models/enums/load_status.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  void changeTitleSelected(int index) {
    emit(state.copyWith(indexSelected: index));
  }

  void loadProducts() {
    emit(state.copyWith(productStatus: LoadStatus.loading));
    try {
      emit(
        state.copyWith(
          products: listProduct,
          productStatus: LoadStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(productStatus: LoadStatus.failure));
    }
  }
}
