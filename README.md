# TP - Introduction à Prolog

Ce TP a pour objectif de se familiariser avec les faits, les règles, les requêtes, et la manipulation des listes en Prolog, ainsi que les relations familiales.

On utilisera SWISH " https://swish.swi-prolog.org "
 pour tester le code en ligne.

### Requêtes pours les parties : 

/*
 Partie 1
 Exercice 1
 
  **Qui est rouge ?** 
  `?- requête: couleur(X, rouge).`
  
  **Qu’est-ce que mange Léa ?**
  requête: `?- mange(lea, X).`
  
  **Qui mange une pomme ?**
  requête: `?- mange(X, pomme).`
  
  **Quel objet est de couleur jaune ?**
  requête: `?- couleur(X, jaune).`
  
  Partie 2 - Règles
  Exercice 2
  
  **vrai si la personne mange un fruit :**
  `?- requête: aime_fruit(X).`
  
 **vrai si X et Y ont la même couleur:** <br>
  requête pour vérifier une paire spécifique: `?- meme_couleur(carotte, orange).`<br>
  requête pour voir toutes les paires de personnes qui mangent la même chose: `?- meme_couleur(X, Y).`<br>
  
  **vrai si X et Y ont la même couleur:** <br>
  requête pour vérifier une paire spécifique: `?- aiment_la_meme_chose(Romain, sarah).`<br>
  requête pour voir toutes les paires de personnes qui mangent la même chose: `?- aiment_la_meme_chose(X, Y).`<br>

  Exercice 3 - Longueur d'une liste
  Questions
  
  1. Expliquer en 2 phrases le fonctionnement de cette règle.
  La règle dit que si la liste est vide, sa longueur est zéro. 
  Sinon, Prolog ignore la tête de la liste, calcule récursivement la longueur de la queue, puis ajoute un pour compter la tête, de manière à obtenir la longueur totale de la liste.
  
  2.
  `?- longueur([a,b,c], N).`
  N = 3
  
  `?- longueur([], N).`
  N = 0
  
  `?- longueur([1,2,3,4,5], N).`
  N = 5
  
  3.Pourquoi _ dans la tête de la règle ?
  Le _ dans la tête de la  règle est pour ignorer la tête de la liste car on n'a pas besoin de sa valeur pour calculer la longueur.
  
  Exercice 4 - Somme d'une liste
  Écrire la règle : Elle doit donner la somme des éléments d’une liste d'entiers.<br>
  `somme([], 0).
  somme([H|T], S) :-
      somme(T, S1),
      S is H + S1.`
      
  Exercice 5 et 6 - Règles + vérifications

  1. **Vrai si P est père de E**
     requête: `?- pere(pierre, luc).` "Vrai"

  2. **Vrai si M est mère de E**
     requête: `?- mere(marie, luc).` "Vrai"

  3. **Vrai si GP est parent d’un parent de E**
     requête: `?- grand_parent(sara, luc).` "Vrai"

  4. **Vrai si c'est le bon ancetre(A, E) (récursif)**
     requête: `?- ancetre(andre, luc).` "Vrai"
  
  5. **Vrai si il ont les mêmes parents alors frere_ou_soeur(A, B)**
      requête: `?- frere_ou_soeur(luc, X).` "False"
      
  Exercice 7 - Membre d’une liste
  Écrire la règle :
  `membre(X, [X|_]).`

  `membre(X, [_|T]) :-
      membre(X, T).`
  
  Exercice 8 - Maximum d’une liste <br>
  
  `max_liste([X], X).`

  `max_liste([H|T], Max) :-
      max_liste(T, MaxT),                     
      ( H > MaxT -> Max = H ; Max = MaxT ).`  
      
  Requête: `?- max_liste([5,8,2,9,4], M).`

  */
