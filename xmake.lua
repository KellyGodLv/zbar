

target("ZBar")
    set_kind("static")

    before_build(function(target)
        local script_file=path.join(os.scriptdir(), "libiconv/","xmake.lua")
        if os.isfile(script_file) == false then
            import("net.http")
            import("devel.git")

            local old_dir=os.cd(os.scriptdir())
            git.clone("https://github.com/KellyGodLv/libiconv.git")
            os.cd(old_dir)
        end
    end)
    local script_dir=path.join(os.scriptdir(), "libiconv/" , "xmake.lua")

    if os.isfile(script_dir) == true then
        add_subdirs(script_dir)
       
    end
     add_deps("libiconv") 
    add_cflags("wchar_t")
    add_defines("ZBAR64_EXPORTS","_CRT_SECURE_NO_WARNINGS")
    add_cflags("/std:c++latest")

    
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
    after_build(function (target) 
        local dir=path.join(os.scriptdir(), "include/*")
        os.cp(dir,"$(buildir)")
    end)
    --add_headers("include/**.h")
target_end()