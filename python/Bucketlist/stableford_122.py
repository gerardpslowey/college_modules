#!/usr/bin/env python3

import sys

disqualified = []
name_score = {}

def main():
    score_to_par = {-7 : 9, -6 : 8, -5 : 7, -4 : 6, -3 : 5, -2 : 4, -1 : 3, 0 : 2, 1 : 1, 2 : 0}
    lines = sys.stdin.readlines()
    hole_pars = lines[0].strip().split()
    hole_index = lines[1].strip().split()

    for line in lines[2:]:
        line = line.split()
        name = " ".join(line[:-19])
        handicap = int(line[-19])
        shots = line[-18:]
        
        player_stats = []
        for i in range(0, 18):
            player_stats.append([hole_pars[i], hole_index[i], shots[i], 0])

        player_score = total_sum(player_stats, handicap, score_to_par, name)

        if name not in disqualified:
            name_score[name] = player_score

    name_length = len(max(name_score.keys(), key = len))

    for (name, score) in sorted(name_score.items(), key = totals1, reverse = True):
        if score > -1:
            print("{:>{}} : {:>2}".format(name, name_length, score))

    for person in disqualified:
        print("{:>{}} : Disqualified".format(person, name_length))

def totals1(name_score):
    return name_score[-1]

def sorted_stats(stats):
    return int(stats[1])

def total_sum(stats, handicap, par_score, name):
    stats = sorted(stats, key = sorted_stats)
    additional_strokes = handicap // 18
    remaining_strokes = handicap % 18

    total = 0
    for i in range(0, remaining_strokes):
        stats[i][3] += 1
    for i in stats:
        i[3] += additional_strokes
        try:
            score = int(i[2]) - int(i[3]) - int(i[0])
            if score in par_score:
                total += par_score[score]

        except ValueError:
            if i[2] == "X":
                pass
            else:
                disqualified.append(name)
                name_score[name] = -1
                break
    return total

if __name__ == '__main__':
    main()