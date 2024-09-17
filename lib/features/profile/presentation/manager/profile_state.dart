
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

// class GetAddressLoadingState extends ProfileState {}
//
// class GetAddressSuccessState extends ProfileState {
//   static List<AddressEntity> addressEntity = [];
//   static set({required List<AddressEntity> addressEntity}) {
//     GetAddressSuccessState.addressEntity = addressEntity;
//   }
// }
//
// class GetAddressErrorState extends ProfileState {
//   final String errMessage;
//
//   GetAddressErrorState(this.errMessage);
// }
//
// class UploadAddressLoadingState extends ProfileState {}
//
// class UploadAddressSuccessState extends ProfileState {}
//
// class UploadAddressErrorState extends ProfileState {
//   final String errMessage;
//
//   UploadAddressErrorState(this.errMessage);
// }
