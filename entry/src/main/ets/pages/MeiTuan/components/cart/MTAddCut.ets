import { foodsInterfaceModel, foodsInterface } from "../../models"
import { CartStore, AddCutEnum } from "../../utils"

@Component
struct MTAddCut {
  @Consume shoppingCart: Array<foodsInterfaceModel>
  @Consume showCart: boolean
  @Prop foodItem: foodsInterfaceModel = new foodsInterfaceModel({} as foodsInterface)

  getCount() {
    return this.shoppingCart.find(item => item.id === this.foodItem.id)?.count || 0
  }

  isVisibility() {
    return this.getCount() ? Visibility.Visible : Visibility.Hidden
  }

  build() {
    Row({ space: 8 }) {
      Row() {
        Image($r("app.media.iot_public_shot")).imgStyle()
      }.RowStyle("cut").visibility(this.isVisibility()).onClick(() => {
        CartStore.addCutCarts(AddCutEnum.CUT, this.foodItem)
        if(this.shoppingCart.length===0){
          this.showCart=false
        }
      })

      Text(this.getCount().toString()).visibility(this.isVisibility())
      Row() {
        Image($r("app.media.iot_public_add")).imgStyle()
      }.RowStyle("add").onClick(() => {
        CartStore.addCutCarts(AddCutEnum.ADD, this.foodItem)
      })

    }
  }
}

@Extend(Image)
function imgStyle() {
  .width(10).aspectRatio(1).fillColor($r("app.color.black"))
}

@Extend(Row)
function RowStyle(type: string) {
  .width(16)
  .aspectRatio(1)
  .justifyContent(FlexAlign.Center)
  .backgroundColor(type === "cut" ? $r("app.color.white") : $r("app.color.main_color"))
  .borderRadius(4)
  .border({
    color: $r("app.color.main_color"),
    width: .5
  })
}

export default MTAddCut