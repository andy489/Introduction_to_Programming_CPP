## 9. Other tasks  

**9.01.** Write a program which by given two days of any year computes the number of days between them. Hint:

struct tm

Member | Type | Meaning | Range
------------ | ------------- | ------------- | -------------
tm_sec | int | seconds after the minute | 0-60*
tm_min | int | minutes after the hour | 0-59
tm_hour | int | hours since midnight | 0-23
tm_mday | int | day of the month | 1-31
tm_mon | int | months since January | 0-11
tm_year | int | years since 1900 | 
tm_wday | int | days since Sunday | 0-6
tm_yday | int | days since January 1 | 0-365
tm_isdst | int | Daylight Saving Time flag | 


Conversion (function) | Do
------------ | -------------
asctime | Convert tm structure to string
ctime | Convert time_t value to string

**9.02.** Write a program which prints all subsets of a set.

**9.03.** Display on the console the characters of those elements of a text, which indexes fulfill at least one of the conditions:

а) are powers of 2;

b) are perfect squares;

c) are Fibonacci's numbers.
