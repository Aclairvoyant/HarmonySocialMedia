import { doFavourByIdAxios, doThumbByIdAxios, getPostByIdAxios, getPostListAxios } from '../apis/PostApi'
import { BaseViewModel, ResultCallback } from './BaseViewModel'

export class PostViewModel extends BaseViewModel{

  /**
   * 获取帖子数据
   */
  async getPostList(resultCallback?: ResultCallback) {
    await this.httpRequest().promise(getPostListAxios().then(result => {
      console.log("result" + result)
      let list = result.data
      console.log("list" + list)
      resultCallback?.(list)
    }), true)
  }

  /**
   * 根据帖子id获取
   */
  async getPostById(postId: string, resultCallback?: ResultCallback) {
    console.log(postId)
    await this.httpRequest().promise(getPostByIdAxios(postId).then(result => {
      resultCallback?.(result)
    }), true)
  }

  /**
   * 根据帖子id点赞
   */
  async doThumbById(postId: string, resultCallback?: ResultCallback) {
    await this.httpRequest().promise(doThumbByIdAxios(postId).then(result => {
      resultCallback?.(result)
    }), true)
  }

  /**
   * 根据帖子id收藏
   */
  async doFavourById(postId: string, resultCallback?: ResultCallback) {
    await this.httpRequest().promise(doFavourByIdAxios(postId).then(result => {
      resultCallback?.(result)
    }),true)
  }
}

let postViewModel = new PostViewModel()

export default postViewModel as PostViewModel