

target("ZBar")
    set_kind("static")

    before_build(function(target)
        if os.isfile("libiconv/xmake.lua") == false then
            import("net.http")
            import("devel.git")
            git.clone("https://github.com/KellyGodLv/libiconv.git")
            
        end
    end)

    add_subdirs("libiconv")
    add_deps("libiconv")    
    add_defines("ZBAR64_EXPORTS")

    if is_plat("windows") then
        add_cxxflags("/EHsc")
        add_defines("_CRT_SECURE_NO_WARNINGS")
    end
    
    add_includedirs("include","zbar","zbar/decoder","zbar/qrcode")

    add_files("zbar/**.c")
    -- add_files("zbar/config.c")

    -- add_files("zbar/convert.c")
    -- add_files("zbar/decoder.c")
    -- add_files("zbar/decoder/**.c")

    -- add_files("zbar/symbol.c")
    -- add_files("zbar/scanner.c")
    -- add_files("zbar/refcnt.c")
    -- add_files("zbar/processor.c")
    -- add_files("zbar/img_scanner.c")
    -- add_files("zbar/image.c")
    -- add_files("zbar/error.c")

    -- add_files("zbar/qrcode/**.c")
    -- add_files("zbar/processor/lock.c")
    -- add_files("zbar/processor/win.c")

    add_headers("include/**.h")
target_end()