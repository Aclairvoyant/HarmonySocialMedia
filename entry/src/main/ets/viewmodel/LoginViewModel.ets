import { getLoginUserInfo, postLogin, postRegister } from '../apis/UserApi';
import { CommonConstant } from '../constants/CommonConstant';
import { BaseViewModel, ResultCallback } from './BaseViewModel';
import router from '@ohos.router';
import showToast from '../utils/ToastUtil';
import { UserRegisterModel } from '../model/UserModel';

export class LoginViewModel extends BaseViewModel {
  /**
   * 登录
   */
  async postLogin(userAccount: string, userPassword: string, resultCallback?: ResultCallback) {
    await this.httpRequest().promise(postLogin(userAccount, userPassword).then(result => {
      // let sessionId = result.headers;
      // console.log("sessionId" + sessionId)
      let code = result.code;
      if (code == CommonConstant.SUCCESS_CODE) {
        console.log("登录成功");
        router.pushUrl({
          url: "pages/MainPage"
        })
      } else {
        console.log("登录失败");
        showToast("输入的用户名或密码有误!")
      }
      resultCallback?.(result);
    }), true)
  }


  /**
   * 注册
   */
  async postRegister(userRegisterModel: UserRegisterModel, resultCallBack?: ResultCallback) {
    await this.httpRequest().promise(postRegister(userRegisterModel).then(result => {
      let code = result.code;
      if (code == CommonConstant.SUCCESS_CODE) {
        console.log("注册成功");
        showToast("注册成功");
        router.back();
      } else if (code == CommonConstant.BUSSINESS_EORROR_CODE) {
        showToast(`${result.message}`);
      }
      resultCallBack?.(result);
    }),true)
  }

  /**
   * 获取当前用户信息
   */
  async getUserInfo(resultCallBack?: ResultCallback) {
    await this.httpRequest().promise(getLoginUserInfo().then(result => {
      let data = result.data;
      resultCallBack?.(data);
    }),true)
  }
}

let loginViewModel = new LoginViewModel();

export default loginViewModel as LoginViewModel;