# First Tri — Landing page

Mesurer la demande pour le **Toulouse Triathlon 2026 · XS (Supertri)**.  
Stack : **GitHub Pages** (site) + **Supabase** (inscriptions).

---

## Ce que contient le site

- **Hero** : « Réunis ton groupe pour le triathlon XS de Toulouse »
- **Carte événement** : Supertri, 4 oct. 2026, Prairie des Filtres
- **Formulaire** : prénom, email, ville, taille du groupe, personnes intéressées, déjà fait un tri ?
- L'événement est enregistré automatiquement à chaque inscription

---

## Étape 1 — Supabase : créer le projet

1. Va sur [supabase.com](https://supabase.com) → connecte-toi
2. **New project**
   - Name : `first-tri`
   - Database password : note-la
   - Region : **West EU (Paris)**
3. Attends ~2 min

---

## Étape 2 — Supabase : créer la table

1. Menu gauche → **SQL Editor** → **New query**
2. Ouvre le fichier `supabase/schema.sql` de ce projet
3. Copie-colle tout → **Run**

Vérifie : **Table Editor** → table `signups` (vide).

Colonnes enregistrées à chaque inscription :
- `prenom`, `email`, `ville`, `group_size`, `interested_count`, `already_done`
- `event_name` → Toulouse Triathlon 2026 (auto)
- `distance` → XS (Super Sprint) (auto)
- `preferred_date` → Dimanche 4 octobre 2026 (auto)

---

## Étape 3 — Supabase : récupérer les clés

1. **Project Settings** (engrenage) → **API**
2. Copie :
   - **Project URL** → ex. `https://abcdefgh.supabase.co`
   - **anon public** → clé qui commence par `eyJ...`

⚠️ Utilise la clé **anon**, pas `service_role`.

---

## Étape 4 — Configurer le site

Ouvre `config.js` et remplace les placeholders :

```js
const SUPABASE_URL = 'https://TON-PROJECT.supabase.co';
const SUPABASE_ANON_KEY = 'eyJ...';

const EVENT = {
  name: 'Toulouse Triathlon 2026',
  distance: 'XS (Super Sprint)',
  date: 'Dimanche 4 octobre 2026',
  location: 'Prairie des Filtres, Toulouse',
  format: '400 m natation · 10 km vélo · 2,5 km course',
  url: 'https://www.active.com/toulouse/triathlon/toulouse-triathlon-2026',
};
```

L'événement est déjà bon — tu n'as qu'à remplir les 2 lignes Supabase.

---

## Étape 5 — Tester en local

```bash
cd "/Users/valentinpruvost/Desktop/First Tri"
npx serve .
```

1. Ouvre http://localhost:3000
2. Vérifie le hero + la carte événement
3. Remplis le formulaire avec un email test
4. Va dans Supabase → **Table Editor** → `signups` → la ligne doit apparaître

Vérifie que `event_name`, `distance` et `preferred_date` sont remplis automatiquement.

---

## Étape 6 — GitHub : pousser le code

1. [github.com](https://github.com) → **New repository** → nom : `first-tri` → **Create**

2. Dans le terminal :

```bash
cd "/Users/valentinpruvost/Desktop/First Tri"
git init
git add .
git commit -m "First Tri landing — Toulouse Triathlon XS 2026"
git remote add origin https://github.com/TON-USERNAME/first-tri.git
git branch -M main
git push -u origin main
```

---

## Étape 7 — GitHub Pages : mettre en ligne

1. Repo → **Settings** → **Pages**
2. **Source** : Deploy from a branch
3. **Branch** : `main` → `/ (root)` → **Save**
4. Attends 1–2 min

Ton site sera live sur :  
**https://first-tri.github.io/first-tri/**

Teste le formulaire en production → vérifie Supabase.

---

## Étape 8 — Voir les inscriptions

Supabase → **Table Editor** → `signups`

| Colonne | Importance |
|---|---|
| **interested_count** | ⭐ Le plus important — combien de personnes avec le lead |
| email, prenom, ville | Contact |
| group_size | Taille du groupe |
| already_done | Niveau d'expérience |
| event_name, distance, preferred_date | Remplis auto (Toulouse XS, 4 oct.) |

---

## Dépannage

| Problème | Solution |
|---|---|
| Formulaire ne marche pas | Vérifie `config.js` (URL + clé anon) |
| Erreur permission / RLS | Ré-exécute `supabase/schema.sql` |
| Site 404 | URL = `github.io/NOM-DU-REPO/` |
| Colonne manquante | Exécute `supabase/migration-event.sql` |

---

## Fichiers du projet

```
First Tri/
├── index.html          ← landing page
├── config.js           ← clés Supabase + événement
├── supabase/
│   ├── schema.sql      ← à exécuter dans Supabase
│   └── migration-event.sql
└── README.md
```
