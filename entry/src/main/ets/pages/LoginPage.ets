import router from '@ohos.router';
import loginViewModel from '../viewmodel/LoginViewModel';
import { UserModel } from '../model/UserModel';


@Entry
@Component
struct LoginPage {
  @State userAccount: string = "";
  @State userPassword: string = "";
  @State userInfo: UserModel[] = [];

  build() {
    Column() {
      Column() {
        Text("登   录")
          .width("200vp")
          .height("60vp")
          .offset({ x: "0vp", y: "-149.62vp" })
          .fontColor(Color.Black)
          .textAlign(TextAlign.Center)
          .fontSize("29fp")
          .margin({ top: "80" })
        TextInput({ placeholder: "请输入用户名", text: this.userAccount })
          .width("200vp")
          .height("60vp")
          .offset({ x: "0vp", y: "-33.65vp" })
          .onChange((value) => this.userAccount = value)
        TextInput({ placeholder: "密码", text: this.userPassword })
          .width("200vp")
          .height("60vp")
          .type(InputType.Password)
          .onChange((value) => this.userPassword = value)
        Row() {
          Text("忘记密码")
            .width("121.64vp")
            .height("34.98vp")
            .offset({ x: "0vp", y: "-5.82vp" })
            .fontColor(Color.Black)
            .textAlign(TextAlign.Center)
          Text("获取验证码")
            .width("129.46vp")
            .height("41.52vp")
            .offset({ x: "20.39vp", y: "-3.67vp" })
            .fontColor(Color.Black)
            .textAlign(TextAlign.Center)
        }
        .width("276.55vp")
        .height("63.33vp")

        Button("登录")
          .width("156.89vp")
          .height("59.54vp")
          .offset({ x: "0vp", y: "38.49vp" })
          .fontColor(Color.White)
          .onClick(() => {
            loginViewModel.postLogin(`${this.userAccount}`, `${this.userPassword}`, (result) => {
              console.log(result);
              this.userInfo = result
            })
          })
        Button("注册")
          .width("163.33vp")
          .height("53.65vp")
          .offset({ x: "0vp", y: "70.75vp" })
          .fontColor(Color.White)
          .onClick(() => {
            router.pushUrl({
              url: "pages/RegisterPage"
            })
          })
      }
      .width("100%")
      .height("100%")
      .offset({ x: "0vp", y: "0vp" })
      .backgroundImage($r('app.media.bk'))
      .backgroundImageSize(ImageSize.Cover)
      .backgroundImagePosition(Alignment.Center)
      .justifyContent(FlexAlign.Center)
    }
    .width("100%")
    .height("100%")
  }
}
