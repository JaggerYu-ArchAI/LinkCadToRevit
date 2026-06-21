# LinkCadToRevit

将 CAD 图元批量转换为 Revit 模型的 Dynamo 工具集。

## 功能概述

本工具集包含四个 Dynamo 脚本，可从链接的 CAD 文件中批量提取数据并生成相应的 Revit 模型元素：

- **1-批量生成墙体.dyn** - 从 CAD 楼层平面图批量生成墙体
- **2-批量生成门窗.dyn** - 从 CAD 图纸批量生成门窗
- **3-批量生成结构柱.dyn** - 从 CAD 结构图纸批量生成结构柱
- **4-批量生成结构梁.dyn** - 从 CAD 结构图纸批量生成结构梁

## 系统要求

- **Revit**: 2024 或更高版本
- **Dynamo**: 2.17 或更高版本
- **依赖包**: bimorphNodes 4.2.4

## 安装步骤

### 第一步：安装依赖节点包

将 `依赖节点包/bimorphNodes` 文件夹复制到 Dynamo 第三方包路径：

```
C:\Users\你的用户名\AppData\Roaming\Dynamo\Dynamo Revit\2.17\packages\
```

### 第二步：打开测试文件

打开 `测试文件与说明/CADToRevit.rvt` 文件进行测试。该文件包含完整的 CAD-Revit 转换标准说明。

### 第三步：使用 Dynamo 播放器运行脚本

1. 将 `LinkCadToRevit_Dyn` 文件夹添加到 Dynamo 播放器的搜索路径
2. 打开 Dynamo 播放器，选择相应的脚本进行测试

## 项目结构

```
LinkCadToRevit/
├── LinkCadToRevit_Dyn/           # Dynamo 脚本
│   ├── 1-批量生成墙体.dyn
│   ├── 2-批量生成门窗.dyn
│   ├── 3-批量生成结构柱.dyn
│   └── 4-批量生成结构梁.dyn
├── 依赖节点包/
│   └── bimorphNodes/             # CAD 处理依赖包
└── 测试文件与说明/
    ├── CADToRevit.rvt            # 测试用 Revit 文件
    ├── 建筑-墙体-门窗_t3.dwg      # 建筑 CAD 测试文件
    ├── 结构-柱_t3.dwg            # 结构柱 CAD 测试文件
    ├── 结构-梁_t3.dwg            # 结构梁 CAD 测试文件
    └── 重要使用说明！！/
        ├── LinkCadToRevit使用说明.docx  # 详细使用说明
        └── MarkInsertPt.lsp       # CAD 标注点插件
```

## 使用说明

1. 在 Revit 中链接 CAD 文件（使用"插入"选项卡 → "链接 CAD"）
2. 运行相应的 Dynamo 脚本
3. 在脚本中选择链接的 CAD 作为输入
4. 选择目标标高和其他参数
5. 执行脚本生成 Revit 元素

## 注意事项

- bimorphNodes 包是本工具集的必要依赖，必须先安装
- 测试环境为 Revit 2024
- 建议先使用提供的测试文件进行验证
