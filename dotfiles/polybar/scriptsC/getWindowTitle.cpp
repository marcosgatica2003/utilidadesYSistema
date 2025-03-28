#include <exception>
#include <iostream>
#include <memory.h>
#include <memory>
#include <stdexcept>
#include <string>
#include <array>
#include <cstdio>

std::string exec(const char* cmd) {
    std::array<char, 128> buffer;
    std::string result;
    std::unique_ptr<FILE, int(*)(FILE*)> pipe(popen(cmd, "r"), pclose);

    if (!pipe) { throw std::runtime_error("Error al ejecutar"); }

    while (fgets(buffer.data(), buffer.size(), pipe.get())) { result += buffer.data(); }

    return result;
}

std::string getFocusedWindowTitle() {
    std::string title = exec("xdotool getwindowfocus getwindowname");
    if (!title.empty() && title.back() == '\n') { title.pop_back(); }
    return title;
}

int main()  {
    try {
        std::string title = getFocusedWindowTitle();
        (!title.empty()) ? 
            std::cout << " " << title << std::endl :
            std::cout << " " << std::endl;
    } catch (const std::exception& e) {
        std::cerr << "Error:\t" << e.what() << std::endl;
        return 1;    
    }

    return 0;
}


