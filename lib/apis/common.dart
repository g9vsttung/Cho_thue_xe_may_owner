//Change every restart the server
// ignore_for_file: constant_identifier_names, non_constant_identifier_names

const URL_SERVER = "http://18.138.110.46/";
// ignore: prefer_const_declarations
final _VERSION = "v1";

// ignore: prefer_const_declarations
final _URL_API = URL_SERVER + "api/" + _VERSION;

class AreaApiPath {
  // get all areas
  static String GET_ALL = "";
  // get a area by id
  static String GET_BY_ID = "";
  //Get a area by name
  static String GET_BY_NAME = _URL_API + "/areas?Name=";
}

class BikeApiPath {
  // get all bikes
  static String GET_ALL = _URL_API + "/bikes";
  // get a bike by id
  static String GET_BY_ID = _URL_API + "/bikes/";
  // create a bike
  static String CREATE_BIKE = _URL_API + "/bikes";
  // delete a bike
  static String DELETE_BIKE = _URL_API + "/bikes";
  // update bike
  static String UPDATE_BIKE = _URL_API + "/bikes";
}

class CustomerApiPath {
  // get all customers
  static String GET_ALL = "";
  // get a customer by phone
  static String GET_BY_PHONE = _URL_API + "/customers/phone/";
}

class OwnerApiPath {
  static String GET_ALL = _URL_API + "/owners";
  //Login
  static String LOGIN = _URL_API + "/owners/login";
  //Get owner by id
  static String GET_BY_ID = _URL_API + "/owners/";
  //Get list bike of owner
  static String GET_LIST_BIKE_BY_ID = _URL_API + "/bikes/suitableBike/";
  //Accept order
  static String ACCEPT = _URL_API + "/owners/";
  //Deny order
  static String DENY = _URL_API + "/owners/";
}

class AdminApiPath {
  static String GET_ALL = "";
}

class BrandApiPath {
  static String GET_ALL = _URL_API + "/brands";
}
