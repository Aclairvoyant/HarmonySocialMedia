import router from '@ohos.router';
import { CommonTopBar } from '../component/CommonTopBar';
import { NewsModelListData } from '../model/NewsModel';
import newsViewModel from '../viewmodel/NewsViewModel';

@Entry
@Component
export struct NewsPage {
  @State isRefreshing: boolean = false
  @State newsList: NewsModelListData[] = [];

  aboutToAppear() {
    this.loadNet();
  }

  loadNet() {
    newsViewModel.getNewsList(
      (result) => {
        this.newsList = result
        console.log("newsList:" + this.newsList)
      }
    )
  }

  build() {
    Column() {
      CommonTopBar({ title: "新闻", backButton: false, alpha: 1 }).align(Alignment.TopStart)

      Refresh({ refreshing: $$this.isRefreshing, offset: 120, friction: 100 }) {
        List({ space: 20 }) {
          ForEach(this.newsList, (item: NewsModelListData) => {
            ListItem() {
              Column() {
                Row() {
                  Image($r('app.media.ic_news'))
                    .height("16fp")
                    .aspectRatio(2)
                  Text(item.title)
                    .fontSize("16fp")
                    .fontColor("#182431")
                    .layoutWeight(1)
                    .maxLines(1)
                    .lineHeight("24fp")//.fontFamily($r('app.string.harmony_hei_ti_medium'))
                    .margin({ left: "8vp" })
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .fontWeight(500)
                }
                .alignItems(VerticalAlign.Center)
                .width("100%")


                Row({ space: 8 }) {
                  Image(item.pic)
                    .height("100%")
                    .aspectRatio(1)
                    .objectFit(ImageFit.Cover)
                    .borderRadius("8vp")

                  Text(item.desc)
                    .fontSize("14fp")//.fontFamily($r('app.string.harmony_hei_ti'))
                    .opacity(0.6)
                    .fontColor("#182431")
                    .lineHeight("20fp")
                    .width("100%")
                    .maxLines(3)
                    .fontWeight(400)
                    .textOverflow({ overflow: TextOverflow.Clip })
                }
                .clip(true)
                .width("100%")
                .height("80vp")
                .margin({ top: "12vp" })

                //Image($r('app.media.ic_fire'))
                Text("热度  " + item.hot)
                  .fontSize("12fp")
                  .fontColor("#FF989898")
                  .width("100%")
                  .margin({ top: "8vp" })
              }
              .onClick(() => {
                router.pushUrl({
                  url: "pages/NewsDetailPage",
                  params: {
                    "url": item.mobilUrl,
                  }
                })
              })
            }

          }, item => item.index)
        }
        .onReachEnd(() => {
          this.loadNet()
        })
      }
      .onRefreshing(() => {
        setTimeout(() => {
          this.loadNet();
          this.isRefreshing = false;
        }, 500)
      })
    }
  }
}