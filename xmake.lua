-- libjblw：JVM class 文件注解/类型/指令的只读建模库（独立构建根）。
--
-- 依赖：
--   - libjbytecode（luiox-repo git 直连包）：字节码核心面。
--   - libca（luiox-repo git 直连包）：tag_cast 等基础面。
--
-- 仓库注册：本文件不声明 add_repositories——包沙箱会继承宿主的仓库注册，
-- 在工程内重复注册同名仓库会导致嵌套包构建时 remote 路径错乱。独立开发/CI
-- 先执行：
--   xmake repo --add luiox-repo https://github.com/luiox/luiox-repo.git

set_languages("cxx17")
add_rules("mode.debug", "mode.release")

add_requires("libjbytecode 0.0.2")
add_requires("libca 0.0.15", {configs = {modules = "core"}})

option("with_tests")
    set_default(false)
    set_showmenu(true)
    set_description("Enable unit tests (pulls gtest)")
option_end()

target("libjblw")
    set_kind("static")
    add_packages("libjbytecode", {public = true})
    add_packages("libca")
    add_includedirs("src", {public = true})
    add_files("src/jblw/**.cpp")
    add_headerfiles("src/(jblw/**.hpp)")
    if is_plat("windows") then
        add_cxflags("/utf-8", {tools = "cl"})
    end
