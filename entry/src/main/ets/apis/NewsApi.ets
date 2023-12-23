import axiosClient from '../http/AxiosRequest';
import { NewsModel } from '../model/NewsModel';

let baseURL = "https://api.vvhan.com/api/hotlist";

export function getNewsListAxios() {
  const result = axiosClient.get<NewsModel>({
    url: baseURL,
    params: {
      "type": "baiduRD"
    }
  })
  console.log("result1" + result)
  return result;
}
