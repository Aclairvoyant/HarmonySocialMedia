import { CommonTopBar } from '../component/CommonTopBar';
import { NotificationModel } from '../model/NotificationModel';

@Entry
@Component
export struct NotifyPage {

  @State notification: NotificationModel = {
    id: '',
    title: '',
    content: '',
    date: ''
  };

  aboutToAppear() {
    this.loadNotification();
  }

  loadNotification() {
    getNotificationData((notificationData: NotificationModel) => {
      this.notification = notificationData;
    });
  }

  build() {
    Column() {
      CommonTopBar({ title: "通知中心", backButton: false, alpha: 1 }).align(Alignment.Top)

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

      Row() {
        Image($r('app.media.ic_notification'))
          .width("32vp")
          .height("32vp")
          .margin({ right: "10vp" })

        Column() {
          Row() {
            Text(this.notification.title)
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .padding({ bottom: "5vp" })
              .textAlign(TextAlign.Start)

            Text(this.notification.date)
              .fontSize(8)
              .padding({left: 20})
          }

          Text(this.notification.content)
            .fontSize(10)
        }
      }
      .padding({ top: "20vp", left: "20vp", right: "20vp" })
      .alignItems(VerticalAlign.Top)
      .justifyContent(FlexAlign.Start)
    }
  }
}

@Extend(Image) function imgStyle() {
  .width("100%")
  .height(200)
  .borderRadius(10)
  .objectFit(ImageFit.Cover)
}

function getNotificationData(callback: (notificationData: NotificationModel) => void) {
  // 模拟获取数据
  setTimeout(() => {
    const data = {
      id: '1',
      title: '系统通知',
      content: '通知您已点赞某某帖子',
      date: '2021-01-01',
    };
    callback(data);
  }, 1000);
}