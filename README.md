# TP - Introduction à Prolog

Ce TP a pour objectif de se familiariser avec les faits, les règles, les requêtes, et la manipulation des listes en Prolog, ainsi que les relations familiales.

On utilisera SWISH " https://swish.swi-prolog.org "
 pour tester le code en ligne.


% =====================================================
% Partie 1 : Faits
% =====================================================

% Couleurs des objets
couleur(pomme, rouge).
couleur(ballon, bleu).
couleur(citron, jaune).
couleur(carotte, orange).
couleur(orange, orange).

% Qui mange quoi
mange(romain, pomme).
mange(lea, citron).
mange(sarah, pomme).
mange(bob, carotte).
mange(claire, banane).

% Type d'aliment
type(pomme, fruit).
type(citron, fruit).
type(carotte, legume).
type(banane, fruit).

% Genre
homme(pierre).
homme(luc).
homme(andre).

femme(marie).
femme(sara).

% Relations familiales
parent(pierre, luc).
parent(marie, luc).
parent(andre, pierre).
parent(sara, marie).

% =====================================================
% Partie 2 : Exercice 2 – Règles
% =====================================================

% X aime Y si X mange Y
aime(X, Y) :- mange(X, Y).

% Vrai si la personne mange un fruit
aime_fruit(Personne) :-
    mange(Personne, Aliment),
    type(Aliment, fruit).

% Vrai si X et Y ont la même couleur
meme_couleur(X, Y) :-
    couleur(X, Couleur),
    couleur(Y, Couleur).

% Vrai si A et B mangent la même chose
aiment_la_meme_chose(A, B) :-
    mange(A, Aliment),
    mange(B, Aliment).

% =====================================================
% Partie 3 : Exercice 3 – Longueur d'une liste
% =====================================================

% La longueur d'une liste vide est 0.
% Sinon, on ignore la tête et on calcule récursivement la longueur de la queue puis on ajoute 1.
longueur([], 0).
longueur([_|T], N) :-
    longueur(T, N1),
    N is N1 + 1.

% =====================================================
% Partie 4 : Exercice 4 – Somme d'une liste
% =====================================================
% La somme d'une liste vide est 0.
% Sinon, on ajoute la tête à la somme du reste de la liste.
somme([], 0).
somme([H|T], S) :-
    somme(T, S1),
    S is H + S1.

% =====================================================
% Partie 5 et 6 : Relations familiales
% =====================================================
pere(P, E) :-
    homme(P),
    parent(P, E).

mere(M, E) :-
    femme(M),
    parent(M, E).

grand_parent(GP, E) :-
    parent(GP, P),
    parent(P, E).

ancetre(A, E) :-
    parent(A, E).
ancetre(A, E) :-
    parent(A, X),
    ancetre(X, E).

frere_ou_soeur(A, B) :-
    parent(P, A),
    parent(P, B),
    A \= B.

% =====================================================
% Partie 7 : Exercice 7 – Membre d’une liste
% =====================================================
membre(X, [X|_]).
membre(X, [_|T]) :-
    membre(X, T).

% =====================================================
% Partie 8 : Exercice 8 – Maximum d’une liste
% =====================================================
max_liste([X], X).
max_liste([H|T], Max) :-
    max_liste(T, MaxT),
    ( H > MaxT -> Max = H ; Max = MaxT ).

% =====================================================
% Partie 9 : Requêtes pour tous les exercices
% =====================================================

/*
Exercice 1 – Faits :
?- couleur(X, rouge).         % Qui est rouge ?
?- mange(lea, X).             % Que mange Léa ?
?- mange(X, pomme).           % Qui mange une pomme ?
?- couleur(X, jaune).         % Quel objet est jaune ?

Exercice 2 – Règles :
?- aime_fruit(X).                       % Qui mange un fruit ?
?- meme_couleur(carotte, orange).       % Vérifier une paire spécifique
?- meme_couleur(X, Y).                  % Voir toutes les paires
?- aiment_la_meme_chose(romain, sarah). % Vérifier une paire
?- aiment_la_meme_chose(X, Y).          % Voir toutes les paires

Exercice 3 – Longueur d'une liste :
1. Expliquer en 2 phrases le fonctionnement de cette règle.
  La règle dit que si la liste est vide, sa longueur est zéro. 
  Sinon, Prolog ignore la tête de la liste, calcule récursivement la longueur de la queue, puis ajoute un pour compter la tête, de manière à obtenir la 	   longueur totale de la liste.

?- longueur([a,b,c], N).         % N = 3
?- longueur([], N).              % N = 0
?- longueur([1,2,3,4,5], N).     % N = 5

3.Pourquoi _ dans la tête de la règle ?
  Le _ dans la tête de la  règle est pour ignorer la tête de la liste car on n'a pas besoin de sa valeur pour calculer la longueur.

Exercice 4 – Somme d'une liste :
?- somme([1,2,3], S).            % S = 6

Exercice 5 et 6 – Relations familiales :
?- pere(pierre, luc).         % true
?- mere(marie, luc).          % true
?- grand_parent(sara, luc).   % true
?- ancetre(andre, luc).       % true
?- frere_ou_soeur(luc, X).    % false

Exercice 7 – Membre d'une liste :
?- membre(3, [1,2,3,4]).            % true

Exercice 8 – Maximum d'une liste :
?- max_liste([5,8,2,9,4], M).      % M = 9

Exercice 9 – Compléments :
?- aime_fruit_specifique(romain, pomme).       % true
?- aiment_le_meme_fruit(romain, sarah, pomme). % true
*/
