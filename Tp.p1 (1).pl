 % Faits
couleur(pomme, rouge).
couleur(ballon, bleu).
couleur(citron, jaune).
couleur(carotte, orange).
couleur(orange, orange).

mange(romain, pomme).
mange(lea, citron).
mange(sarah, pomme).
mange(bob, carotte).
mange(claire, banane).
 
type(pomme, fruit).
type(citron, fruit).
type(carotte, legume).
type(banane, fruit).

homme(pierre).
homme(luc).
homme(andre).

femme(marie).
femme(sara).

parent(pierre, luc).
parent(marie, luc).
parent(andre, pierre).
parent(sara, marie).


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

longueur([], 0).
longueur([_|T], N) :-
    longueur(T, N1),
    N is N1 + 1.

somme([], 0).
somme([H|T], S) :-
    somme(T, S1),
    S is H + S1.

% Vrai si P est père de E
pere(P, E) :-
    homme(P),
    parent(P, E).

% Vrai si M est mère de E
mere(M, E) :-
    femme(M),
    parent(M, E).

% Vrai si GP est parent d’un parent de E
grand_parent(GP, E) :-
    parent(GP, P),
    parent(P, E).

% Vrai si c'est notre ancetre
ancetre(A, E) :-
    parent(A, E).

ancetre(A, E) :-
    parent(A, X),
    ancetre(X, E).

% Vrai si ils ont un parent en commun 
frere_ou_soeur(A, B) :-
    parent(P, A),
    parent(P, B),
	A \= B.

% Cas de base : X est la tête de la liste
membre(X, [X|_]).

% Cas récursif : X est dans la queue T
membre(X, [_|T]) :-
    membre(X, T).

%le maximum d'une liste avec un seul élément est cet élément
max_liste([X], X).

% Cas récursif :
max_liste([H|T], Max) :-
    max_liste(T, MaxT),                    % calculer le max du reste
    ( H > MaxT -> Max = H ; Max = MaxT ).  % comparer H au max du reste
  
    
/*
 Partie 1
 Exercice 1
 
  Qui est rouge ? 
  requête: couleur(X, rouge).
  
  Qu’est-ce que mange Léa ?
  requête: mange(lea, X).
  
  Qui mange une pomme ?
  requête: mange(X, pomme).
  
  Quel objet est de couleur jaune ?
  requête: couleur(X, jaune).
  
  Partie 2 - Règles
  Exercice 2
  
  vrai si la personne mange un fruit :
  requête: aime_fruit(X).
  
  vrai si X et Y ont la même couleur:
  requête pour vérifier une paire spécifique: meme_couleur(carotte, orange).
  requête pour voir toutes les paires de personnes qui mangent la même chose: meme_couleur(X, Y).
  
  vrai si X et Y ont la même couleur:
  requête pour vérifier une paire spécifique: aiment_la_meme_chose(Romain, sarah).
  requête pour voir toutes les paires de personnes qui mangent la même chose: aiment_la_meme_chose(X, Y).

  Exercice 3 - Longueur d'une liste
  Questions
  
  1. Expliquer en 2 phrases le fonctionnement de cette règle.
  La règle dit que si la liste est vide, sa longueur est zéro. 
  Sinon, Prolog ignore la tête de la liste, calcule récursivement la longueur de la queue, puis ajoute un pour compter la tête, de manière à obtenir la longueur totale de la liste.
  
  2.
  ?- longueur([a,b,c], N).
  N = 3
  
  ?- longueur([], N).
  N = 0
  
  ?- longueur([1,2,3,4,5], N).
  N = 5
  
  3.Pourquoi _ dans la tête de la règle ?
  Le _ dans la tête de la  règle est pour ignorer la tête de la liste car on n'a pas besoin de sa valeur pour calculer la longueur.
  
  Exercice 4 - Somme d'une liste
  Écrire la règle : Elle doit donner la somme des éléments d’une liste d'entiers.
  somme([], 0).
  somme([H|T], S) :-
      somme(T, S1),
      S is H + S1.
      
  Exercice 5 et 6 - Règles + vérifications

  1. Vrai si P est père de E
     requête: pere(pierre, luc). "Vrai"

  2. Vrai si M est mère de E
     requête: mere(marie, luc). "Vrai"

  3. Vrai si GP est parent d’un parent de E
     requête: grand_parent(sara, luc). "Vrai"

  4. `ancetre(A, E)` (récursif)
     requête: ancetre(andre, luc). "Vrai"
  
  5. `frere_ou_soeur(A, B)` (mêmes parents)
      requête: frere_ou_soeur(luc, X). "False"
      
  Exercice 7 - Membre d’une liste
  Écrire la règle :
  membre(X, [X|_]).

  membre(X, [_|T]) :-
      membre(X, T).
  
  Exercice 8 - Maximum d’une liste
  
  max_liste([X], X).

  max_liste([H|T], Max) :-
      max_liste(T, MaxT),                     
      ( H > MaxT -> Max = H ; Max = MaxT ).   
      
  Requête: max_liste([5,8,2,9,4], M).

  */