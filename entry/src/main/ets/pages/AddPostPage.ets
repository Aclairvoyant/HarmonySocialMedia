import { CommonTopBar } from '../component/CommonTopBar'
import showToast from '../utils/ToastUtil';
import postViewModel from '../viewmodel/PostViewModel';

@Entry
@Component
export struct AddPostPage {

  @State title: string = '';
  @State content: string = '';

  uploadNewsData() {
    if (this.title === '') {
      showToast("请输入标题");
      return;
    }
    if (this.content === '') {
      showToast("请输入文章内容");
      return;
    }
    postViewModel.addPost(this.title, this.content);

  }

  build() {
    Column() {
      CommonTopBar({ title: "发布帖子", backButton: true, alpha: 1 }).align(Alignment.TopStart)

      Column() {
        Column() {
          TextInput({ placeholder: "请输入标题" })
            .fontSize("16fp")
            .placeholderFont({ size: "16fp" })
            .margin({ top: "12vp" })
            .fontColor("#182431")
            .backgroundColor(Color.White)
            .onChange((value: string) => {
              this.title = value;
            })
            .width("100%")
            .height("44vp")
          Divider()
            .opacity(0.05)
            .color("#182431")
            .width("90%")
          TextArea({ placeholder: "请输入文章内容" })
            .placeholderFont({ size: "16fp" })
            .fontColor("#182431")
            .height("140vp")
            .fontSize("16vp")
            .margin({ top: "8vp" })
            .backgroundColor(Color.White)
            .onChange((value: string) => {
              this.content = value;
            })
        }
        .borderRadius("20vp")
        .backgroundColor(Color.White)
        .width("100%")

        Button("发布")
          .fontSize("16fp")
          .height("40vp")
          .width("200vp")
          .margin({ bottom: "100vp" })
          .onClick(() => this.uploadNewsData())
      }
      .padding({
        left: "12vp",
        right: "12vp",
        bottom: "12vp",
        top: "50vp"
      })
      .height("100%")
      .justifyContent(FlexAlign.SpaceBetween)
    }
  }
}