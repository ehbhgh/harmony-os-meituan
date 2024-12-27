const fs = require('fs');
const path = require('path');

// 获取文件夹下的所有文件名（递归）
function getAllFiles(folderPath, filesArray = []) {
  try {
    const files = fs.readdirSync(folderPath); // 读取文件夹内容
    files.forEach(file => {
      const filePath = path.join(folderPath, file);
      const stat = fs.statSync(filePath); // 获取文件信息

      if (stat.isFile()) {
        const result = filePath.replace(new RegExp(`^${('D:\\code\\serve\\static\\img\\').replace(/\\/g, '\\\\')}`), '')
        filesArray.push(result); // 如果是文件，加入数组
      } else if (stat.isDirectory()) {
        getAllFiles(filePath, filesArray); // 如果是文件夹，递归调用
      }
    });
  } catch (err) {
    console.error('读取文件夹失败:', err);
  }

  return filesArray;
}

// 使用示例
const folderPath = path.resolve(__dirname, './static/img');
const allFiles = getAllFiles(folderPath);
console.log('所有文件列表:', allFiles);
