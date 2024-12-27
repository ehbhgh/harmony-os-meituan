import { foodsInterfaceModel } from "../../models"

@Component
export struct MTBottom {
  @Consume showCart: boolean
  @Consume
  @Watch("total")
  shoppingCart: Array<foodsInterfaceModel>
  @State totalPrice: string = "0.00"
  @State totalNum: string = ""

  total() {
    const totalPrice = this.shoppingCart.reduce((sum: number, item: foodsInterfaceModel) => {
      return sum + Number(item.price) * Number(item.count)
    }, 0)
    const totalNum = this.shoppingCart.reduce((sum: number, item: foodsInterfaceModel) => {
      return sum + Number(item.count)
    }, 0)
    this.totalPrice = totalPrice.toString()
    this.totalNum = totalNum.toString()
  }

  build() {
    Row() {
      Row() {
        Badge({
          value: this.totalNum, position: BadgePosition.Right, style: {
            badgeSize: 18
          }
        }) {
          Image($r("app.media.iot_public_cart")).width(47).height(69).position({
            y: -20
          })
        }.margin({
          left: 25,
          right: 10
        }).onClick(() => {
          this.showCart = !this.showCart
        })

        Column() {
          Text() {
            Span("￥").fontSize(12)
            Span(this.totalPrice).fontSize(24)
          }.fontColor($r("app.color.white"))

          Text("预估另需配送费￥5元").fontColor($r("app.color.search_font_color")).fontSize(14)
        }.alignItems(HorizontalAlign.Start).layoutWeight(1)

        Text("去结算")
          .height(50)
          .width(100)
          .backgroundColor($r("app.color.main_color"))
          .textAlign(TextAlign.Center)
          .borderRadius({
            topRight: 25,
            bottomRight: 25
          })
      }.width("100%").height(50).backgroundColor($r("app.color.bottom_back")).borderRadius(25)
    }.width("100%").padding({
      left: 20,
      right: 20,
      bottom: 20
    })
  }
}

