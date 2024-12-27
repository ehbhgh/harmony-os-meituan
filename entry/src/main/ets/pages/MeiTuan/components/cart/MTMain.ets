import { foodCategory, foodCategoryModel, foodsInterfaceModel } from "../../models"
import MTFoodItem from "./MTFoodItem"
import { getCategory, findFoodListById } from "../../api"

@Component
export struct MTMain {
  @State foodCateList: Array<foodCategory> = []
  @State
  activeIndex: number = 0
  @State foodList: Array<foodsInterfaceModel> = []
  @State foodsId: string = "1"

  aboutToAppear(): void {
    this.getCategoryList()
    this.findFoodsList()
  }

  async getCategoryList() {
    const res = await getCategory()
    this.foodCateList = res.data
  }

  async findFoodsList() {
    console.log("this.foodsId"+this.foodsId)
    const res = await findFoodListById(this.foodsId)
    this.foodList = res.data
  }

  build() {
    Row() {
      Scroll() {
        Column() {
          ForEach(this.foodCateList, (item: foodCategoryModel, index: number) => {
            Text(item.foodCategory)
              .height(50)
              .textAlign(TextAlign.Center)
              .width("100%")
              .fontSize(14)
              .backgroundColor(this.activeIndex == index ? $r("app.color.white") : $r("app.color.left_back_color"))
              .onClick(() => {
                this.activeIndex = index
                this.foodsId=item.foodId
                this.findFoodsList()
              })
          })
        }.width("100%").backgroundColor($r('app.color.left_back_color')).height("100%")
      }.scrollable(ScrollDirection.Vertical).width(90)

      List() {
        ForEach(this.foodList, (item: foodsInterfaceModel) => {
          ListItem() {
            MTFoodItem({
              foodItem: item
            })
          }
        })
      }.padding({
        bottom: 100
      }).layoutWeight(1)
    }.width("100%")
  }
}