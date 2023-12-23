import { NewsPage } from './NewsPage';
import { PostPage } from './PostPage';
import { UserProfilePage } from './UserProfilePage';

@Entry
@Component
struct TabsExample {
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
      .tabBar(this.TabBuilder('新闻', 0, $r('app.media.icon_sel_home'), $r('app.media.icon_unsel_home')))

      TabContent() {
        PostPage();
      }
      .tabBar(this.TabBuilder('社交', 1, $r('app.media.icon_sel_mine'), $r('app.media.icon_unsel_mine')))

      TabContent() {
        //Column().width('100%').height('100%').backgroundColor('#007DFF')
      }
      .tabBar(this.TabBuilder('通知', 2, $r('app.media.icon_sel_mine'), $r('app.media.icon_unsel_mine')))

      TabContent() {
        //Column().width('100%').height('100%').backgroundColor('#007DFF')
      }
      .tabBar(this.TabBuilder('搜索', 3, $r('app.media.icon_sel_mine'), $r('app.media.icon_unsel_mine')))

      TabContent() {
        //Column().width('100%').height('100%').backgroundColor('#007DFF')
        UserProfilePage()
      }
      .tabBar(this.TabBuilder('我的', 4, $r('app.media.icon_sel_mine'), $r('app.media.icon_unsel_mine')))
    }
    .barWidth('100%')
    .barHeight(50)
    .onChange((index: number) => {
      this.currentIndex = index;
    })
  }
}