import { UserModel } from '../model/UserModel';
import loginViewModel from '../viewmodel/LoginViewModel';
import systemDateTime from '@ohos.systemDateTime';

@Entry
@Component
export struct UserProfilePage {
  @State userInfo: UserModel = {
    id: "",
    userName: "",
    userAvatar: "",
    userProfile: "",
    userRole: "",
    createTime: ""
  }

  onPageShow() {
    this.loadUserInfo();
    console.log(this.userInfo.id)
  }

  loadUserInfo() {
    loginViewModel.getUserInfo(result => {
      this.userInfo = result;
    })
  }

  build() {
    Column() {
      //用户头像
        Image(this.userInfo.userAvatar)
          .width(150)
          .height(150)
          .borderRadius(75)// 使头像呈圆形
          .margin({ top: 50, bottom: 20 })
      //     //.alignSelf(Align.Center)
      //
      //   // 用户昵称
      //   Text(this.userInfo.userName)
      //     .fontSize(24)
      //     .fontWeight(FontWeight.Bold)
      //     //.alignSelf(Alignment.Center)
      //     .margin({ bottom: 50 })
      //
      //   // 退出登录按钮
      //   Button(() => {
      //     // 退出登录的逻辑
      //     console.log('退出登录');
      //   })
      //     .Text('退出登录')
      //     .fontSize(20)
      //     .backgroundColor(Color.Red)
      //     .fontColor(Color.White)
      //     .padding({ top: 10, bottom: 10, left: 30, right: 30 })
      //     .cornerRadius(10)
      //     .alignSelf(Align.Center)
      // }
      // .width("100%")
      // .height("100%")
      // .alignItems(Align.Center)
      //.justifyContent(JustifyContent.Center)
    }
  }
}