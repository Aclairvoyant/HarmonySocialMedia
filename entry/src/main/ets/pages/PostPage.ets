import { CommonTopBar } from '../component/CommonTopBar';
import { PostModelListData } from '../model/PostModel';
import postViewModel from '../viewmodel/PostViewModel';
import router from '@ohos.router';

@Entry
@Component
export struct PostPage {
  @State isRefreshing: boolean = false
  @State postList: PostModelListData[] = [];

  aboutToAppear() {
    this.loadNet();
  }

  loadNet() {
    postViewModel.getPostList(
      (result) => {
        this.postList = result
        console.log("postList:" + this.postList)
      }
    )
  }


  build() {
    Column() {
      CommonTopBar({ title: "帖子", backButton: false, alpha: 1 }).align(Alignment.TopStart)
      Row() {

      }
      .width("100%")
      .height(30)
      .margin({ bottom: 20 })

      Refresh({ refreshing: $$this.isRefreshing, offset: 120, friction: 100 }) {
        List({ space: 20 }) {
          ForEach(this.postList, (item: PostModelListData) => {
            ListItem() {
              Row({space: 20}) {
                Column({space: 10}) {
                  Text("标题：" + item.title)
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                  Text("内容：" + item.content)
                    .fontSize(18)
                    .fontWeight(FontWeight.Normal)
                }
                .height("100%")
                .alignItems(HorizontalAlign.Center)

              }
              .width("100%")
              .backgroundColor("#FFF")
              .borderRadius(20)
              .height(120)
              .padding(10)
              .onClick(() => {
                router.pushUrl({
                  url: "pages/PostDetailPage",
                  params: {
                    "id": item.id,
                  }
                })
              })
            }
          }, item => item.id)
        }
        .padding(12)
        .height('100%')
        .backgroundColor(0xF1F3F5)
        .layoutWeight(1)
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