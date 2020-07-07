%% Student Name: Gerard Slowey
%% Student Number: 17349433

%% Treats strings as character arrays
:- set_prolog_flag(double_quotes, chars).

%% Base cases
%% Checking if the first or second word is empty
calc_pref(_, "", "").
calc_pref("", _, "").

%% If the heads are equal check the tails
calc_pref([H|T1], [H|T2], [H|T3]) :- 
    calc_pref(T1, T2, T3).

calc_pref([H|_], [H|_], "").

%% Checking if the head of list 1 and 2 are different
calc_pref([H1|_], [H2|_], "") :- 
    dif(H1, H2).

%% If the supplied word list is empty
get_lcp([], Prefix) :- 
    calc_pref("", "", Prefix).

%% If the supplied word list only has one item
get_lcp([W], Prefix) :- 
    calc_pref(W, W, Prefix).

%% Checking 2 letters at a time
get_lcp([H1, H2|T], Prefix) :- 
    calc_pref(H1, H2, Prefix), 
    get_lcp([H2|T], Prefix).


%% Main lcp function, calls the get_lcp function
%% and then prints the result as a string
lcp(List, Answer) :-
    get_lcp(List, Prefix),
    string_chars(Answer, Prefix).
