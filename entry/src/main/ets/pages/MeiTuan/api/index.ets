import { http } from "@kit.NetworkKit";
import { promptAction } from "@kit.ArkUI";
import { tabInterfaceResponse, foodCategoryResponse, foodsInterfaceResponse } from "../models";

const baseUrl:string="http://10.0.2.2:3100"
// 通用的 HTTP 请求处理函数
const requestHandler = async <T>(url: string, options: http.HttpRequestOptions = {}): Promise<T> => {
  const res = http.createHttp();
  try {
    const data = await res.request(url, options);
    return JSON.parse((data.result as string)) as T;
  } catch (e) {
    promptAction.showToast({ message: e.message });
    return Promise.reject(e);
  } finally {
    res.destroy();
  }
};

// 获取菜单数据
export const getMenu = async (): Promise<tabInterfaceResponse> => {
  return requestHandler<tabInterfaceResponse>(`${baseUrl}/menu`);
};

// 获取食品分类数据
export const getCategory = async (): Promise<foodCategoryResponse> => {
  return requestHandler<foodCategoryResponse>(`${baseUrl}/foodsCategory`);
};

// 根据食品 ID 获取食品列表
export const findFoodListById = async (foodId: string): Promise<foodsInterfaceResponse> => {
  return requestHandler<foodsInterfaceResponse>(`${baseUrl}/findFoodsById`, {
    method: http.RequestMethod.POST,
    header: {
      "Content-Type": "application/json",
    },
    extraData: {
      foodId,
    },
  });
};
