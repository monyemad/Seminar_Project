abstract class AppStateA {}

class MyAppInitial extends AppStateA {
  @override
  List<Object> get props => [];
}

class LoadingState extends AppStateA {}

class ErrorState extends AppStateA {}

class DoneState extends AppStateA {}

class PickImageState extends AppStateA {}

// Edit Profile

class EditProfileDoneState extends AppStateA {
  final String done;

  EditProfileDoneState(this.done);
}

class EditProfileLoadingState extends AppStateA {}

class EditProfileErrorState extends AppStateA {
  final String error;

  EditProfileErrorState(this.error);
}

// Profile

class ProfileDoneState extends AppStateA {
  final String done;

  ProfileDoneState(this.done);
}

class ProfileLoadingState extends AppStateA {}

class ProfileErrorState extends AppStateA {
  final String error;

  ProfileErrorState(this.error);
}

// Login

class LoginLoadingState extends AppStateA {}

class LoginErrorState extends AppStateA {
  final String error;

  LoginErrorState(this.error);
}

class LoginDoneState extends AppStateA {
  final String message;
  final String userId;

  LoginDoneState(this.userId, this.message);
}

// Reset

class ResetLoadingState extends AppStateA {}

class ResetErrorState extends AppStateA {
  final String error;

  ResetErrorState(this.error);
}

class ResetDoneState extends AppStateA {}

// Create acc

class CreateLoadingState extends AppStateA {}

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

// Missing Case

class MissingCaseLoadingState extends AppStateA {}

class MissingCaseErrorState extends AppStateA {
  final String error;

  MissingCaseErrorState(this.error);
}

class MissingCaseDoneState extends AppStateA {
  final String done;

  MissingCaseDoneState(this.done);
}
// Found Case

class FoundCaseLoadingState extends AppStateA {}

class FoundCaseErrorState extends AppStateA {
  final String error;

  FoundCaseErrorState(this.error);
}

class FoundCaseDoneState extends AppStateA {
  final String done;

  FoundCaseDoneState(this.done);
}

// Therapy Session

class TherapySessionLoadingState extends AppStateA {}

class TherapySessionErrorState extends AppStateA {
  final String error;

  TherapySessionErrorState(this.error);
}

class TherapySessionDoneState extends AppStateA {
  final String done;

  TherapySessionDoneState(this.done);
}

// Dna Laboratory

class DnaLabLoadingState extends AppStateA {}

class DnaLabErrorState extends AppStateA {
  final String error;

  DnaLabErrorState(this.error);
}

class DnaLabDoneState extends AppStateA {
  final String done;

  DnaLabDoneState(this.done);
}

// Support

class SupportLoadingState extends AppStateA {}

class SupportErrorState extends AppStateA {
  final String error;

  SupportErrorState(this.error);
}

class SupportDoneState extends AppStateA {
  final String done;

  SupportDoneState(this.done);
}
