export interface NewsModelListData {
  index: number;
  title: string;
  desc: string;
  pic: string;
  hot: number;
  url: string;
}

export interface NewsModel {
  success: boolean;
  title?: string;
  subtitle?: string;
  update_time?: number;
  data?: NewsModelListData[];
  message?: string;
}

