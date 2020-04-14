// github.com/andy489

#include <iostream>
#include <iomanip>

int main() {
    size_t hExam, mExam, hArr, mArr;
    std::cin >> hExam >> mExam >> hArr >> mArr;

    size_t totalMinExam = hExam * 60 + mExam,
            totalMinArr = hArr * 60 + mArr;

    int diff = totalMinExam - totalMinArr;

    if (diff < 0) {
        std::cout << "Late" << std::endl;
        if (abs(diff) < 60)
            std::cout << -diff << " minutes after the start" << std::endl;
        else {
            std::cout << -diff / 60 << ':';
            std::cout << std::setw(2) << std::setfill('0') << -diff % 60 << " hours after the start";
        }
    } else if (totalMinExam - totalMinArr <= 30) {
        std::cout << "On time" << std::endl;
        if (diff == 0)
            return 0;
        std::cout << diff << " minutes before the start";
    } else if (diff > 0) {
        std::cout << "Early" << std::endl;
        if (diff >= 60) {
            std::cout << diff / 60 << ':';
            std::cout << std::setw(2) << std::setfill('0') << diff % 60 << " hours before the start";
        } else std::cout << diff << " minutes before the start" << std::endl;
    }
    return 0;
}
