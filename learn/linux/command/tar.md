#2016-11-20
##tar命令
####tar：可以用来打包解包文件  
格式：**tar [option...] [file]...**

示例：  
1. **`tar cvf demo.tar demo_directory`  **
>将demo_directory目录下的所有文件打包成demo.tar  
demo.tar结构：demo.tar/demo_directory/...  

2.**`tar xvf demo.tar [-C path]`**  
> demo.tar解包到当前目录下，即将demo.tar包中的demo_directory目录结构解析出来  
> -C path 解包到指定路径，省略时，解包到当前路径
