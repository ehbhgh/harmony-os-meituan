import { foodsInterfaceModel } from "../../models"
import MTAddCut from "./MTAddCut"

@Component
struct MTFoodItem {
  @Prop
  foodItem: foodsInterfaceModel

  build() {
    Row() {
      Image(this.foodItem.picture)
        .width(90)
        .aspectRatio(1)
      Column({ space: 5 }) {
        Text(this.foodItem.name)
          .textOverflow({
            overflow: TextOverflow.Ellipsis,
          })
          .maxLines(2)
          .fontWeight(600)
        Text(this.foodItem.description)
          .textOverflow({
            overflow: TextOverflow.Ellipsis,
          })
          .maxLines(1)
          .fontSize(12)
          .fontColor($r("app.color.food_item_second_color"))
        Row({space:10}) {
          ForEach(this.foodItem.food_tag_list, (item:string) => {
            Text(item)
              .fontSize(10)
              .backgroundColor($r("app.color.food_item_label_color"))
              .fontColor($r("app.color.font_main_color"))
              .padding({
                top: 2,
                bottom: 2,
                right: 5,
                left: 5
              })
              .borderRadius(2)
          })
        }

        Text() {
          Span(`月销售${this.foodItem.month_sales}`)
          Span(' ')
          Span(this.foodItem.like_ratio_desc)
        }
        .fontSize(12)
        .fontColor($r("app.color.black"))

        Row() {
          Text() {
            Span('¥ ')
              .fontColor($r("app.color.font_main_color"))
              .fontSize(10)
            Span(this.foodItem.price+"")
              .fontColor($r("app.color.font_main_color"))
              .fontWeight(FontWeight.Bold)
          }
          MTAddCut({foodItem:this.foodItem})
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 10, right: 10 })
    }
    .padding(10)
    .alignItems(VerticalAlign.Top)
  }
}

export default MTFoodItem