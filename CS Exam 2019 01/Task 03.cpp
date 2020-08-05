#define _USE_MATH_DEFINES

#include <iostream>
#include <cmath>
#include <cstring>
#include <climits>

struct Planet {
    double x;
    double y;
    double z;
    double d;
    bool life;
    char name[20];

    Planet();

    Planet(double x, double y, double z, double d, bool life, char name[20]);
};

void printPlanet(Planet p[]);

void printPlanets(Planet planets[], unsigned n);

Planet findPlanet(Planet planets[], unsigned n, char type);

double getDistanceToStar(Planet p[]);

double getVolume(Planet p[]);

int main() {
    char planet1[20] = "Earth";
    Planet *Earth = new Planet(2, 2, 2, 500, 0, planet1);

    char planet2[20] = "Uranus";
    Planet *Uranus = new Planet(8, 10, 9, 25, 0, planet2);

    char planet3[20] = "Mars";
    Planet *Mars = new Planet(3, 4, 8, 400, 0, planet3);

    char planet4[20] = "Jupiter";
    Planet *Jupiter = new Planet(22, 14, 18, 350, 0, planet4);

    char planet5[20] = "Saturn";
    Planet *Saturn = new Planet(6, 15, 10, 175, 0, planet5);

    Planet *planets = new Planet[5];

    planets[0] = *Earth;
    planets[1] = *Uranus;
    planets[2] = *Mars;
    planets[3] = *Jupiter;
    planets[4] = *Saturn;

    printPlanets(planets, 5);

    std::cout << "\nClosest to the Star planet is: ";
    printPlanet(&findPlanet(planets, 5, 's'));
    std::cout << "\nSmallest planet (with life) is: ";
    printPlanet(&findPlanet(planets, 5, 'd'));
    std::cout << "\nPlanet with middle volume is: ";
    printPlanet(&findPlanet(planets, 5, 'v'));
    return 0;
}

Planet::Planet() {
    this->x = 0;
    this->y = 0;
    this->z = 0;
    this->d = 0;
    this->life = false;
    char name[] = "default";
    size_t len = sizeof(name) / sizeof(name[0]) + 1;
    strcpy_s(this->name, len, name);
}

Planet::Planet(double x, double y, double z, double d, bool life, char name[20]) {
    this->x = x;
    this->y = y;
    this->z = z;
    this->d = d;
    this->life = life;
    size_t len = strlen(name) + 1;
    strcpy_s(this->name, len, name);
}

void printPlanet(Planet p[]) {
    std::cout << p->name << " with coordinates (" << p->x << ", " << p->y << ", " << p->z
              << "), diameter " << p->d << " and ";
    (p->life) ? std::cout << "life existence." : std::cout << "no life existence.";
    std::cout << std::endl;
}

void printPlanets(Planet planets[], unsigned n) {
    for (size_t i = 0; i < n; i++) printPlanet(&planets[i]);
}

Planet findPlanet(Planet planets[], unsigned n, char type) {
    if (type == 's') {
        double minDistance = DBL_MAX;
        Planet *closestPlanet = nullptr;
        for (size_t i = 0; i < n; i++) {
            if (getDistanceToStar(&planets[i]) < minDistance) {
                minDistance = getDistanceToStar(&planets[i]);
                closestPlanet = &planets[i];
            }
        }
        return *closestPlanet;
    } else if (type == 'd') {
        double minDiameter = DBL_MAX;
        Planet *smallestPlanet = nullptr;
        double minDiameterWithLife = DBL_MAX;
        Planet *smallestPlanetWithLife = nullptr;
        for (size_t i = 0; i < n; i++) {
            if (planets[i].d < minDiameter) {
                minDiameter = planets[i].d;
                smallestPlanet = &planets[i];
            }
            if (planets[i].d < minDiameterWithLife && planets[i].life == true) {
                minDiameterWithLife = planets[i].d;
                smallestPlanetWithLife = &planets[i];
            }
        }
        if (smallestPlanetWithLife) return *smallestPlanetWithLife;
        else return *smallestPlanet;
    } else {
        double sumVol = 0;
        for (size_t i = 0; i < n; i++) sumVol += getVolume(&planets[i]);
        double minDiff = DBL_MAX;
        Planet *middleVolPlanet = nullptr;
        double averageVol = sumVol / n;
        for (size_t i = 0; i < n; i++) {
            if (abs(averageVol - getVolume(&planets[i])) < minDiff) {
                minDiff = abs(averageVol - getVolume(&planets[i]));
                middleVolPlanet = &planets[i];
            }
        }
        return *middleVolPlanet;
    }
}

double getDistanceToStar(Planet p[]) {
    double vecLen = sqrt(pow(p->x, 2) + pow(p->y, 2) + pow(p->z, 2));
    return vecLen;
}

double getVolume(Planet p[]) {
    return (4.0 * M_PI / 3.0) * pow(p->d / 2.0, 2);
}
