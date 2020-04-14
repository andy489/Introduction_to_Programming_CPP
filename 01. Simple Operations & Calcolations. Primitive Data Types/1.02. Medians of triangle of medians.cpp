// github.com/andy489

#include <iostream>
#include <cmath>
#include <iomanip>

double medianLen(double a, double b, double c) {
    return (1.0 / 2) * sqrt(2 * pow(c, 2) + 2 * pow(b, 2) - pow(a, 2));
}

int main() {
    double a, b, c;
    std::cout << "Enter valid sides a,b,c of a triangle:\n";
    std::cin >> a >> b >> c;

    double m_A = medianLen(a, b, c),
            m_B = medianLen(b, c, a),
            m_C = medianLen(c, a, b);

    double m_a = medianLen(m_A, m_B, m_C),
            m_b = medianLen(m_B, m_C, m_A),
            m_c = medianLen(m_C, m_A, m_B);

    std::cout << std::fixed << std::setprecision(2) << m_a << "\n" << m_b << "\n" << m_c << "\n";
}
