import router from '@ohos.router';
import { CommonTopBar } from '../component/CommonTopBar';
import { PostModelListData } from '../model/PostModel';
import showToast from '../utils/ToastUtil';
import postViewModel from '../viewmodel/PostViewModel';

@Entry
@Component
export struct SearchPage {
  @State searchInput: string = "";
  @State searchSuccess: boolean = false;
  @State searchResults: PostModelListData[] = [];

  solveInput(searchInput: string) {
    postViewModel.selectPostByTitleOrContent(searchInput, (result) => {
      if (result.data == null) {
        showToast("无相关帖子!");
      } else {
        this.searchResults = result.data;
        this.searchSuccess = true;
      }
    })
  }

  build() {
    Column() {

      CommonTopBar({ title: "搜索", backButton: false, alpha: 1 }).align(Alignment.TopStart)

      Row() {
        Image($r('app.media.ic_search'))
          .width("25")
          .margin({ top: 100, right: 10 })

        TextInput({ placeholder: "请输入要查询的帖子或内容" })
          .width("260")
          .height("50")
          .margin({ top: 100 })
          .onChange((value) => {
            this.searchInput = value
          })
      }

      Button("查询")
        .margin(25)
        .width("100")
        .onClick(() => {
          this.solveInput(this.searchInput)
        })

      if (this.searchSuccess == true) {
        List({ space: 20 }) {
          ForEach(this.searchResults, (item: PostModelListData) => {
            ListItem() {
              Row({ space: 20 }) {
                Column({ space: 10 }) {
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

      }
    }
  }
}