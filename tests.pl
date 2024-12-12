:- [target]. % ficheiro a ser testado

/* Índice dos testes (remover as linhas que não se pretendem testar) */ 
run_tests :-
    test_4,
    test_5, 
    test_6,
    test_7,
    test_8,
    test_9,
    test_10,
    test_11,
    test_12,
    test_13,
    test_14,
    test_15,
    test_16,
    test_17,
    test_18,
    test_19,
    test_20,
    test_21,
    test_22,
    test_23,
    test_24,
    test_25,
    test_26,
    test_27,
    test_28,
    test_29,
    test_30,
    test_31,
    test_32,
    test_33,
    test_34,
    test_35,
    test_36,
    test_37,
    test_38,
    writeln('\033[32m All the current tests passed!\033[0m'). %TODO inserir mais



/* 5.1 (Visualização) */
%TODO (ver forma de testar com identificadores dinâmicos do Prolog)



/* 5.2 (Inserção de estrelas e pontos) */
test_4 :-
    Tab = [[_, e, _], [_, p, p], [_, _, p]],
    insereObjecto((1,3), Tab, ola),
    Tab = [[_, e, ola], [_, p, p], [_, _, p]],
    writeln("[Success] Test 4.").
test_5 :-
    Tab = [[_, e, _], [_, p, p], [_, _, p]],
    insereObjecto((1,2), Tab, ola),
    Tab = [[_, e, _], [_, p, p], [_, _, p]],
    writeln("[Success] Test 5.").
test_6 :-
    Tab = [[_, e, _], [_, p, p], [_, _, p]],
    insereObjecto((1,4), Tab, ola),
    Tab = [[_, e, _], [_, p, p], [_, _, p]],
    writeln("[Success] Test 6.").
test_7 :-
    Tab = [[_, e, _], [_, p, p], [_, _, p]],
    insereObjecto((1,2), Tab, oi),
    Tab = [[_, e, _], [_, p, p], [_, _, p]],
    writeln("[Success] Test 7.").
test_8 :-
    Tab = [[_, e, _], [_, p, p], [_, _, p]],
    insereVariosObjectos([(1,3), (4,5), (1, 2), (1, 1)], Tab, [ola, ole, oi, batata]),
    Tab = [[batata, e, ola], [_, p, p], [_, _, p]],
    writeln("[Success] Test 8.").
test_9 :-
    Tab = [[_, e, _], [_, p, p], [_, _, p]], 
    \+ insereVariosObjectos([(1,3), (4,5), (1, 2)], Tab, [ola, ole]),
    writeln("[Success] Test 9 ('task failed successfully')").
test_10 :-
    Tab = [[_, e, _], [_, p, p], [_, _, p]], inserePontosVolta(Tab, (2, 1)),
    (Tab = [[p,e,_],[_,p,p],[p,p,p]]; Tab = [[p,e,_],[_,p,p],[p,p,p]]),
    writeln("[Success] Test 10.").
test_11 :-
    Tab = [[_, e, _], [_, p, p], [_, _, p]], inserePontos(Tab, [(1,1), (2,1)]),
    Tab = [[p,e,_],[p,p,p],[_,_,p]],
    writeln("[Success] Test 11.").
test_12 :-
    Tab = [[_, e, _], [_, p, p], [_, _, p]], inserePontos(Tab, [(1,1), (2,1)]),
    Tab = [[p,e,_],[p,p,p],[_,_,p]],
    writeln("[Success] Test 12.").



/* 5.3 (Consultas) */
test_13 :-
    Tab = [[_, e, _], [_, p, p], [_, _, p]], 
    objectosEmCoordenadas([(1, 1), (2, 3), (3, 3)], Tab, Obj),
    Tab = [[_,e,_],[_,p,p],[_,_,p]],
    Obj = [_,p,p],
    writeln("[Success] Test 13.").
test_14 :- %! Removi Obj do argumento porque estava a ser singleton variable
    Tab = [[_, e, _], [_, p, p], [_, _, p]], 
    \+ objectosEmCoordenadas([(1, 1), (2, 4), (3, 3)], Tab, _),
    writeln("[Success] Test 14 ('task failed successfully')").
test_15 :-
    Tab = [[_, e, _], [_, p, p], [_, _, p]], 
    coordObjectos(e, Tab, [(1, 3), (3, 3)], LCO, Num),
    Tab = [[_,e,_],[_,p,p],[_,_,p]],
    LCO = [],
    Num = 0,
    writeln("[Success] Test 15.").
test_16 :-
    Tab = [[_, e, _], [_, p, p], [_, _, p]], 
    coordObjectos(e, Tab, [(1, 2), (3, 3)], LCO, Num),
    Tab = [[_,e,_],[_,p,p],[_,_,p]],
    LCO = [(1,2)],
    Num = 1,
    writeln("[Success] Test 16.").
test_17 :-
    Tab = [[_, e, _], [_, p, p], [_, _, p]], 
    coordObjectos(_, Tab, [(1,1), (1, 2), (2, 1)], LCO, Num),
    Tab = [[_,e,_],[_,p,p],[_,_,p]],
    LCO = [(1,1),(2,1)],
    Num = 2,
    writeln("[Success] Test 17.").
test_18 :-
    Tab = [[1, _], [3, _]], 
    coordenadasVars(Tab, [(1, 2), (2, 2)]),
    Tab = [[1,_],[3,_]],
    writeln("[Success] Test 18.").
test_19 :-
    Tab = [[1, _], [3, _]], 
    \+ coordenadasVars(Tab, [(1, 2), (1, 2)]),
    writeln("[Success] Test 19 ('task failed successfully')").



/* 5.4.1 (Estratégias - Fechar linhas, colunas ou estruturas) */
test_20 :-
    Tab = [[_, e, e], [_, p, p], [_, _, p]], 
    fechaListaCoordenadas(Tab, [(1, 1), (1, 2), (1, 3)]),
    Tab = [[p,e,e],[_,p,p],[_,_,p]],
    writeln("[Success] Test 20.").
test_21 :-
    Tab = [[_, e, e], [_, p, p], [_, _, p]], 
    fechaListaCoordenadas(Tab, [(1, 2), (2, 2), (3, 2)]),
    Tab = [[_,e,e],[p,p,p],[p,e,p]],
    writeln("[Success] Test 21.").
test_22 :-
    Tab = [[_, e, e], [_, p, p], [_, _, p]], 
    fecha(Tab, [[(1, 2), (2, 2), (3, 2)], [(1, 1), (1, 2), (1, 3)]]),
    Tab = [[p,e,e],[p,p,p],[p,e,p]],
    writeln("[Success] Test 22.").
test_23 :-
    Tab = [[_, e, e], [_, p, p], [_, _, p]], 
    fecha(Tab, [[(1, 2), (2, 2), (3, 2)], [(1, 1), (1, 2), (1, 3)]]),
    Tab = [[p,e,e],[p,p,p],[p,e,p]],
    writeln("[Success] Test 23.").



/* 5.4.2 (Estratégias - Encontrar padrões) */
test_24 :- %! Removi Seq do argumento porque estava a ser singleton variable
    Tab = [[_, e, e], [_, p, p], [_, _, p], [p, _, _]], 
    \+ encontraSequencia(Tab, 3, [(1,1), (1,2), (1, 3)], _),
    writeln("[Success] Test 24 ('task failed successfully')").
test_25 :-
    Tab = [[_, e, e], [_, p, p], [_, _, p]], 
    encontraSequencia(Tab, 3, [(1,1), (2,1), (3, 1)], Seq),
    Tab = [[_,e,e], [_,p,p], [_,_,p]],
    Seq = [(1,1),(2,1),(3,1)],
    writeln("[Success] Test 25.").
test_26 :-
    Tab = [[_, e, e], [_, p, p], [_, _, p]], 
    encontraSequencia(Tab, 3, [(1,1), (3, 1), (2, 1)], Seq),
    Tab = [[_,e,e], [_,p,p], [_,_,p]],
    Seq = [(1,1),(3,1),(2,1)],
    writeln("[Success] Test 26.").
test_27 :-
    Tab = [[_, e, e], [_, p, p], [_, _, p], [p, _, _]], 
    encontraSequencia(Tab, 3, [(1,1), (2,1), (3, 1)], Seq),
    Tab = [[_,e,e], [_,p,p], [_,_,p], [p,_,_]],
    Seq = [(1,1),(2,1),(3,1)],
    writeln("[Success] Test 27.").
test_28 :- %! Removi Seq do argumento porque estava a ser singleton variable
    Tab = [[_, e, e], [_, p, p], [_, _, p], [p, _, _]], 
    \+ encontraSequencia(Tab, 2, [(1,1), (2,1), (3, 1)], _),
    writeln("[Success] Test 28 ('task failed successfully')").
test_29 :-
    Tab = [[_, e, e], [_, p, p], [_, _, p]], 
    encontraSequencia(Tab, 3, [(1,1), (2,1), (3, 2)], Seq),
    Tab = [[_,e,e], [_,p,p], [_,_,p]],
    Seq = [(1,1),(2,1),(3,2)],
    writeln("[Success] Test 29.").
test_30 :-
    inicial(9, Tab), 
    encontraSequencia(Tab, 3, [(1,1), (1,2), (1, 3)], Seq),
    Tab = [[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_]],
    Seq = [(1,1),(1,2),(1,3)],
    writeln("[Success] Test 30.").
test_31 :- %! Removi Seq do argumento porque estava a ser singleton variable
    inicial(9, Tab), 
    \+ encontraSequencia(Tab, 3, [(1,1), (1,2), (1, 3), (1,4)], _),
    writeln("[Success] Test 31 ('task failed successfully')").
test_32 :-
    inicial(9, Tab), 
    encontraSequencia(Tab, 4, [(1,1), (1,2), (1, 3), (1,4)], Seq),
    Tab = [[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_],[_,_,_,_,_,_,_,_,_]],
    Seq = [(1,1),(1,2),(1,3),(1,4)],
    writeln("[Success] Test 32.").
test_33 :-
    Tab = [[_, e, e], [_, p, p], [_, _, p]], 
    aplicaPadraoI(Tab, [(1,1), (2,1), (3, 1)]),
    Tab = [[e,e,e],[p,p,p],[e,p,p]],
    writeln("[Success] Test 33.").
test_34 :-
    Tab = [[_, e, e], [_, p, p], [_, _, p], [_, _, _]], 
    aplicaPadraoI(Tab, [(4,1), (4,2), (4, 3)]),
    Tab = [[_,e,e],[_,p,p],[p,p,p],[e,p,e]],
    writeln("[Success] Test 34.").
test_35 :-
    Tab = [[_, e, e], [_, p, p], [_, _, p]], 
    \+ aplicaPadraoI(Tab, [(2,1), (3, 1)]),
    writeln("[Success] Test 35 ('task failed successfully')").
test_36 :-
    Tab = [[_, e, e], [_, p, p], [_, _, p]], 
    \+ aplicaPadraoI(Tab, [(1,1), (2,1), (3, 1), (4,1)]),
    writeln("[Success] Test 36 ('task failed successfully')").
test_37 :-
    Tab = [[_, e, e, _], [_, p, p, _], [_, _, p, _], [_, _, _, _]], 
    \+ aplicaPadraoI(Tab, [(1,1), (2,1), (3, 1), (4,1)]),
    writeln("[Success] Test 37 ('task failed successfully')").
test_38 :-
    Tab = [[_, e, e, _], [_, p, p, _], [_, _, p, _], [_, _, _, _]], 
    aplicaPadraoI(Tab, [(1,1), (2,1), (3, 1)]),
    Tab = [[e,e,e,_],[p,p,p,_],[e,p,p,_],[p,p,_,_]],
    writeln("[Success] Test 38.").

%TODO resto da parte 5.4.2
%TODO 5.5 (Apoteose Final!)  
%TODO Extra (Simple Unit tests) 
%TODO Extra (Puzzles) 