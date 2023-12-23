import { CommonTopBar } from '../component/CommonTopBar';

@Entry
@Component
export struct NotifyPage {

  build() {
    Column() {
      CommonTopBar({ title: "通知中心", backButton: false, alpha: 1 }).align(Alignment.TopStart)

      Swiper() {
        Image($r('app.media.bk')).imgStyle();
        Image($r('app.media.bk1')).imgStyle();
        Image($r('app.media.bk2')).imgStyle();
        Image($r('app.media.bk3')).imgStyle();
      }
      .padding(10)
      .loop(true)
      .autoPlay(true)
      .interval(2000)


    }
  }
}

@Extend(Image) function imgStyle() {
  .width("100%")
  .height(200)
  .borderRadius(10)
  .objectFit(ImageFit.Cover)
}