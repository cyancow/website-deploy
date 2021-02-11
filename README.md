# website-deploy

## 简介

我的个人网站部署在 k8s，本仓库分享部署相关的脚本、yaml 以及 Dockerfile，网站地址: https://imroc.io

## 特点

* http 自动跳转 https
* https 证书自动续期并 reload
* 网站纯静态，多子目录，静态文件使用 hugo 构建，分散在多个 repo
* 自动拉取最新静态内容
* 无需挂载额外付费的持久化存储