project "imgui"
    kind "StaticLib"
    language "C++"
    
    targetdir(libpath)
    objdir(objpath .. "/imgui")

    libdirs
    {
        libpath,
    }
    links
    {
        "GLFW",
        "opengl32.lib",
    }
    includedirs
    {
        "./", 
        "backends",
        "%{includepaths.GLFW}",
    }
    files
    {
        "*.h",
        "*.cpp",
        "backends/imgui_impl_opengl3.cpp",
        "backends/imgui_impl_opengl3.h",
        "backends/imgui_impl_opengl3_loader.h",
        "backends/imgui_impl_glfw.cpp",
        "backends/imgui_impl_glfw.h",
    }
    
	filter "system:windows"
        staticruntime "On"
        cppdialect "C++20"

	filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"