const userPoolId = "us-east-2_XfflzHZ0m";
const identityyPoolId = "us-east-2:ebc6d451-6b5f-4304-afc1-3a22c6e707bb";
const clientId = "10i6a0i6qv5csflrjfbciu8eve";
const apiEndpointUrl = "cubesnack.auth.us.east-2.amazoncognito.com";
const gClientId =
    "757395929934-ojudiojqucuk7k1fg3ror1f9r6vfeo60.apps.googleusercontent.com";
const gClientSecrete = "T2pol0lXDbaOyjxOfKW5su28";

const BASE_URL = "http://ec2-3-16-126-157.us-east-2.compute.amazonaws.com/";
// const BASE_URL = "https://api.cubesnack.com/";
// const BASE_URL = "https://cors-anywhere.herokuapp.com/http://ec2-3-16-126-157.us-east-2.compute.amazonaws.com/";


//const BASE_URL = "http://0.0.0.0:8000/";
const LOGIN = "auth/token";
const CREATE_SELLER = "seller/";
const USER_SIGNUP = "user/signup";
const GOOGLE_SIGNIN = "auth/token/google";
const FACEBOOK_SIGNIN = "auth/token/facebook";

const VERIFY_OTP = "user/otp";
const UPLOAD = "upload";
const ADD_STORE = "seller/buisness_unit/";
const ALL_CATEGORY = "product/category";
const CREATE_PRODUCT = "product";
const GET_STORE = "seller/buisness_unit/";
const GET_VARIATIONS = "product/category/";
const USER_PROFILE = "user/profile";
const ALL_STORES = "buy/store";
const HOME_SUFFIX_INNFO = "buy/home/info";
const HOME_PRODUCT_LIST = "buy/home/products";
const GET_PRODUCTS = "products";
const GET_CART = "user/cart";
const CART_QUANTITY_UPDATE = "user/cartitem/";
const USER_ADDRESS = "user/profile/address";
const USER_FAVAROITE = "user/favourite";
const CARDS = "transaction/card";
const CART_INVOICE = "invoice/";
const MAKE_PAYMENT = "transaction/payment";
const DELIVERY_OPTIONS = "shipment/address/verification";
const HOME_DELIVERY = "shipment/Home/charge";
const PRODUCT_SEARCH = "buy/products/tittle";
const USER_HISTORY = "user/browserHistory";
const ESTIMATED_DELIVERY = "buy/delivery";
const UPDATE_ORDER_STATUS = "invoice/status/update";
const CREATE_RETURN_REQUEST = "buy/products/return";
const WRITE_PRODUCT_REVIEW = "product";
const REGISTER_DEVICE = "user/fcmIdRegistration/";
const GET_ALL_NOTIFICATIONS = "notification/";
const GET_RETURN_LIST = "buy/products/return/details";
const CREATE_GIG = "freelancer/gig/";
const GIG_TAGS = "freelancer/tags/";

const ordersStatus = {
  "Receive": "Recieve",
  "Processing": "Processing",
  "Shipped": "Shipped",
  "Delivered": "Delivered",
  "Ready_for_pickup": "Ready for Pickup",
  "Complete": "Complete",
  "refund_resquested": "Refund Requested",
  "Refund_Approve": "Refund Approved",
  "refund_processed": "Refund Processed",
  "Cancelled": "Cancelled",
  "Refund_declined": "Refund Declined",
};

const returnStatus = {
  "return_created": "Return Created",
  "return_successfully": "Return successfully",
  "authorized": "Authorized",
  "deny": "Deny"
};

const years = ["2017", "2018", "2019", "2020", "2021", "2022", "2023", "2024"];
const FREE_LANCER_REGISTER = "freelancer/register/";

const states = [
  {"name": "Alabama", "abbreviation": "AL"},
  {"name": "Alaska", "abbreviation": "AK"},
  {"name": "American Samoa", "abbreviation": "AS"},
  {"name": "Arizona", "abbreviation": "AZ"},
  {"name": "Arkansas", "abbreviation": "AR"},
  {"name": "California", "abbreviation": "CA"},
  {"name": "Colorado", "abbreviation": "CO"},
  {"name": "Connecticut", "abbreviation": "CT"},
  {"name": "Delaware", "abbreviation": "DE"},
  {"name": "District Of Columbia", "abbreviation": "DC"},
  {"name": "Federated States Of Micronesia", "abbreviation": "FM"},
  {"name": "Florida", "abbreviation": "FL"},
  {"name": "Georgia", "abbreviation": "GA"},
  {"name": "Guam", "abbreviation": "GU"},
  {"name": "Hawaii", "abbreviation": "HI"},
  {"name": "Idaho", "abbreviation": "ID"},
  {"name": "Illinois", "abbreviation": "IL"},
  {"name": "Indiana", "abbreviation": "IN"},
  {"name": "Iowa", "abbreviation": "IA"},
  {"name": "Kansas", "abbreviation": "KS"},
  {"name": "Kentucky", "abbreviation": "KY"},
  {"name": "Louisiana", "abbreviation": "LA"},
  {"name": "Maine", "abbreviation": "ME"},
  {"name": "Marshall Islands", "abbreviation": "MH"},
  {"name": "Maryland", "abbreviation": "MD"},
  {"name": "Massachusetts", "abbreviation": "MA"},
  {"name": "Michigan", "abbreviation": "MI"},
  {"name": "Minnesota", "abbreviation": "MN"},
  {"name": "Mississippi", "abbreviation": "MS"},
  {"name": "Missouri", "abbreviation": "MO"},
  {"name": "Montana", "abbreviation": "MT"},
  {"name": "Nebraska", "abbreviation": "NE"},
  {"name": "Nevada", "abbreviation": "NV"},
  {"name": "New Hampshire", "abbreviation": "NH"},
  {"name": "New Jersey", "abbreviation": "NJ"},
  {"name": "New Mexico", "abbreviation": "NM"},
  {"name": "New York", "abbreviation": "NY"},
  {"name": "North Carolina", "abbreviation": "NC"},
  {"name": "North Dakota", "abbreviation": "ND"},
  {"name": "Northern Mariana Islands", "abbreviation": "MP"},
  {"name": "Ohio", "abbreviation": "OH"},
  {"name": "Oklahoma", "abbreviation": "OK"},
  {"name": "Oregon", "abbreviation": "OR"},
  {"name": "Palau", "abbreviation": "PW"},
  {"name": "Pennsylvania", "abbreviation": "PA"},
  {"name": "Puerto Rico", "abbreviation": "PR"},
  {"name": "Rhode Island", "abbreviation": "RI"},
  {"name": "South Carolina", "abbreviation": "SC"},
  {"name": "South Dakota", "abbreviation": "SD"},
  {"name": "Tennessee", "abbreviation": "TN"},
  {"name": "Texas", "abbreviation": "TX"},
  {"name": "Utah", "abbreviation": "UT"},
  {"name": "Vermont", "abbreviation": "VT"},
  {"name": "Virgin Islands", "abbreviation": "VI"},
  {"name": "Virginia", "abbreviation": "VA"},
  {"name": "Washington", "abbreviation": "WA"},
  {"name": "West Virginia", "abbreviation": "WV"},
  {"name": "Wisconsin", "abbreviation": "WI"},
  {"name": "Wyoming", "abbreviation": "WY"}
];
