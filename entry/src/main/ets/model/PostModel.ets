import { UserModel } from './UserModel';

export interface PostModelListData {
  id: string;
  title: string;
  content: string;
  tags: string;
  thumbNum: number;
  favourNum: number;
  userId: string;
  createTime: Date;
  updateTime: Date;
  isDelete: number;
}

export interface PostModelDetailData {
  data: PostModelListData;
  user: UserModel;
  hasThumb: number | null;
  hasFavour: number | null;
}

export interface PostModelList {
  code?: string;
  data?: PostModelListData;
  message?: string;
}

export interface PostModelDetail {
  code?: string;
  data?: PostModelDetailData;
  message?: string;
}

export interface PostThumbModel {
  code?: string;
  data?: number;
  message?: string;
}

export interface PostFavourModel {
  code?: string;
  data?: number;
  message?: string;
}