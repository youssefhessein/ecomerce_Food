abstract class ModelState {}

class ModelInitial extends ModelState{}
class LoadingModel extends ModelState {}

class SuccessModel extends ModelState {

}

class ErrorModel extends ModelState {
   final String  errorModel ;

  ErrorModel({required this.errorModel});
}
class InCRRMMENTModel extends ModelState {

}
class ModelFavoriteUpdated extends ModelState {}
class ModelCartUpdated extends ModelState {}
