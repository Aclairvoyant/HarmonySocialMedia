import axiosClient from '../http/AxiosRequest';
import { PostFavourModel, PostModelDetail, PostModelList, PostThumbModel } from '../model/PostModel';

let baseURL = "http://localhost:8081/api/post/";

export function getPostListAxios() {
  const result = axiosClient.get<PostModelList>({
    url: baseURL + "getAll"
  })
  console.log("result1" + result)
  return result;
}

export function getPostByIdAxios(postId: string) {
  console.log(postId)
  const result = axiosClient.get<PostModelDetail>({
    url: baseURL + "get/vo",
    params: {
      "id": postId
    }
  })
  console.log("result1" + result)
  return result;
}

export function doThumbByIdAxios(postId: string) {
  const result = axiosClient.post<PostThumbModel>({
    url: "http://localhost:8081/api/post_thumb/",
    data: {
      "postId": postId
    }
  })
  return result;
}

export function doFavourByIdAxios(postId: string) {
  const result = axiosClient.post<PostFavourModel>({
    url: "http://localhost:8081/api/post_favour/",
    data: {
      "postId": postId
    }
  })
  return result;
}