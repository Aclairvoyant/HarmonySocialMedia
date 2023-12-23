import web_webview from '@ohos.web.webview'
import router from '@ohos.router'

@Entry
@Component
export struct NewsDetailPage {

  @State newsUrl: string = "";

  onPageShow() {
    this.newsUrl = router.getParams()['url']
    console.log("url:" + this.newsUrl)
  }

  controller: web_webview.WebviewController = new web_webview.WebviewController()
  build() {
    Column() {
      Web({ src: this.newsUrl, controller: this.controller })
    }
  }
}