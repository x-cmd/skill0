---
name: score
description: |
  Vážený bodovací framework po dimenzích pro AI agenty — "Nehádej. Boduj." Jádro: nejdřív pochopit
  potřeby, pak návrh a iterace, agent je analytik. Výstupem je seřazený TSV přes `x score compute`.
metadata:
  related: "rule,naming"
---


# Score
"Nehádej. Boduj."
Vážený bodovací framework po dimenzích pro AI agenty.
## Jak to používat
**Nejdřív pochopit, pak bodovat.** Než definuješ dimenze, Zeptej se na dost otázek. Špatné dimenze → špatná skóre, bez ohledu na přesnost.
**Navrhnout a iterovat.** Když nejsou potřeby zcela jasné, udělej standard podle nejlepšího úsilí, oboduj a ukaž výsledky. Uživatelé reagují na konkrétní žebříčky — "tento faktor má být vyšší", "přehlédl jsi X". To je signál. Zdokonal a oboduj znovu. Jedna iterace je lepší než deset kol hádání.
**Agent je analytik.** Po compute si přečti TSV. Vysvětli, proč X porazilo Y. Vyzdvihni překvapení. Navrhni úpravy. Žebříček konverzaci začíná, ne končí.
## Základní postup
```
① Understand needs  → ② Define score.yml  → ③ Score score.tsv  → ④ x score compute  → ⑤ Report & iterate
```
Výstup: `target, total, rank, block, reason, <dim> (X%), evidence`. Total 0–100, seřazeno sestupně. rank=1 je nejlepší.
## Příklad — pomoci uživateli rozhodnout se o propagačních sloganech
1. Dohodni se s uživatelem na hodnotících dimenzích a kritériích. Napiš `slogan.score.yml`.
2. AI oboduje každý slogan podle dimenzí (0–10, s důkazy) → `slogan.score.tsv`. Ponech total a rank prázdné.
3. `x score compute slogan.score.yml slogan.score.tsv` → doplní total + rank.
4. Přečti výsledky, dohodni se s uživatelem. Uprav skóre nebo přidej kandidáty, opakuj.
5. Nebo: `x score iter -f slogan.score.yml slogan.score.tsv "<feedback>"`
Další příklady: [EXAMPLE.md](EXAMPLE.md).
## Model se dvěma soubory
- `*.score.yml` — znovuvyužitelný standard: dimenze, faktory, popisy
- `**.score.tsv` — Cíle + skóre + důkazy; sloupec 1 = název cíle
`x score compute <yml> <tsv>` je totéž jako `python compute.py`.
## Scénáře použití
1. **Dává agentům rozhodovací workflow.** score.yml kotví agenta ke strukturovanému procesu — agent následuje standard, ne náladu poslední zprávy.
2. **Rozhodnutí jsou založená na pravidlech.** Dimenze × faktory × důkazy → vážený součet → rank. Každé skóre je ukotveno fakty. Zdůvodnění je průhledné.
3. **Ladí se na různé potřeby.** Vyměň dimenze, uprav faktory, přidej tvrdé filtry (sloupec `block`). Stejná šablona, jiní uživatelé.
4. **Vyvíjí se s tím, jak se potřeby vyjasňují.** Návrh → skóre → zpětná vazba → zjemnění → ostřejší.
5. **Standardní soubor + archivované výsledky pro jakýkoli skill.** score.yml = rozhodovací standard. score.tsv = záznam rozhodnutí. Obojí lze archivovat, revidovat a sdílet.
---
## Vzorec
```
total = Σ(factor × score) ÷ Σ(factor) × 10   →   0–100
```
- **factor** — celé číslo 1–10. Výchozí = 2. 1=zanedbatelný, 4=2×, 6=3×, 8=4×, 10=5×. Automaticky normalizováno.
- **score** — 0–10 za dimenzi, ukotveno důkazy.
- **total** — vážený součet 0–100.
Hlavičky dimenzí ukazují váhu v %: `factor ÷ Σ(factor) × 100`.
## Výstupní sloupce
| Sloupec | Zdroj | Popis |
|--------|--------|-------------|
| `target` | vstup | Název kandidáta |
| `total` | vypočteno | Vážené skóre (0–100) |
| `rank` | vypočteno | 1 = nejlepší. `X`, pokud zablokováno |
| `block` | vstup | Tvrdý filtr — neprázdné = diskvalifikováno, odsunuto dolů, rank=X |
| `reason` | vstup/výstup | Volitelné: poznámky AI k nuancím skóre |
| `<dim> (X%)` | vypočteno | Skóre podle dimenzí, hlavička ukazuje váhu v % |
| `evidence` | vstup | Fakta podporující každé skóre |
## Škála
- 9–10 — Vynikající — zcela splňuje kritéria
- 7–8 — Dobré — splňuje kritéria, drobná mezera
- 5–6 — Vyhovující — správný směr, významné opomenutí
- 3–4 — Slabé — značná mezera
- 1–2 — Neúspěch — jen okrajově řešeno
- 0 — N/A — neuplatňuje se
## Pravidla
1. **Ukotvení v důkazech** — každé skóre MUSÍ mít důkaz. Fakta, ne pocity.
2. **Používej celý rozsah** — 5 je střed, ne výchozí. 0 a 10 jsou vzácné, ale možné.
3. **Faktory jsou relativní zesilovače** — faktor 2 = 2× vliv faktoru 1. Automaticky normalizováno.
4. **Cíle jedinečné a neprázdné** — sloupec 1 každého řádku musí mít název cíle. Žádné duplicity, žádné prázdné hodnoty.
5. **Agent čte, reportuje, rozhoduje** — po compute vysvětli výsledky. Podle potřeby přeboduj nebo převáž.
## Soubory
- `SKILL.cn.md` — čínská verze
- `compute.py` — Validuje + vypočítává total + rank
- `template/*.score.yml` — 35+ šablon. `x score ls` vypíše, `x score init -t <name>` kopíruje
- `EXAMPLE.md` — Další příklady použití
- `rule-vs-score.md` — kdy použít rule vs score
- `score-template-writer.md` — jak psát bodovací šablony

## Související

- [rule](../rule/SKILL.md) — párový companion pro compliance
- [naming](../naming/SKILL.md) — zde se obodovávají kandidáti na názvy
