// github.com/andy489

#include <iostream>
#include <string>

using namespace std;

void swap(string &a, string &b) {
    string temp = a;
    a = b;
    b = temp;
}

size_t getRank(string card) {
    size_t rank;
    if (card[2] != '\0')
        rank = (card[1] - '0') * 10 + (card[2] - '0');
    else
        rank = card[1] - '0';
    return rank;
}

void sort2(string &card1, string &card2) {
    size_t rank1 = getRank(card1),
            rank2 = getRank(card2);
    if (rank1 < rank2)
        swap(card1, card2);
}

void sort3(string &card1, string &card2, string &card3) {
    sort2(card2, card3);
    sort2(card1, card2);
    sort2(card2, card3);
}

void sort5(string &card1, string &card2, string &card3, string &card4, string &card5) {
    sort3(card3, card4, card5);
    sort3(card1, card2, card3);
    sort3(card3, card4, card5);
    sort3(card2, card3, card4);
    sort3(card3, card4, card5);
}

int main() {
    string card1, card2, card3, card4, card5;
    cin >> card1 >> card2 >> card3 >> card4 >> card5;

    size_t rank1, rank2, rank3, rank4, rank5;
    char suit1, suit2, suit3, suit4, suit5;

    sort5(card1, card2, card3, card4, card5);

    cout << '\n' << card1 << ' '
         << card2 << ' '
         << card3 << ' '
         << card4 << ' '
         << card5 << '\n';

    rank1 = getRank(card1);
    rank2 = getRank(card2);
    rank3 = getRank(card3);
    rank4 = getRank(card4);
    rank5 = getRank(card5);

    suit1 = card1[0];
    suit2 = card2[0];
    suit3 = card3[0];
    suit4 = card4[0];
    suit5 = card5[0];

    bool sameSuit = suit1 == suit2 && suit2 == suit3 && suit3 == suit4 && suit4 == suit5,
            royalFlush = rank1 == 14 && rank2 == 13 && rank3 == 12 && rank4 == 11 && rank5 == 10,
            consecutive = rank1 == rank2 + 1 && rank2 == rank3 + 1 && rank3 == rank4 + 1 && rank4 == rank5 + 1,
            fourOfKind = (rank1 == rank2 && rank2 == rank3 && rank3 == rank4) ||
                         (rank2 == rank3 && rank3 == rank4 && rank4 == rank5),
            fullHouse = ((rank1 == rank2 && rank2 == rank3) && rank4 == rank5) ||
                        (rank1 == rank2 && (rank3 == rank4 && rank4 == rank5)),
            flush = suit1 == suit2 && suit2 == suit3 && suit3 == suit4 && suit4 == suit5,
            threeOfKind = (rank1 == rank2 && rank2 == rank3) || (rank2 == rank3 && rank3 == rank4) ||
                          (rank3 == rank4 && rank4 == rank5),
            twoPair = (rank1 == rank2 && rank3 == rank4) || (rank2 == rank3 && rank4 == rank5),
            pair = rank1 == rank2 || rank2 == rank3 || rank3 == rank4 || rank4 == rank5;

    if (sameSuit && royalFlush)
        cout << "royal flush";
    else if (sameSuit && consecutive)
        cout << "straight flush";
    else if (fourOfKind)
        cout << "four of a kind";
    else if (fullHouse)
        cout << "full house";
    else if (flush)
        cout << "flush";
    else if (consecutive)
        cout << "Straight";
    else if (threeOfKind)
        cout << "three of a kind";
    else if (twoPair)
        cout << "two pair";
    else if (pair)
        cout << "pair";
    else
        cout << "high card";
    cout << '\n';
    return 0;
}
