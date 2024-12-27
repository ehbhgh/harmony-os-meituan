import { foodsInterfaceModel } from "../models"

PersistentStorage.persistProp("shopping_cart", [])

export enum AddCutEnum {
  ADD,
  CUT
}

export class CartStore {
  //获取购物车
  static getCarts() {
    return AppStorage.get<Array<foodsInterfaceModel>>("shopping_cart") || []
  }

  //实现加菜与减菜
  static addCutCarts(type: AddCutEnum, item: foodsInterfaceModel) {
    const cartList = CartStore.getCarts()
    const findFood = cartList.find(food => food.id === item.id)
    if (type === AddCutEnum.ADD) {
      if (findFood) {
        findFood.count++
      } else {
        item.count = 1
        cartList.unshift(item)
      }
    } else if (type === AddCutEnum.CUT) {
      if (findFood && findFood.count > 0) {
        findFood.count--
        if (findFood.count === 0) {
          const index = cartList.findIndex(food => food.id === findFood.id)
          cartList.splice(index, 1)
        }
      }
    }
    AppStorage.set("shopping_cart", [...cartList])

    getContext().eventHub.emit("change_cart")
  }

  //清空购物车
  static clearCart() {
    AppStorage.set("shopping_cart", [])
    getContext().eventHub.emit("change_cart")
  }

}

