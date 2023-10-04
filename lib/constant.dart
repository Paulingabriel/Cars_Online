<<<<<<< HEAD
const baseURL = 'http://192.168.126.92:8000/api';
const registerURL = '$baseURL/register';
const loginURL = '$baseURL/login';
const logoutURL = '$baseURL/logout';
const userURL = '$baseURL/user';
const carURL = '$baseURL/cars';
=======
const base = 'https://chamois-big-quickly.ngrok-free.app';

const baseURL = '$base/api/v1/auth';
const registerURL = '$baseURL/register';
const loginURL = '$baseURL/login';
const logoutURL = '$baseURL/logout';
const userURL = '$baseURL/profile';
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88

//------ Errors ------

const serverError = 'Server error';
const unauthorized = 'unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';
