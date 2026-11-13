# libjblw

JVM class 文件运行时面（注解、常量池、类型、指令、模拟执行）的 C++
建模库，命名空间 `jblw`。源自对 `dev.xdark.blw` 的 C++ 重写与收敛：
class/annotation/code 模型 + generic builders 构建面，`BytecodeLibrary`
完成 class 字节 ↔ 模型的读写往返（写出重建常量池并计算 stack-map frames）。

## 构建

依赖 libjbytecode 与 libca（luiox-repo git 直连包）。

```sh
xmake repo --add luiox-repo https://github.com/luiox/luiox-repo.git
xmake f
xmake build libjblw
```

## License

MIT，见 [LICENSE](LICENSE)。
