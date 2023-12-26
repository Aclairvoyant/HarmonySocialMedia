import router from '@ohos.router';
import { CommonDialog } from '../component/CommonDialog';

@Entry
@Component
export struct MinePage {
  @State dialogTitle: Resource = $r('app.string.dialog_about_title')
  @State dialogContent: Resource = $r('app.string.project_desc')
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CommonDialog({ title: $dialogTitle, description: $dialogContent, showPositive: false })
  })

  aboutToAppear() {

  }

  aboutToDisappear() {
    this.dialogController = null;
  }

  build() {
    Scroll() {
      Column() {
        Column() {
          Image($r('app.media.ic_avatar'))
            .height($r('app.float.size_70'))
            .width($r('app.float.size_70'))
            .border({ radius: $r('app.float.size_35') })
          Text("Harmony-云社交App")
            .fontColor($r('app.color.color_white'))
            .fontSize($r('app.float.size_text_16'))
            .margin({ top: $r('app.float.size_10') })
        }
        .backgroundImage($r('app.media.bk'))
        .width("100%")
        .height($r('app.float.size_250'))
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)

        this.itemBuilder("发布", $r('app.media.ic_add'), () => {
          router.pushUrl({
            url: "pages/AddPostPage"
          })
        })

        this.itemBuilder("新闻", $r('app.media.ic_news'), () => {
          router.pushUrl({
            url: "pages/NewsPage"
          })
        })

        this.itemBuilder("帖子", $r('app.media.ic_post'), () => {
          router.pushUrl({
            url: "pages/PostPage"
          })
        })

        this.itemBuilder("关于", $r('app.media.ic_about'), () => {
          this.dialogController.open()
        })
      }.justifyContent(FlexAlign.Start).height("100%")
    }
  }

  @Builder
  itemBuilder(title: string, icon: Resource, onItemClick?: () => void) {
    Stack({ alignContent: Alignment.Bottom }) {
      Row() {
        Image(icon).width($r('app.float.size_25')).height($r('app.float.size_25'))
        Text(title)
          .fontSize($r('app.float.size_text_15'))
          .fontColor($r('app.color.color_333'))
          .margin({ left: $r('app.float.size_10') })
      }
      .height($r('app.float.size_50'))
      .width("100%")
      .alignItems(VerticalAlign.Center)
      .padding({ left: $r('app.float.size_10') })

      Divider()
        .color($r('app.color.color_f5f5f5'))
        .width("100%")
    }
    .height($r('app.float.size_50'))
    .width("100%")
    .onClick(() => {
      onItemClick?.()
    })
  }
}