import { getNewsListAxios } from '../apis/NewsApi'
import { BaseViewModel, ResultCallback } from './BaseViewModel'

export class NewsViewModel extends BaseViewModel{

  /**
   * 获取新闻数据
   */
  async getNewsList(resultCallback?: ResultCallback) {
    await this.httpRequest().promise(getNewsListAxios().then(result => {
      console.log("result" + result)
      let list = result.data
      console.log("list" + list)
      resultCallback?.(list)
    }), true)
  }
}

let newsViewModel = new NewsViewModel()

export default newsViewModel as NewsViewModel