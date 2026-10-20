---
name: score
description: |
  Framework de scoring pe dimensiuni ponderate pentru agenți AI — "Nu ghici. Scoruiește." Ideea de bază: întâi înțelege nevoile, apoi fă un draft și iterează, agentul e analistul. Produce TSV clasat prin `x score compute`.
metadata:
  related: "rule,naming"
---


# Score
„Nu ghici. Scoruiește."
Framework de scoring pe dimensiuni ponderate pentru agenți AI.
## Cum să-l folosești
**Întâi înțelege, apoi scoruiește.** Pune suficiente întrebări înainte de a defini dimensiunile. Dimensuni greșite → scoruri greșite, oricât de precisă ar fi calculul.
**Fă draft, apoi iterează.** Când nevoile nu sunt clare, fă un standard «de un efort rezonabil», scoruiește și arată rezultatele. Utilizatorii reacționează la clasamente concrete — „acest factor ar trebui să fie mai mare", „ai omis X". Asta e semnalul. Rafinează și rescoruiește. O iterație bate zece runde de ghicit.
**Agentul e analistul.** După compute, citește TSV-ul. Explică de ce X l-a bătut pe Y. Scoate în evidență surprizele. Sugerează ajustări. Clasamentul începe conversația, nu o încheie.
## Fluxul principal
```
① Înțelege nevoile  → ② Definește score.yml  → ③ Scoruiește score.tsv  → ④ x score compute  → ⑤ Raportează și iterează
```
Ieșire: `target, total, rank, block, reason, <dim> (X%), evidence`. Total 0–100, sortat descrescător. rank=1 e cel mai bun.
## Exemplu — ajutarea unui utilizator să aleagă sloganuri promoționale
1. Discută cu utilizatorul ca să definezi dimensiunile și criteriile de evaluare. Scrie `slogan.score.yml`.
2. AI-ul scoruiește fiecare slogan pe dimensiuni (0–10, cu dovezi) → `slogan.score.tsv`. Lasă total și rank goale.
3. `x score compute slogan.score.yml slogan.score.tsv` → completează total + rank.
4. Citește rezultatele, discută cu utilizatorul. Ajustează scorurile sau adaugă candidați, repetă.
5. Sau: `x score iter -f slogan.score.yml slogan.score.tsv "<feedback>"`
Mai multe exemple: [EXAMPLE.md](EXAMPLE.md).
## Modelul cu două fișiere
- `*.score.yml` — Standard reutilizabil: dimensiuni, factori, descrieri
- `**.score.tsv` — Ținte + scoruri + dovezi; coloana 1 = numele țintei
`x score compute <yml> <tsv>` e identic cu `python compute.py`.
## Scenarii de aplicare
1. **Oferă agenților un flux de decizie.** score.yml ancorează agentul într-un proces structurat — agentul urmează standardul, nu dispoziția mesajului din urmă.
2. **Deciziile se bazează pe reguli.** Dimensuni × factori × dovezi → total ponderat → rang. Fiecare scor e ancorat în fapte. Raționamentul e transparent.
3. **Se adaptează la nevoi diferite.** Schimbă dimensiunile, ajustează factorii, adaugă filtre dure (coloana `block`). Același șablon, utilizatori diferiți.
4. **Evoluează pe măsură ce nevoile se clarifică.** Draft → scor → feedback → rafinare → mai ascuțit.
5. **Fișier standard + rezultate arhivate pentru orice skill.** score.yml = standardul de decizie. score.tsv = procesul-verbal al deciziei. Ambele arhivabile, reviewabile, partajabile.
---
## Formula
```
total = Σ(factor × score) ÷ Σ(factor) × 10   →   0–100
```
- **factor** — întreg 1–10. Baza = 2. 1=minor, 4=2×, 6=3×, 8=4×, 10=5×. Normalizat automat.
- **score** — 0–10 pe dimensiune, ancorat în dovezi.
- **total** — total ponderat 0–100.
Antetele dimensiunilor arată procentul de pondere: `factor ÷ Σ(factor) × 100`.
## Coloanele de ieșire
| Coloană | Sursă | Descriere |
|--------|--------|-------------|
| `target` | intrare | Numele candidatului |
| `total` | calculat | Scor ponderat (0–100) |
| `rank` | calculat | 1 = cel mai bun. `X` dacă e blocat |
| `block` | intrare | Filtru dur — nevid = descalificat, împins la final, rank=X |
| `reason` | intrare/ieșire | Opțional: note ale AI-ului despre nuanțele scorului |
| `<dim> (X%)` | calculat | Scoruri pe dimensiuni, antetul arată ponderea % |
| `evidence` | intrare | Fapte care susțin fiecare scor |
## Scala
- 9–10 — Excelent — îndeplinește complet criteriile
- 7–8 — Bun — îndeplinește criteriile, cu mici lipsuri
- 5–6 — Adequat — direcția e corectă, dar lipsește ceva notabil
- 3–4 — Slab — lacună semnificativă
- 1–2 — Dezastru — abia atins subiectul
- 0 — N/A — nu se aplică
## Rules
1. **Ancorare în dovezi** — fiecare scor TREBUIE să aibă dovezi. Fapte, nu senzații.
2. **Folosește toată scala** — 5 e mijlocul, nu implicitul. 0 și 10 sunt rare, dar posibile.
3. **Factorii sunt amplificatori relativi** — factorul 2 = influență de 2× față de factorul 1. Normalizat automat.
4. **Ținte unice și nevide** — coloana 1 a fiecărui rând trebuie să aibă un nume de țintă. Fără duplicate, fără goluri.
5. **Agentul citește, raportează, decide** — după compute, explică rezultatele. Rescoruiește sau reponderază după nevoie.
## Files
- `SKILL.cn.md` — versiunea în chineză
- `compute.py` — Validează + calculează total + rank
- `template/*.score.yml` — 35+ șabloane. `x score ls` le listează, `x score init -t <name>` copiază
- `EXAMPLE.md` — Mai multe exemple de folosire
- `rule-vs-score.md` — Când să folosești rule vs score
- `score-template-writer.md` — Cum scrii șabloane de scoring

## Related

- [rule](../rule/SKILL.md) — companionul de conformitate
- [naming](../naming/SKILL.md) — numele candidaților sunt scoruite aici