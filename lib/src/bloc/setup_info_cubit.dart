import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wassit_cars_rental_app/src/models/setup_info_model.dart';

class SetUpInfoCubit extends Cubit<SetupInfoModel> {
  SetUpInfoCubit()
      : super(SetupInfoModel(
          ownerName: '',
          agencyName: '',
          wilaya: Wilaya.Adrar,
          city: '',
          imageUrl: '',
          phoneNumber: '',
        ));

  void updateProperty(String property, dynamic value) {
    emit(state.copyWith(
      agencyName: property == 'agencyName' ? value : state.agencyName,
      ownerName: property == 'ownerName' ? value : state.ownerName,
      wilaya: property == 'wilaya' ? value : state.wilaya,
      city: property == 'city' ? value : state.city,
      imageUrl: property == 'imageUrl' ? value : state.imageUrl,
      phoneNumber: property == 'phoneNumber' ? value : state.phoneNumber,
    ));
  }
}
