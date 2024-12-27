@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Image("http://localhost:3100/img/00005酱爆金钱肚.jpg").width(200).height(200)
      }.width("100%")
    }.height("100%")
  }
}