import router from '@ohos.router'
import { CommonTopBar } from '../component/CommonTopBar'
import { CommonConstant } from '../constants/CommonConstant';
import postViewModel from '../viewmodel/PostViewModel';
import promptAction from '@ohos.promptAction';
import { PostModelDetailData, PostModelListData } from '../model/PostModel';
import { UserModel } from '../model/UserModel';
import showToast from '../utils/ToastUtil';

@Entry
@Component
struct PostDetailPage {

  @State postId: string = '';
  @State postDetail: PostModelDetailData = {
    data: {} as PostModelListData,
    user: {} as UserModel,
    hasThumb: null,
    hasFavour: null
  };
  @State @Watch('changeThumb') isThumb: number = -1;
  @State @Watch('changeFavour') isFavour: number = -1;

  onPageShow() {
    this.postId = router.getParams()['id']
    console.log("postId:" + this.postId)
    this.loadNet();
  }

  loadNet() {
    postViewModel.getPostById(this.postId, (result) => {
      if (result.code == CommonConstant.SUCCESS_CODE) {
        this.postDetail = result;
      } else {
        showToast(`${result.message}`)
      }
    })
  }

  changeThumb() {
    this.postDetail.hasThumb -= 1
  }

  changeFavour() {
    this.postDetail.hasFavour -= 1
  }

  build() {
    Column() {
      CommonTopBar({ title: '帖子详情', alpha: 1 })
      // 帖子标题
      Text(this.postDetail.data.title)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .padding({ top: 60, bottom: 10 })
        //.alignSelf(Align.Center)

      // 帖子内容
      Text(this.postDetail.data.content)
        .fontSize(20)
        .padding({ left: 20, right: 20, bottom: 20 })

      // 点赞和收藏信息
      Row() {
        Text('点赞数: ' + this.postDetail.data.thumbNum)
          .fontSize(18)
          .padding({ right: 10 })

        Text('收藏数: ' + this.postDetail.data.favourNum)
          .fontSize(18)
      }
      .padding({ bottom: 20 })

      // 用户信息
      Column() {
        Text('用户: ' + (this.postDetail.user.userName ?? '未知'))
          .fontSize(20)
          .padding({ bottom: 10 })

        // 用户头像
        if (this.postDetail.user.userAvatar) {
          Image(this.postDetail.user.userAvatar)
            .width(100)
            .height(100)
            .borderRadius(50)
            .padding({ bottom: 10 })
        }
      }

      Row() {
        Button("点赞")

          .onClick(() => {
            postViewModel.doThumbById(this.postId)
          })

        Button("收藏")

          .onClick(() => {
            postViewModel.doFavourById(this.postId)
          })
      }

    }
    .width("100%")
    .height("100%")

  }

}
