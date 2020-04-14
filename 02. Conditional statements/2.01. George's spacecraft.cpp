// github.com/andy489

#include <iostream>

int main() {
    double width, length, height, astroHeight;
    std::cin >> width >> length >> height >> astroHeight;

    double shipVolume = width * length * height,
            astroRoom = 2 * 2 * (astroHeight + 0.4);

    size_t astroCount = (size_t) (shipVolume / astroRoom);

    if (astroCount >= 3 && astroCount < 10) 
        std::cout << "The spacecraft holds " << astroCount << " astronauts.";
    else if (astroCount < 3) 
        std::cout << "The spacecraft is too small.";
    else 
        std::cout << "The spacecraft is too big.";
    return 0;
}
