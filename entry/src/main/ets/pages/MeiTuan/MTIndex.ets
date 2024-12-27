import { MTMain, MTCart, MTBottom, MTComment } from './components'
import { CartStore } from "./utils"
import { tabInterface, tabInterfaceModel, foodsInterfaceModel } from "./models"
import { getMenu } from "./api"

@Entry
@Component
struct MTIndex {
  @State currentIndex: number = 0
  @State tabList: Array<tabInterface> = []
  @Provide showCart: boolean = false
  @Provide shoppingCart: Array<foodsInterfaceModel> = []

  @Builder
  getTabBarBuilder(item: tabInterfaceModel, index: number) {
    Column() {
      if (item.subTitle !== "input") {
        Text() {
          if (item.subTitle === "pingJia" && item.num != null) {
            Span(item.title)
              .fontSize(12)
              .fontColor(this.currentIndex === index ? $r("app.color.black") : $r("app.color.un_select_color"))
            Span(item.num + "")
              .fontSize(10)
              .fontColor(this.currentIndex === index ? $r("app.color.black") : $r("app.color.un_select_color"))
              .margin({
                left: 5
              })
          } else {
            Span(item.title)
              .fontSize(12)
              .fontColor(this.currentIndex === index ? $r("app.color.black") : $r("app.color.un_select_color"))
          }
        }.onClick(() => {
          this.currentIndex = index
        })
        .height(30)

        Stack({ alignContent: Alignment.Center }) {
          Divider().color("#F5F5F5").strokeWidth(2)
          Divider()
            .strokeWidth(2)
            .color($r("app.color.select_border_color"))
            .opacity(this.currentIndex === index ? 1 : 0)
            .margin({
              top: 5
            })
            .width(30)
            .zIndex(2)
            .position({ top: -3, left: 30 })
        }
      } else {
        Stack({ alignContent: Alignment.Start }) {
          TextInput().width("100%").backgroundColor("#EEEEEE").height(25).fontSize(10)
          Image($r('app.media.iot_public_search'))
            .width(14)
            .aspectRatio(1)
            .fillColor($r("app.color.search_font_color")).margin({ left: 5 })
        }.padding({
          right: 10,
          left: 10
        }).width(100)

        Stack({ alignContent: Alignment.Center }) {
          Divider().color("#F5F5F5").strokeWidth(2).margin({
            top: 8
          })

        }
      }
    }.width("100%")

  }

  aboutToAppear(): void {
    this.getMenuCate()
    this.updateCart()
  }

  updateCart() {
    getContext().eventHub.on("change_cart", () => {
      this.shoppingCart = CartStore.getCarts()
    })

  }

  async getMenuCate() {
    const res = await getMenu()
    this.tabList = res.data
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        Row() {
          Stack({ alignContent: Alignment.End }) {
            Tabs({ index: $$this.currentIndex }) {
              ForEach(this.tabList, (item: tabInterfaceModel, index: number) => {
                TabContent() {
                  if (item.subTitle == "dianCai") {
                    MTMain()
                  } else if (item.subTitle == "pingJia") {
                    MTComment()
                  } else {
                    MTMain()
                  }
                }.tabBar(this.getTabBarBuilder(item, index))
              })
            }.barPosition(BarPosition.Start)

          }
        }.height("100%").justifyContent(FlexAlign.SpaceBetween).width("100%")


        if (this.showCart) {
          MTCart()
        }
        if (this.currentIndex === 0) {
          MTBottom()
        }

      }.layoutWeight(1).width("100%")
    }
    .width('100%')
    .height("100%")
    .backgroundColor($r("app.color.white"))
  }
}