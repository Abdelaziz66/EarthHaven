import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/address_entity.dart';
import '../repositories/address_repo.dart';

class UploadAddressUseCase extends UseCase<void,AddressEntity>{
  final AddressRepo addressRepo;

  UploadAddressUseCase({required this.addressRepo});
  @override
  Future<Either<Failure, void>> call([AddressEntity? addressEntity]) async{
    return await addressRepo.uploadAddress(addressEntity: addressEntity!);
  }

}