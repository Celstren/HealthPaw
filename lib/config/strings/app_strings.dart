import 'package:HealthPaw/config/app_config.dart';

class AppStrings {
  static final String healthPaw =
      AppConfig.commonStringsJson["title"] ?? "Health Paw";
  static final String owners = AppConfig.commonStringsJson["Owners"] ?? "";
  static final String owner = AppConfig.commonStringsJson["Owner"] ?? "";
  static final String accept = AppConfig.commonStringsJson["Accept"] ?? "";
  static final String search = AppConfig.commonStringsJson["Search"] ?? "";
  static final String connect = AppConfig.commonStringsJson["Connect"] ?? "";
  static final String close = AppConfig.commonStringsJson["Close"] ?? "";
  static final String register = AppConfig.commonStringsJson["Register"] ?? "";
  static final String modify = AppConfig.commonStringsJson["Modify"] ?? "";
  static final String cancel = AppConfig.commonStringsJson["Cancel"] ?? "";
  static final String deactivate =
      AppConfig.commonStringsJson["Deactivate"] ?? "";
  static final String deactivated =
      AppConfig.commonStringsJson["Deactivated"] ?? "";
  static final String activated =
      AppConfig.commonStringsJson["Activated"] ?? "";
  static final String sounds = AppConfig.commonStringsJson["Sounds"] ?? "";
  static final String alerts = AppConfig.commonStringsJson["Alerts"] ?? "";
  static final String record = AppConfig.commonStringsJson["Record"] ?? "";
  static final String variables =
      AppConfig.commonStringsJson["Variables"] ?? "";
  static final String petsList = AppConfig.commonStringsJson["PetsList"] ?? "";
  static final String home = AppConfig.commonStringsJson["Home"] ?? "";
  static final String profile = AppConfig.commonStringsJson["Profile"] ?? "";
  static final String cardiacHistory =
      AppConfig.commonStringsJson["CardiacHistory"] ?? "";
  static final String breathHistory =
      AppConfig.commonStringsJson["BreathHistory"] ?? "";
  static final String temperatureHistory =
      AppConfig.commonStringsJson["TemperatureHistory"] ?? "";
  static final String history = AppConfig.commonStringsJson["History"] ?? "";
  static final String names = AppConfig.commonStringsJson["Names"] ?? "";
  static final String birthDay = AppConfig.commonStringsJson["BirthDay"] ?? "";
  static final String status = AppConfig.commonStringsJson["Status"] ?? "";
  static final String menu = AppConfig.commonStringsJson["Menu"] ?? "";
  static final String environmentalTemperature =
      AppConfig.commonStringsJson["EnvironmentalTemperature"] ?? "";
  static final String localization =
      AppConfig.commonStringsJson["Localization"] ?? "";
  static final String calibrate =
      AppConfig.commonStringsJson["Calibrate"] ?? "";
  static final String calibrateWearable =
      AppConfig.commonStringsJson["CalibrateWearable"] ?? "";
  static final String calibrated =
      AppConfig.commonStringsJson["Calibrated"] ?? "";
  static final String connectionConfirmed =
      AppConfig.commonStringsJson["ConnectionConfirmed"] ?? "";
  static final String connectionWaiting =
      AppConfig.commonStringsJson["ConnectionWaiting"] ?? "";
  static final String connectionFailed =
      AppConfig.commonStringsJson["ConnectionFailed"] ?? "";
  static final String synchronize =
      AppConfig.commonStringsJson["Synchronize"] ?? "";
  static final String average = AppConfig.commonStringsJson["Average"] ?? "";
  static final String pets = AppConfig.commonStringsJson["Pets"] ?? "";
  static final String collars = AppConfig.commonStringsJson["Collars"] ?? "";
  static final String statusOverview =
      AppConfig.commonStringsJson["StatusOverview"] ?? "";
  static final String hearthRate =
      AppConfig.commonStringsJson["HearthRate"] ?? "";
  static final String petStatus =
      AppConfig.commonStringsJson["PetStatus"] ?? "";
  static final String login = AppConfig.commonStringsJson["Login"] ?? "";
  static final String username = AppConfig.commonStringsJson["Username"] ?? "";
  static final String documentNumber =
      AppConfig.commonStringsJson["DocumentNumber"] ?? "";
  static final String password = AppConfig.commonStringsJson["Password"] ?? "";
  static final String termsConditionsLabel =
      AppConfig.commonStringsJson["Terms&ConditionsLabel"] ?? "";
  static final String defaultSound =
      AppConfig.commonStringsJson["DefaultSound"] ?? "";
  static final String playingSound =
      AppConfig.commonStringsJson["PlayingSound"] ?? "";
  static final String stopPlaying =
      AppConfig.commonStringsJson["StopPlaying"] ?? "";
  static final String play = AppConfig.commonStringsJson["Play"] ?? "";
  static final String sendAudio =
      AppConfig.commonStringsJson["SendAudio"] ?? "";
  static final String sendVoiceNote =
      AppConfig.commonStringsJson["SendVoiceNote"] ?? "";
  static final String recordVoiceNote =
      AppConfig.commonStringsJson["RecordVoiceNote"] ?? "";
  static final String keepPressingToRecordVoiceNote =
      AppConfig.commonStringsJson["KeepPressingToRecordVoiceNote"] ?? "";
  static final String notification =
      AppConfig.commonStringsJson["Notification"] ?? "";
  static final String increasingHeartRate =
      AppConfig.commonStringsJson["IncreasingHeartRate"] ?? "";
  static final String beatsPerMinute =
      AppConfig.commonStringsJson["BeatsPerMinute"] ?? "";
  static final String recommendations =
      AppConfig.commonStringsJson["Recommendations"] ?? "";
  static final String alertSend =
      AppConfig.commonStringsJson["AlertSend"] ?? "";
  static final String fetchPetFail =
      AppConfig.commonStringsJson["FetchPetFail"] ?? "";
  static final String logoutFail =
      AppConfig.commonStringsJson["LogoutFail"] ?? "";
  static final String hearthRateHistory =
      AppConfig.commonStringsJson["HeartRateHistory"] ?? "";
  static final String media = AppConfig.commonStringsJson["Media"] ?? "";
  static final String maximumAbb =
      AppConfig.commonStringsJson["MaximumAbb"] ?? "";
  static final String minimumAbb =
      AppConfig.commonStringsJson["MinimumAbb"] ?? "";
  static final String syncWearable =
      AppConfig.commonStringsJson["SyncWearable"] ?? "";
  static final String physicalActivityHistory =
      AppConfig.commonStringsJson["PhysicalActivityHistory"] ?? "";
  static final String petProfile =
      AppConfig.commonStringsJson["PetProfile"] ?? "";
  static final String ownerProfile =
      AppConfig.commonStringsJson["OwnerProfile"] ?? "";
  static final String modifyOwnerProfile =
      AppConfig.commonStringsJson["ModifyOwnerProfile"] ?? "";
  static final String deactivateUser =
      AppConfig.commonStringsJson["DeactivateUser"] ?? "";
  static final String petOverview =
      AppConfig.commonStringsJson["PetOverview"] ?? "";
  static final String cardiacFrequency =
      AppConfig.commonStringsJson["CardiacFrequency"] ?? "";
  static final String breathFrequency =
      AppConfig.commonStringsJson["BreathFrequency"] ?? "";
  static final String physicalActivity =
      AppConfig.commonStringsJson["PhysicalActivity"] ?? "";
  static final String todaySoundIntensity =
      AppConfig.commonStringsJson["TodaySoundIntensity"] ?? "";
  static final String todayEnvironmentalTemperature =
      AppConfig.commonStringsJson["TodayEnvironmentalTemperature"] ?? "";
  static final String todayPhysicalActivity =
      AppConfig.commonStringsJson["TodayPhysicalActivity"] ?? "";
  static final String breathFrequencyHistory =
      AppConfig.commonStringsJson["BreathFrequencyHistory"] ?? "";
  static final String assignOwner =
      AppConfig.commonStringsJson["AssignOwner"] ?? "";
  static final String ownerMail =
      AppConfig.commonStringsJson["OwnerMail"] ?? "";
  static final String ownerAssigned =
      AppConfig.commonStringsJson["OwnerAssigned"] ?? "";
  static final String locationOf =
      AppConfig.commonStringsJson["LocationOf"] ?? "";
  static final String isLabel = AppConfig.commonStringsJson["is"] ?? "";
  static final String user = AppConfig.commonStringsJson["User"] ?? "";
  static final String users = AppConfig.commonStringsJson["Users"] ?? "";
  static final String vets = AppConfig.commonStringsJson["Vets"] ?? "";
  static final String registerVet =
      AppConfig.commonStringsJson["RegisterVet"] ?? "";
  static final String lastnames =
      AppConfig.commonStringsJson["Lastnames"] ?? "";
  static final String password2 =
      AppConfig.commonStringsJson["Password2"] ?? "";
  static final String mobileNumber =
      AppConfig.commonStringsJson["MobileNumber"] ?? "";
  static final String email = AppConfig.commonStringsJson["Email"] ?? "";
  static final String userType = AppConfig.commonStringsJson["UserType"] ?? "";
  static final String administratorProfile =
      AppConfig.commonStringsJson["AdministratorProfile"] ?? "";
  static final String veterinarianProfile =
      AppConfig.commonStringsJson["VeterinarianProfile"] ?? "";
  static final String registerForm =
      AppConfig.commonStringsJson["RegisterForm"] ?? "";
  static final String registerPet =
      AppConfig.commonStringsJson["RegisterPet"] ?? "";
  static final String modifyPet =
      AppConfig.commonStringsJson["ModifyPet"] ?? "";
  static final String administrator =
      AppConfig.commonStringsJson["Administrator"] ?? "";
  static final String veterinarian =
      AppConfig.commonStringsJson["Veterinarian"] ?? "";
  static final String registerUsers =
      AppConfig.commonStringsJson["RegisterUsers"] ?? "";
  static final String registerOwner =
      AppConfig.commonStringsJson["RegisterOwner"] ?? "";
  static final String registerAdmin =
      AppConfig.commonStringsJson["RegisterAdmin"] ?? "";
  static final String locatePet =
      AppConfig.commonStringsJson["LocatePet"] ?? "";
  static final String sendMessage =
      AppConfig.commonStringsJson["SendMessage"] ?? "";
  static final String sendNotification =
      AppConfig.commonStringsJson["SendNotification"] ?? "";
  static final String petsAssigned =
      AppConfig.commonStringsJson["PetsAssigned"] ?? "";
  static final String beatsPerMinuteUnits =
      AppConfig.commonStringsJson["BeatsPerMinuteUnits"] ?? "";
  static final String breathsPerMinuteUnits =
      AppConfig.commonStringsJson["BreathsPerMinuteUnits"] ?? "";
  static final String decibelsAbb =
      AppConfig.commonStringsJson["DecibelsAbb"] ?? "";
  static final String temperatureUnits =
      AppConfig.commonStringsJson["TemperatureUnits"] ?? "";
  static final String day = AppConfig.commonStringsJson["Day"] ?? "";
  static final String month = AppConfig.commonStringsJson["Month"] ?? "";
  static final String year = AppConfig.commonStringsJson["Year"] ?? "";
  static final String pm = AppConfig.commonStringsJson["pm"] ?? "";
  static final String am = AppConfig.commonStringsJson["am"] ?? "";
  static final String secondsAbb =
      AppConfig.commonStringsJson["SecondsAbb"] ?? "";
  static final String minutesAbb =
      AppConfig.commonStringsJson["MinutesAbb"] ?? "";
  static final String hourAbb = AppConfig.commonStringsJson["HourAbb"] ?? "";
  static final String seconds = AppConfig.commonStringsJson["Seconds"] ?? "";
  static final String minutes = AppConfig.commonStringsJson["Minutes"] ?? "";
  static final String hour = AppConfig.commonStringsJson["Hour"] ?? "";
  static final String successfulRegister =
      AppConfig.commonStringsJson["SuccessfulRegister"] ?? "";
  static final String successfulLogin =
      AppConfig.commonStringsJson["SuccessfulLogin"] ?? "";
  static final String failedLogin =
      AppConfig.commonStringsJson["FailedLogin"] ?? "";
  static final String noConectivity =
      AppConfig.commonStringsJson["NoConectivity"] ?? "";
  static final String serviceFailure =
      AppConfig.commonStringsJson["ServiceFailure"] ?? "";
  static final String nonAuthorized =
      AppConfig.commonStringsJson["NonAuthorized"] ?? "";
  static final String failedRegister =
      AppConfig.commonStringsJson["FailedRegister"] ?? "";
  static final String successfulModify =
      AppConfig.commonStringsJson["SuccessfulModify"] ?? "";
  static final String failedModify =
      AppConfig.commonStringsJson["FailedModify"] ?? "";
  static final String successfulDeactivate =
      AppConfig.commonStringsJson["SuccessfulDeactivate"] ?? "";
  static final String completeFields =
      AppConfig.commonStringsJson["CompleteFields"] ?? "";
  static final String passwordsMatch =
      AppConfig.commonStringsJson["PasswordsMatch"] ?? "";
  static final String messageSent =
      AppConfig.commonStringsJson["MessageSent"] ?? "";
  static final String passwordsNotMatch =
      AppConfig.commonStringsJson["PasswordsNotMatch"] ?? "";
  static final String validEmail =
      AppConfig.commonStringsJson["ValidEmail"] ?? "";
  static final String theField = AppConfig.commonStringsJson["TheField"] ?? "";
  static final String isInvalid =
      AppConfig.commonStringsJson["IsInvalid"] ?? "";
  static final String passwordConstraints =
      AppConfig.commonStringsJson["paswordConstraints"] ?? "";
  static final String enterName =
      AppConfig.commonStringsJson["EnterName"] ?? "";
  static final String enterLastname =
      AppConfig.commonStringsJson["EnterLastname"] ?? "";
  static final String enterUsername =
      AppConfig.commonStringsJson["EnterUsername"] ?? "";
  static final String enterDocumentNumber =
      AppConfig.commonStringsJson["EnterDocumentNumber"] ?? "";
  static final String enterPassword =
      AppConfig.commonStringsJson["EnterPassword"] ?? "";
  static final String enterMobile =
      AppConfig.commonStringsJson["EnterMobile"] ?? "";
  static final String enterBirthday =
      AppConfig.commonStringsJson["EnterBirthday"] ?? "";
  static final String enterEmail =
      AppConfig.commonStringsJson["EnterEmail"] ?? "";
  static final String selectUserType =
      AppConfig.commonStringsJson["SelectUserType"] ?? "";
  static final String ok = AppConfig.commonStringsJson["Ok"] ?? "";
  static final String askDeactivateAccount =
      AppConfig.commonStringsJson["AskDeactivateAccount"] ?? "";
  static final String petType = AppConfig.commonStringsJson["PetType"] ?? "";
  static final String dog = AppConfig.commonStringsJson["Dog"] ?? "";
  static final String cat = AppConfig.commonStringsJson["Cat"] ?? "";
  static final String viewOverview =
      AppConfig.commonStringsJson["ViewOverview"] ?? "";
  static final String viewHearthRate =
      AppConfig.commonStringsJson["ViewHearthRate"] ?? "";
  static final String historyHearthRate =
      AppConfig.commonStringsJson["HistoryHearthRate"] ?? "";
  static final String viewBreathRate =
      AppConfig.commonStringsJson["ViewBreathRate"] ?? "";
  static final String historyBreathRate =
      AppConfig.commonStringsJson["HistoryBreathRate"] ?? "";
  static final String viewPhysicalActivity =
      AppConfig.commonStringsJson["ViewPhysicalActivity"] ?? "";
  static final String historyPhysicalActivity =
      AppConfig.commonStringsJson["HistoryPhysicalActivity"] ?? "";
  static final String viewSound =
      AppConfig.commonStringsJson["ViewSound"] ?? "";
  static final String historySound =
      AppConfig.commonStringsJson["HistorySound"] ?? "";
  static final String viewTemperature =
      AppConfig.commonStringsJson["ViewTemperature"] ?? "";
  static final String historyTemperature =
      AppConfig.commonStringsJson["HistoryTemperature"] ?? "";
  static final String todayBreathFrequency =
      AppConfig.commonStringsJson["TodayBreathFrequency"] ?? "";
  static final String todayHearthRate =
      AppConfig.commonStringsJson["TodayHearthRate"] ?? "";
  static final String soundHistory =
      AppConfig.commonStringsJson["SoundHistory"] ?? "";
  static final String environmentalTemperatureHistory =
      AppConfig.commonStringsJson["EnvironmentalTemperatureHistory"] ?? "";
  static final String noDataChartMessage =
      AppConfig.commonStringsJson["NoDataChartMessage"] ?? "";
}
