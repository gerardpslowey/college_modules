:- set_prolog_flag(double_quotes, chars).

calc_pref(_, "", "").
calc_pref("", _, "").

calc_pref([H|T1], [H|T2], [H|T3]) :- 
    calc_pref(T1, T2, T3).

calc_pref([H|_], [H|_], "").

calc_pref([H1|_], [H2|_], "") :- 
    dif(H1, H2).

get_lcp([], Prefix) :- 
    calc_pref("", "", Prefix).

get_lcp([W], Prefix) :- 
    calc_pref(W, W, Prefix).

get_lcp([H1, H2|T], Prefix) :- 
    calc_pref(H1, H2, Prefix), 
    get_lcp([H2|T], Prefix).


lcp(List, Answer) :-
    get_lcp(List, Prefix),
    string_chars(Answer, Prefix).
