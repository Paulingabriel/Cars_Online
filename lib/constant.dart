const base = 'https://chamois-big-quickly.ngrok-free.app';

const baseURL = '$base/api/v1/auth';
const registerURL = '$baseURL/register';
const loginURL = '$baseURL/login';
const logoutURL = '$baseURL/logout';
const userURL = '$baseURL/profile';

//------ Errors ------

const serverError = 'Server error';
const unauthorized = 'unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';
