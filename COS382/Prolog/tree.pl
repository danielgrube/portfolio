%%%%%%%%%%%%%%%%%%%%%%%%%% 
% tree.pl
% https://gfx.cse.taylor.edu/courses/cos382/assignments/04_ParadigmLogic_Prolog/04_ParadigmLogic_Prolog.md.html
% The goal of this assignment is to write a collection of Prolog rules to represent and manipulate binary trees.
%%%%%%%%%%%%%%%%%%%%%%%%%% 


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Starter code

% binary_tree(Tree) 
% "Tree" is a binary tree. 

binary_tree(void).
binary_tree(tree(_,Left,Right)) :-  binary_tree(Left),
                                    binary_tree(Right).


% tree_member(Element,Tree) 
% "Element" is an element of the binary tree "Tree". 

tree_member(X,tree(X,_,_)). 
tree_member(X,tree(_,Left,_)) :- tree_member(X,Left). 
tree_member(X,tree(_,_,Right)) :- tree_member(X,Right).



% preorder(Tree,Pre) 
% "Pre" is a list of elements of "Tree" accumulated during a 
% preorder traversal. 

preorder(tree(X,L,R),Xs) :- preorder(L,Ls), preorder(R,Rs),
                            append([X|Ls],Rs,Xs). 
preorder(void,[]).



% append(Xs,Ys,XsYs) 
% "XsYs" is the result of appending the lists "Xs" and "Ys".

append([],Ys,Ys). 
append([X|Xs],Ys,[X|Zs]) :- append(Xs,Ys,Zs).


% Some sample trees
%
%    tree1       tree2         tree3
%
%      1           4             1
%     / \         / \           / \
%    2   3       5   6         2   3
%                            / \
%                           5   6
%                              /
%                             7
%

tree1(tree(1,tree(2,void,void),tree(3,void,void))). 
tree2(tree(4,tree(5,void,void),tree(6,void,void))). 
tree3( 
        tree(   1, 
                tree(   2, 
                        tree(5,void,void), 
                        tree(   6, 
                                tree(7,void,void), 
                                void 
                        ) 
                ), 
                tree(3,void,void) 
        ) 
).



%%%%%%%%%%%%%%%%%%%%%%%%%%
% Place your code here


% Additional sample data


% inorder
inorder(void, []).
inorder(tree(X,L,R),Xs) :-
	inorder(L,Ls),
    inorder(R,Rs),
    append(Ls,[X],Ys),
    append(Ys,Rs,Xs). 

% search
search(void,_).
search(tree(X,L,R),K) :-
    K==X;
    search(L,K);
    search(R,K).
 
% subtree
eqltree(void,void).
eqltree(tree(S,SL,SR), tree(T,TL,TR)) :- tree(S,SL,SR)==tree(T,TL,TR).

subtree(void,void).
subtree(tree(S,SL,SR), tree(T,TL,TR)) :-
    eqltree(tree(S,SL,SR), tree(T,TL,TR));
    subtree(tree(S,SL,SR),TL);
    subtree(tree(S,SL,SR),TR).

% sumtree
sumtree(void,0).
sumtree(tree(X,L,R),Xs) :-
	sumtree(L,Lsum),
    sumtree(R,Rsum),
	Xs is Lsum+Rsum+X.

% ordered
bigger(_,void).
bigger(N,tree(X,L,R)) :-
   	bigger(N,L),
	bigger(N,R),
    N > X.
       
smaller(_,void).
smaller(N,tree(X,L,R)) :-
    smaller(N,L),
    smaller(N,R),
    N < X.

       
ordered(void).
ordered(tree(X,L,R)) :-
    bigger(X,L),
    smaller(X,R),
    ordered(L),
    ordered(R).
    


% substitute
substitute(_,_,void,void).
substitute(X,Y,tree(X,XL,XR),tree(Y,YL,YR)) :-
    substitute(X,Y,XL,YL),
    substitute(X,Y,XR,YR).

substitute(X,Y,tree(C,XL,XR),tree(C,YL,YR)) :-
    X \== C,
    substitute(X,Y,XL,YL),
    substitute(X,Y,XR,YR).