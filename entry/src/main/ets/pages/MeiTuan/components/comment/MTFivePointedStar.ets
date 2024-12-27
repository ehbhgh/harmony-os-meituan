@Preview
@Component
struct MTFivePointedStar {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State starCount: number = 5; // 星星数量
  @Prop starSize: number = 20; // 星星大小
  @Prop starSpacing: number = 10; // 星星间距
  @Prop score: number = 0.8; // 当前评分值
  @Prop starAreaHeight: number | string
  @Prop starAreaWidth: number  | string
  // 绘制五角星的方法
  drawStar(context: CanvasRenderingContext2D, x: number, y: number, size: number, filled: number) {
    const path = new Path2D();
    const angle = Math.PI / 5;
    for (let i = 0; i < 10; i++) {
      const r = i % 2 === 0 ? size : size / 2;
      const offsetX = x + r * Math.sin(i * angle);
      const offsetY = y - r * Math.cos(i * angle);
      if (i === 0) {
        path.moveTo(offsetX, offsetY);
      } else {
        path.lineTo(offsetX, offsetY);
      }
    }
    path.closePath();

    if (filled >= 1) {
      context.fillStyle = '#FDCD4D'; // 完全填充为黄色
      context.fill(path);
    } else if (filled > 0) {
      context.fillStyle = '#CFD5CF'; // 背景为灰色
      context.fill(path);
      context.clip(path);
      context.fillStyle = '#FDCD4D';
      context.fillRect(x - size, y - size, size * 2 * filled, size * 2); // 部分填充
    } else {
      context.fillStyle = '#CFD5CF'; // 未填充为灰色
      context.fill(path);
    }
  }

  // 绘制所有的星星
  drawStars() {
    const canvasWidth = this.context.width;
    const startX = (canvasWidth - (this.starCount * this.starSize + (this.starCount - 1) * this.starSpacing)) / 2;
    const centerY = this.context.height / 2;

    for (let i = 0; i < this.starCount; i++) {
      const x = startX + i * (this.starSize + this.starSpacing);
      const filled = Math.max(0, Math.min(1, this.score - i)); // 计算每颗星的填充程度
      this.drawStar(this.context, x, centerY, this.starSize / 2, filled);
    }
  }

  build() {
    Column() {
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .onReady(() => {
          this.drawStars(); // 初始化绘制星星
        })
    }
    .width(this.starAreaWidth).height(this.starAreaHeight)
  }
}

export  default MTFivePointedStar