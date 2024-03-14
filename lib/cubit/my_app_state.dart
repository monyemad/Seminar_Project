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

class LoginFailState extends AppStateA {
  final String fail;

  LoginFailState(this.fail);
}

class LoginErrorState extends AppStateA {
  final String error;

  LoginErrorState(this.error);
}

class LoginDoneState extends AppStateA {
  final String done;

  LoginDoneState(this.done);
}

// Create acc

class CreateLoadingState extends AppStateA {}

class CreateFailState extends AppStateA {
  final String fail;

  CreateFailState(this.fail);
}

class CreateErrorState extends AppStateA {
  final String error;

  CreateErrorState(this.error);
}

class CreateDoneState extends AppStateA {
  final String done;

  CreateDoneState(this.done);
}

// Image

class UploadLoadingState extends AppStateA {}

class UploadErrorState extends AppStateA {
  final String error;

  UploadErrorState(this.error);
}

class UploadDoneState extends AppStateA {}