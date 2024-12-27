const fs = require("fs");
const { promisify } = require("util");
const readFile = promisify(fs.readFile);
const writeFile = promisify(fs.writeFile);
const { v4: uuidv4 } = require('uuid');

// 生成一个新的 UUID
function getRandomNumberString(length) {
    let result = '';
    for (let i = 0; i < length; i++) {
      result += Math.floor(Math.random() * 10); // 每次生成一个 0-9 的数字
    }
    return result;
  }
  
function generateRandomPerson(index) {
    const names = [
        '00005酱爆金钱肚',
        '00014酱彩椒炒鱼线',
        '00016酱脆角掌中宝',
        '00018酱韭菜爆炒河虾仔',
        '00022珍菌牛柳',
        '00031八宝辣子掌中宝',
        '00033八宝南瓜',
        '00036八宝茄丁',
        '00045巴蜀毛血旺',
        '00046巴蜀烧四样',
        '00054霸王蛇',
        '00060白菇烧裙边',
        '00062白果一品豆腐',
        '00064白椒炒鹅肠',
        '00075白辣椒炒鸡胗',
        '00077白丽爆牛蛙',
        '00107板栗爆腰花',
        '00116板栗子叉烧肉',
        '00117板粟烧鹿筋',
        '00136鲍汁茶树菇',
        '00137鲍汁海皇南瓜盅',
        '00138鲍汁烘肘子',
        '100浏阳炒脆骨',
        '108麻婆海参',
        '110干锅苗家豆腐',
        '120橄榄菜杂菌炒豆角',
        '134旗花面',
        '137炝浆水菜',
        '146赛鲍仔',
        '153砂窝四季豆',
        '156砂窝西葫芦',
        '27带皮羊筋',
        '35孜然马面鱼',
        '43葱炒宜君豆腐',
        '54霸王蛇',
        '58古汉养生鸡',
        '79久久醋滑肉',
        '87开胃酱香肉',
        '92腊味合蒸',
        '97老四川肺片',
        '99凉拌金针菇'
    ]; // 可选的名字
    const dishDescriptions = [
        "这道菜色香味俱全，入口即化，令人回味无穷。",
        "精心挑选新鲜食材，搭配独特酱料，风味一绝。",
        "制作工艺精湛，口感层次丰富，带来味觉盛宴。",
        "选用上等原料，加入秘制调料，鲜香四溢。",
        "酥脆外皮包裹鲜嫩内馅，一口咬下，满是惊喜。",
        "经典风味与创新技法结合，散发浓郁香气。",
        "采用慢火精炖，汤汁浓郁，滋味醇厚。",
        "色泽诱人，入口柔嫩，口感细腻爽滑。",
        "鲜美的食材与独特的调味相得益彰，韵味悠长。",
        "清新淡雅，保留了食材的原汁原味。",
        "外观精美，香气扑鼻，是视觉与味觉的双重享受。",
        "鲜嫩多汁，伴随淡淡的香料味，让人食欲大增。",
        "外酥里嫩，搭配秘制酱料，风味独特。",
        "秘方腌制，入口即融，余味绕舌。",
        "低温烹制，保留营养，呈现极致鲜美。",
        "选用绿色健康食材，口感鲜香，回味悠长。",
        "鲜嫩的肉质与爽脆的蔬菜完美结合，风味十足。",
        "色泽金黄，酥脆香浓，是不可错过的佳肴。",
        "酸甜适中，辣而不燥，层次分明，百吃不腻。",
        "手工制作，原汁原味，每一口都是匠心所在。",
        "浓郁的香气扑面而来，带来无与伦比的享受。",
        "汤汁浓稠，肉质鲜嫩，散发迷人的香气。",
        "精选上等海鲜，经过精心烹制，鲜香可口。",
        "外层微焦，内里柔嫩，香味在口中久久不散。",
        "独家秘制酱料，浓郁鲜香，尽显舌尖诱惑。",
        "色香味俱佳，搭配细腻的调料，堪称美味佳肴。",
        "每一口都能感受到食材的精华与大厨的用心。",
        "调味恰到好处，鲜而不腻，香而不燥。",
        "外表精致，口感独特，是一道让人流连忘返的美食。",
        "汤汁鲜美，搭配软嫩的肉质，令人赞不绝口。",
        "香辣可口，鲜嫩多汁，吃完仍唇齿留香。",
        "创新与传统结合，风味独树一帜，独具匠心。",
        "酸辣开胃，香脆适口，是一道不可多得的美味。",
        "肉质鲜嫩，香料浓郁，带来极致的味蕾体验。",
        "滑嫩与酥脆并存，带来丰富的口感享受。",
        "经过长时间慢炖，汤汁浓厚，入口香醇。",
        "精选农家有机蔬菜，搭配健康烹饪方式，原汁原味。",
        "秘制香料点缀，赋予这道菜与众不同的魅力。",
        "咸甜交织，层次丰富，带来别具一格的美味享受。",
        "独特风味与精湛手艺碰撞，诠释了美食的极致魅力。"
    ];

    const tagList = [
        ["点评网友推荐", "新店优惠88折"],
        ["拼好饭商户"],
        ["店内多人复购"],
        ["非常下饭"],
        ["回头客推荐"],
        ["干净卫生"]

    ]

    // 返回对象
    return {
        foodId: (Math.floor(Math.random() * 3) + 1).toString(),
        id: uuidv4(),
        name: names[index].replace(/\d+/g, ''),
        like_ratio_desc: "好评度" + Math.floor(Math.random() * 101) + "%",
        month_sales: Math.floor(Math.random() * (1000 - 20 + 1)) + 20,
        unit:Math.floor(Math.random() * 16) + 5+"份",
        food_tag_list: tagList[Math.floor(Math.random() * 6)],
        price:Math.floor(Math.random() * 79) + 22,
        picture:"http://localhost:3100/img/"+names[index]+'.jpg',
        description:dishDescriptions[index],
        tag:getRandomNumberString(9),
        count:Math.floor(Math.random() * 50) + 1

    };
}
process.nextTick(async () => {
    //   let res = await readFile("./index.json", "utf-8");
    let json = {
        formList: []
    }
    for (let i = 0; i < 40; i++) {
        json.formList.push(generateRandomPerson(i));
    }
    await writeFile("./db/index.json", JSON.stringify(json), "utf-8");
    console.log("写入成功");
});