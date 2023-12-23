import axiosClient from '../http/AxiosRequest';
import { UserLoginModel, UserModelList, UserRegisterData, UserRegisterModel } from '../model/UserModel';

let baseURL = "http://localhost:8081/api/user/";

export function postLogin(userAccount: string, userPassword: string) {
  const result = axiosClient.post({
    url: baseURL + "login",
    data: {
      "userAccount" : userAccount,
      "userPassword" : userPassword
    }
  })
  return result;
}

export function postRegister(userRegisterModel: UserRegisterModel) {
  const result = axiosClient.post<UserRegisterData>({
    url: baseURL + "register",
    data: {
      "userAccount" : userRegisterModel.userAccount,
      "userPassword" : userRegisterModel.userPassword,
      "checkPassword" : userRegisterModel.checkPassword
    }
  })
  return result;
}

export function getLoginUserInfo() {
  const result = axiosClient.get<UserModelList>({
    url: baseURL + "get/login"
  })
  return result;
}