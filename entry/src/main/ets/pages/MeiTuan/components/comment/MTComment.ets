import MTFivePointedStar from "./MTFivePointedStar"

@Component
export struct MTComment {
  @State score:number=4.7
  build() {
    Column() {
      Row() {
        Row(){
          Text(this.score+"").fontSize(24).fontColor("#DF9439").width(40)
          Column({space:3}){
            Text("商家评分").width("100%").fontSize(12).fontColor("#8F8F8F")
            MTFivePointedStar({
              starSize:12,
              starSpacing:3,
              score:this.score,
              starAreaHeight:30,
              starAreaWidth:"100%"
            })

          }.layoutWeight(1)
        }.height("100%").width(120)
        Column({space:10}){
          Text("口味").fontColor("#8F8F8F").fontSize(12)
          Text("4.6").fontColor($r("app.color.black")).fontSize(12)
        }.width(50).height("100%").padding({
          top:8
        })
        Column({space:10}){
          Text("包装").fontColor("#8F8F8F").fontSize(12)
          Text("4.7").fontColor($r("app.color.black")).fontSize(12)
        }.width(50).height("100%").padding({
          top:8
        })
        Column({space:10}){
          Text("配送包装满意度").fontColor("#8F8F8F").fontSize(12).width("100%").textAlign(TextAlign.Start)
          Text("100%").fontColor($r("app.color.black")).fontSize(12).width("100%").textAlign(TextAlign.Start)
        }.layoutWeight(1).justifyContent(FlexAlign.Start).margin({
          left:20
        }).height("100%").padding({
          top:8
        })
      }.width("100%").height(60).padding({
        left:20,
        right:20
      }).justifyContent(FlexAlign.SpaceBetween).backgroundColor($r("app.color.white"))

      Column() {
        // Text("评论内容")
      }
    }.width("100%").height("100%").backgroundColor("#F5F5F5")
  }
}