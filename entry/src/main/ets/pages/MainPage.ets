import { MinePage } from './MinePage';
import { NewsPage } from './NewsPage';
import { NotifyPage } from './NotifyPage';
import { PostPage } from './PostPage';
import { SearchPage } from './SearchPage';

@Entry
@Component
struct MainPage {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController, index: this.currentIndex }) {
      TabContent() {
        NewsPage();
      }
      .tabBar(this.TabBuilder('新闻', 0, $r('app.media.ic_news_c'), $r('app.media.ic_news')))

      TabContent() {
        PostPage();
      }
      .tabBar(this.TabBuilder('社交', 1, $r('app.media.ic_post_c'), $r('app.media.ic_post')))

      TabContent() {
        NotifyPage();
      }
      .tabBar(this.TabBuilder('通知', 2, $r('app.media.ic_notify_c'), $r('app.media.ic_notify')))

      TabContent() {
        SearchPage();
      }
      .tabBar(this.TabBuilder('搜索', 3, $r('app.media.ic_search_c'), $r('app.media.ic_search')))

      TabContent() {
        MinePage();
      }
      .tabBar(this.TabBuilder('我的', 4, $r('app.media.ic_mine_c'), $r('app.media.ic_mine')))
    }
    .barWidth('100%')
    .barHeight(50)
    .onChange((index: number) => {
      this.currentIndex = index;
    })
  }
}