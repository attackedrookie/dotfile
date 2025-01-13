 #!/bin/bash
 
SCRIPT_FILE=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_FILE")

 files=$(ls -a $SCRIPT_DIR | grep -E '.[^.]+' |grep -v .git)
 # 去掉 ls -a 返回结果中的 ". .. .git"
 for file in `echo $files`; do
     rm -f ~/$file
     ln -s $SCRIPT_DIR/$file ~/$file # 创建软链接
 done
 
 # .tmux.conf 使用tmux source-file运行
 # .vimrc 在vim编辑器再次打开的时候自动生效
 # .bashrc 使用source运行
