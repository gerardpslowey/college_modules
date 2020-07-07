#!/usr/bin/env python3

import sys

def longest_common_string(s1, s2):
    m = len(s1)
    n = len(s2)
    
    count = [[0] * (n + 1) for x in range(m + 1)]
    
    longest = 0
    longest_set = set()
    
    for i in range(m):
        for j in range(n):
            if s1[i] == s2[j]:
                c = count[i][j] + 1
                count[i + 1][j + 1] = c
                
                if c > longest:
                    longest_set = set()
                    longest = c
                    longest_set.add(s1[i - c + 1 : i + 1])
                
                elif c == longest:
                    longest_set.add(s1[i - c + 1 : i + 1])
    return longest_set

def main():
    lines = sys.stdin.read().strip()
    s1, s2 = lines.split()
    lcs = longest_common_string(s1, s2)

    for s in lcs:
        index = s2.index(s)
        print("{} {} {}".format(s, len(s), index))

if __name__ == '__main__':
    main()