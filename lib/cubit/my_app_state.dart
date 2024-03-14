abstract class AppStateA {}

class MyAppInitial extends AppStateA {}

class LoadingState extends AppStateA {}

class ErrorState extends AppStateA {}

class DoneState extends AppStateA {}

class PickImageState extends AppStateA {}

// GetData
class GetDataLoadingState extends AppStateA {}

class GetDataErrorState extends AppStateA {
  final String error;

  GetDataErrorState(this.error);
}

class GetDataDoneState extends AppStateA {}

// Login
class LoginLoadingState extends AppStateA {}

class LoginErrorState extends AppStateA {
  final String error;

  LoginErrorState(this.error);
}

class LoginDoneState extends AppStateA {}

// Create acc

class CreateLoadingState extends AppStateA {}

class CreateErrorState extends AppStateA {
  final String error;

  CreateErrorState(this.error);
}

class CreateDoneState extends AppStateA {}

// Image

class UploadLoadingState extends AppStateA {}

class UploadErrorState extends AppStateA {
  final String error;

  UploadErrorState(this.error);
}

class UploadDoneState extends AppStateA {}