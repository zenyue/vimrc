# vimrc
## 安装vim-plug
linux下
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

windows下
```
curl -fLo %USERPROFILE%/vimfiles/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

注：安装 vim-plug 需要先安装git

## 下载vimrc
```
git clone https://github.com/zenyue/vimrc.git ~/vimrc
ln -s ~/vimrc/.vimrc ~/.vimrc
```
或者
```
wget https://raw.githubusercontent.com/zenyue/vimrc/master/.vimrc ~/.vimrc
```

## 安装插件
启动 vim 后，输入
```
:PlugInstall
```
