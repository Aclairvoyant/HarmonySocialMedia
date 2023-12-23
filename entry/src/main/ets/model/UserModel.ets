export interface UserModel {
  id: string,
  // userAccount: string,
  // userPassword: string,
  userName: string | null,
  userAvatar: string | null,
  userProfile: string | null,
  userRole: string,
  createTime: string,
  //updateTime?: Date,
}

export interface UserLoginModel {
  userAccount: string,
  userPassword: string,
}

export interface UserModelList {
  code?: string;
  data?: UserModel;
  message?: string;
}

export interface UserRegisterModel {
  userAccount: string,
  userPassword: string,
  checkPassword: string,
}

export interface UserRegisterData {
  code?: string;
  data?: string;
  message?: string;
}
