---
name: score
description: |
  Cadre de scoring par dimensions pondérées pour agents IA — « Ne devinez pas. Scorez. » Idée centrale : comprendre les besoins d'abord, brouillonner puis itérer, l'agent est l'analyste. Sortie en TSV classé via `x score compute`.
metadata:
  related: "rule,naming"
---


# Score
« Ne devinez pas. Scorez. »
Cadre de scoring par dimensions pondérées pour agents IA.
## Comment l'utiliser
**Comprendre d'abord, scorer ensuite.** Posez suffisamment de questions avant de définir les dimensions. Mauvaises dimensions → mauvais scores, quelle que soit la précision.
**Brouillonner puis itérer.** Quand les besoins ne sont pas pleinement clairs, faites un standard au meilleur effort, scorez, et montrez les résultats. Les utilisateurs réagissent à des classements concrets — « ce facteur devrait être plus haut », « vous avez oublié X ». C'est le signal. Affinez et re-scorez. Une itération vaut dix tours de devinette.
**L'agent est l'analyste.** Après le compute, lisez le TSV. Expliquez pourquoi X a battu Y. Mettez en avant les surprises. Suggérez des ajustements. Le classement ouvre la conversation, il ne la clôt pas.
## Flux principal
```
① Comprendre les besoins → ② Définir score.yml → ③ Scorer score.tsv → ④ x score compute → ⑤ Rapporter et itérer
```
Sortie : `target, total, rank, block, reason, <dim> (X%), evidence`. Total 0–100, trié décroissant. rank=1 meilleur.
## Exemple — aider un utilisateur à choisir des slogans promotionnels
1. Discutez avec l'utilisateur pour définir les dimensions et critères d'évaluation. Écrivez `slogan.score.yml`.
2. L'IA score chaque slogan par dimension (0–10, avec preuve) → `slogan.score.tsv`. Laissez total et rank vides.
3. `x score compute slogan.score.yml slogan.score.tsv` → remplit total + rank.
4. Lisez les résultats, discutez avec l'utilisateur. Ajustez les scores ou ajoutez des candidats, répétez.
5. Ou : `x score iter -f slogan.score.yml slogan.score.tsv "<feedback>"`
Plus d'exemples : [EXAMPLE.md](EXAMPLE.md).
## Modèle à deux fichiers
- `*.score.yml` — standard réutilisable : dimensions, facteurs, descriptions
- `**.score.tsv` — cibles + scores + preuves ; colonne 1 = nom de la cible
`x score compute <yml> <tsv>` équivaut à `python compute.py`.
## Scénarios d'application
1. **Donne aux agents un workflow de décision.** score.yml ancre l'agent à un processus structuré — l'agent suit le standard, pas l'humeur du dernier message.
2. **Les décisions sont basées sur des règles.** Dimensions × facteurs × preuves → total pondéré → rang. Chaque score est ancré sur des faits. Le raisonnement est transparent.
3. **S'accorde à différents besoins.** Échangez les dimensions, ajustez les facteurs, ajoutez des filtres durs (colonne `block`). Même modèle, utilisateurs différents.
4. **Évolue à mesure que les besoins se clarifient.** Brouillon → score → feedback → affinage → plus net.
5. **Fichier standard + résultats archivés pour n'importe quel skill.** score.yml = standard de décision. score.tsv = enregistrement de décision. Les deux archivables, révisables, partageables.
---
## Formule
```
total = Σ(factor × score) ÷ Σ(factor) × 10   →   0–100
```
- **factor** — entier 1–10. Base = 2. 1=mineur, 4=2×, 6=3×, 8=4×, 10=5×. Auto-normalisé.
- **score** — 0–10 par dimension, ancré sur des preuves.
- **total** — total pondéré 0–100.
Les en-têtes de dimension affichent le poids % : `factor ÷ Σ(factor) × 100`.
## Colonnes de sortie
| Colonne | Source | Description |
|---------|--------|-------------|
| `target` | entrée | Nom du candidat |
| `total` | calculé | Score pondéré (0–100) |
| `rank` | calculé | 1 = meilleur. `X` si bloqué |
| `block` | entrée | Filtre dur — non vide = disqualifié, envoyé en bas, rank=X |
| `reason` | entrée/sortie | Optionnel : notes de l'IA sur les nuances du score |
| `<dim> (X%)` | calculé | Scores par dimension, en-tête montre le poids % |
| `evidence` | entrée | Faits justifiant chaque score |
## Échelle
- 9–10 — Excellent — satisfait pleinement les critères
- 7–8 — Bon — satisfait les critères, écart mineur
- 5–6 — Adéquat — bonne direction, manque notable
- 3–4 — Faible — écart significatif
- 1–2 — Échec — à peine adressé
- 0 — N/A — non applicable
## Règles
1. **Ancrage par preuve** — chaque score DOIT avoir une preuve. Des faits, pas des impressions.
2. **Utilisez toute la plage** — 5 est le milieu, pas la valeur par défaut. 0 et 10 sont rares mais possibles.
3. **Les facteurs sont des amplificateurs relatifs** — facteur 2 = influence 2× du facteur 1. Auto-normalisé.
4. **Cibles uniques et non vides** — colonne 1, chaque ligne doit avoir un nom de cible. Pas de doublons, pas de blancs.
5. **L'agent lit, rapporte, décide** — après le compute, expliquez les résultats. Re-scorez ou re-pondérez au besoin.
## Fichiers
- `SKILL.cn.md` — version chinoise
- `compute.py` — Valide + calcule total + rang
- `template/*.score.yml` — 35+ modèles. `x score ls` liste, `x score init -t <name>` copie
- `EXAMPLE.md` — plus d'exemples d'usage
- `rule-vs-score.md` — quand utiliser rule vs score
- `score-template-writer.md` — comment écrire des modèles de scoring

## Related

- [rule](../rule/SKILL.md) — compagnon de conformité
- [naming](../naming/SKILL.md) — les noms candidats sont scorés ici
