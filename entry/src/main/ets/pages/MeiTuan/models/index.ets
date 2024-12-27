export interface tabInterface {
  title: string
  subTitle: string
  status: boolean
  num: number | null
}

export interface tabInterfaceResponse{
  code:number,
  msg:string
  data:tabInterface[]
}
export interface  foodCategory{
  foodId:string
  foodCategory:string
}
export interface foodCategoryResponse{
  code:number,
  msg:string
  data:foodCategory[]
}
export interface foodsInterface{
  id:string;
  name:string;
  foodId:string;
  like_ratio_desc:string
  month_sales:number
  unit:string
  food_tag_list:string[]
  price:string
  picture:ResourceStr
  description:string
  tag:string
  count:number
}
export interface foodsInterfaceResponse{
  code:number,
  msg:string
  data:foodsInterface[]
}
export class tabInterfaceModel implements tabInterface {
  title: string = ''
  subTitle: string = ''
  status: boolean = false
  num: number | null = null

  constructor(model: tabInterface) {
    this.title = model.title
    this.subTitle = model.subTitle
    this.status = model.status
    this.num = model.num
  }
}
export class foodCategoryModel implements foodCategory {
  foodId: string = ''
  foodCategory: string = ''

  constructor(model: foodCategory) {
    this.foodId = model.foodId
    this.foodCategory = model.foodCategory
  }
}
export class foodsInterfaceModel implements foodsInterface {
  id: string = ''
  name: string = ''
  foodId: string = ''
  like_ratio_desc: string = ''
  month_sales: number = 0
  unit: string = ''
  food_tag_list: string[] = []
  price: string = ''
  picture: ResourceStr = ''
  description: string = ''
  tag: string = ''
  count: number = 0

  constructor(model: foodsInterface) {
    this.id = model.id
    this.name = model.name
    this.foodId = model.foodId
    this.like_ratio_desc = model.like_ratio_desc
    this.month_sales = model.month_sales
    this.unit = model.unit
    this.food_tag_list = model.food_tag_list
    this.price = model.price
    this.picture = model.picture
    this.description = model.description
    this.tag = model.tag
    this.count = model.count
  }
}

