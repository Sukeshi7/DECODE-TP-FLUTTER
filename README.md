# Sujet de Test Flutter – Gestion de Produits

## Objectif

Développer une application Flutter permettant de **consulter, créer, modifier et supprimer des
produits** à l’aide d’une API REST.

Swagger : https://decode-api-3f85320eb5b9.herokuapp.com/api-docs/

---

## Fonctionnalités attendues

### 1. Liste des produits - 3 points

- Récupérer la liste des produits via l'endpoint :
  ```GET https://decode-api-3f85320eb5b9.herokuapp.com/products```
- Afficher chaque produit dans une **liste scrollable**, avec :
    - **Nom** du produit
    - **Image**
    - **Prix**

---

### 2. Création d’un produit - 3 points

- Ajouter un bouton **“Ajouter un produit”** sur la page de listing.
- Rediriger vers une page avec un **formulaire** contenant les champs suivants :
    - `name` : Nom du produit
    - `description` : Description
    - `price` : Prix
    - `image` : Point Bonus, l'image est optionnelle, mais si elle est fournie, elle doit être
      envoyée au format base64. (Voir Swagger)
- Validation des champs du formulaire.
- Envoyer les données via une requête
  ```POST https://decode-api-3f85320eb5b9.herokuapp.com/products```

---

### 3. Édition d’un produit - 3 points

- Au clic sur un produit, rediriger vers un **formulaire** avec les informations du produit.
- Soumettre les modifications via une requête ```PUT https://decode-api-3f85320eb5b9.herokuapp.com/products/{uuid}```
- Validation des champs du formulaire.
- Rediriger vers la page de liste des produits.

---

### 4. Suppression d’un produit - 3 points

- Depuis la liste des produits, ouvrir une modale pour supprimer un produit.
- Soumettre la suppression via une requête ```DELETE https://decode-api-3f85320eb5b9.herokuapp.com/products/{uuid}```
- Rediriger vers la page de liste des produits.

---

### 5. Rechercher un produit - 3 points

- Créer une barre de recherche sur le listing de produits avec un debounce pour éviter de spam
  l'API.
- Rechercher via l'endpoint : ```GET https://decode-api-3f85320eb5b9.herokuapp.com/products?search_value={query}```

---

## Contraintes techniques

- Utiliser le package [`http`](https://pub.dev/packages/http) pour les appels réseau.
- Utiliser le package [`go_router`](https://pub.dev/packages/go_router) pour gérer la **navigation**.

---

## Packages interdits

- Package de gestion d'état (ex : riverpod, bloc, etc.)
- Package de gestion de formulaire (ex : flutter_form_builder, etc.)
- Package de gestion de requêtes réseau (ex : dio, etc.)

---

## Bonus - 4 points

- Upload d'image sur un produit via un package comme file_picker ou image_picker ou les deux.
- Affichage de messages de succès/erreur après l'ajout, modification ou suppression d'un produit.
- Gestion d’un état de chargement (shimmer, progress-indicator).
- Scroll infini pour charger plus de produits.

---

## Qualité du code - 1 point

- Code propre, lisible et bien structuré.
- Utilisation de bonnes pratiques Flutter

## Rendu

- Heure maximum du dernier commit : ```10h30```
- Envoyer le lien de votre projet **Github/GitLab** à l'adresse mail suivante :
  ```coichot.t@gmail.com```. ⚠️ N'oubliez pas de mettre le repo en publique ⚠️
- Objet du mail : ```DECODE TP Flutter - NOM Prénom```

