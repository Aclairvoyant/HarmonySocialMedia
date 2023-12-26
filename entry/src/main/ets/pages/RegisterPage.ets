import { CommonTopBar } from '../component/CommonTopBar'
import { UserRegisterModel } from '../model/UserModel';
import showToast from '../utils/ToastUtil';
import loginViewModel from '../viewmodel/LoginViewModel';

@Entry
@Component
export struct RegisterPage {
  @State userRegisterModel: UserRegisterModel = {
    userAccount: "",
    userPassword: "",
    checkPassword: ""
  }

  aboutToAppear() {

  }

  build() {
    Column() {
      CommonTopBar({ title: '注册界面', alpha: 1 })

      Row() {
        Text("用户账户")
          .margin({right: 20})
        TextInput({ placeholder: "请输入用户名", text: this.userRegisterModel.userAccount })
          .width("200vp")
          .height("45vp")
          .onChange((value) => this.userRegisterModel.userAccount = value)

      }
      .margin({top: 100, bottom: 20})

      Row() {
        Text("登录密码")
          .margin({right: 20})
        TextInput({ placeholder: "密码", text: this.userRegisterModel.userPassword })
          .width("200vp")
          .height("45vp")
          .type(InputType.Password)
          .onChange((value) => this.userRegisterModel.userPassword = value)
      }
      .margin({bottom: 20})

      Row() {
        Text("确认密码")
          .margin({right: 20})
        TextInput({ placeholder: "密码", text: this.userRegisterModel.checkPassword })
          .width("200vp")
          .height("45vp")
          .type(InputType.Password)
          .onChange((value) => this.userRegisterModel.checkPassword = value)
      }

      Button("确认注册")
        .width("200vp")
        .offset({ x: "0vp", y: "70vp" })
        .onClick(() => {
          if (this.userRegisterModel.userAccount == "") {
            showToast("请输入用户名！");
            return;
          }
          if (this.userRegisterModel.userPassword == "" || this.userRegisterModel.checkPassword == "") {
            showToast("请输入密码！");
            return;
          }
          if (this.userRegisterModel.userPassword === this.userRegisterModel.checkPassword) {
            loginViewModel.postRegister(this.userRegisterModel)
          } else {
            showToast("两次密码输入不一致!");
          }
        })
    }
  }
}