import {
  addPostAxios,
  doFavourByIdAxios, doThumbByIdAxios, getPostByIdAxios, getPostListAxios,
  selectPostByTitleOrContentAxios
} from '../apis/PostApi'
import { CommonConstant } from '../constants/CommonConstant'
import showToast from '../utils/ToastUtil'
import { BaseViewModel, ResultCallback } from './BaseViewModel'
import router from '@ohos.router'

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

  /**
   * 根据帖子标题或内容查询
   */
  async selectPostByTitleOrContent(titleOrContent: string, resultCallback?: ResultCallback) {
    await this.httpRequest().promise(selectPostByTitleOrContentAxios(titleOrContent).then(result => {
      resultCallback?.(result)
    }),true)
  }

  /**
   * 发布帖子
   */
  async addPost(title: string, content: string) {
    await this.httpRequest().promise(addPostAxios(title, content).then(result => {
      if (result.code == CommonConstant.SUCCESS_CODE) {
        showToast("发布成功");
      } else {
        showToast(result.message);
      }
    }), true)
  }
}

let postViewModel = new PostViewModel()

export default postViewModel as PostViewModel