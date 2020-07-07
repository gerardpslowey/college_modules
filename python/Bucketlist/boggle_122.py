import sys

def find(s, whole=False):

    low = 0
    high = len(dict_words) - 1

    while low <= high:
        mid = (low + high) // 2
        guess = dict_words[mid] if whole else dict_words[mid][:len(s)]

        if guess > s:
            high = mid - 1
        elif guess < s:
            low = mid + 1
        else:
            return True

    return False

points = {
    1: 0,
    2: 0,
    3: 1,
    4: 1,
    5: 2,
    6: 3,
    7: 5, 
}

cardinals = tuple((i, j) for i in range(-1, 2)
                  for j in range(-1, 2) if not i == j == 0)
dict_words = []
boards = []


def read_boards(filename):
    global boards
    with open(filename) as f:
        lines = [l.strip() for l in f]
        boards += [[l[i:i + 4] for i in range(0, 13, 4)] for l in lines]


def read_dictionary(filename):
    global dict_words
    with open(filename) as f:
        dict_words = [l.strip().lower() for l in f]


def get_next_words(board, pos_seq=((0, 0),)):
    cur = pos_seq[-1]
    next_pos = set(clamp_tuple(add_tuple(cur, offset)) for offset in cardinals)
    next_pos = set(p for p in next_pos if p not in pos_seq)

    next_words = {pos_seq + (p,): build_word(board, pos_seq + (p,))
                  for p in next_pos}

    return next_words


def find_all_substrings(board, start_pos_seq):
    w = get_next_words(board, start_pos_seq)
    w = {k: v for (k, v) in w.items() if find(v)}

    if w:
        w2 = dict(w)
        for pos_seq in w:
            w2.update(find_all_substrings(board, pos_seq))
        return w2
    else:
        return {}

def find_all_words(board):
    start_positions = tuple((i, j) for i in range(0, 4)
                            for j in range(0, 4))

    subs = {}
    for pos in start_positions:
        subs.update(find_all_substrings(board, (pos,)))

    words = set(s for s in subs.values() if find(s, True))

    return sorted(words)


def add_tuple(t1, t2):
    return (t1[0] + t2[0], t1[1] + t2[1])


def clamp_tuple(t, _min=0, _max=3):
    return tuple(max(_min, min(_max, x)) for x in t)


def build_word(board, pos_seq):
    return "".join(board[p[1]][p[0]] for p in pos_seq)


def main():
    read_boards(sys.argv[1])
    read_dictionary(sys.argv[2])

    for b in boards:
        words = find_all_words(b)
        tot_points = sum(points.get(len(w), 11) for w in words)
        print("Possible points:", tot_points)


if __name__ == '__main__':
    main()