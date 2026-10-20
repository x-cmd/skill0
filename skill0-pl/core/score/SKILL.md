---
name: score
description: |
  Ramka ważonego punktowania według wymiarów dla agentów AI — "Nie zgaduj. Punktuj." Istota: najpierw zrozum potrzeby, potem szkicuj i iteruj, agent jest analitykiem. Wynikiem jest uszeregowany TSV z `x score compute`.
metadata:
  related: "rule,naming"
---


# Score
"Nie zgaduj. Punktuj."
Ramka ważonego punktowania według wymiarów dla agentów AI.
## Jak używać
**Najpierw zrozum, potem punktuj.** Zadaj wystarczająco dużo pytań, zanim zdefiniujesz wymiary. Złe wymiary → złe wyniki, niezależnie od precyzji.
**Szkicuj, potem iteruj.** Gdy potrzeby nie są do końca jasne, zrób standard najlepszym możliwym wysiłkiem, punktuj i pokaż wyniki. Użytkownicy reagują na konkretne rankingi — „ten czynnik powinien mieć wyższą wagę", „pominąłeś X". To jest sygnał. Doprecyzuj i punktuj ponownie. Jedna iteracja bije dziesięć rund zgadywania.
**Agent jest analitykiem.** Po compute przeczytaj TSV. Wyjaśnij, dlaczego X wygrał z Y. Wskaż zaskoczenia. Zaproponuj korekty. Ranking zaczyna rozmowę, a nie ją kończy.
## Główny przepływ
```
① Zrozum potrzeby  →  ② Zdefiniuj score.yml  →  ③ Punktuj score.tsv  →  ④ x score compute  →  ⑤ Raportuj i iteruj
```
Wyjście: `target, total, rank, block, reason, <dim> (X%), evidence`. Suma 0–100, posortowane malejąco. rank=1 najlepszy.
## Przykład — pomaganie użytkownikowi w wyborze haseł promocyjnych
1. Omów z użytkownikiem wymiary i kryteria oceny. Zapisz `slogan.score.yml`.
2. AI punktuje każde hasło w każdym wymiarze (0–10, z dowodami) → `slogan.score.tsv`. Zostaw sumę i ranking puste.
3. `x score compute slogan.score.yml slogan.score.tsv` → wypełnia sumę i ranking.
4. Przeczytaj wyniki, porozmawiaj z użytkownikiem. Popraw punktację lub dodaj kandydatów, powtórz.
5. Albo: `x score iter -f slogan.score.yml slogan.score.tsv "<uwagi>"`
Więcej przykładów: [EXAMPLE.md](EXAMPLE.md).
## Model dwóch plików
- `*.score.yml` — Standard wielokrotnego użytku: wymiary, czynniki, opisy
- `**.score.tsv` — Cele + punktacja + dowody; kolumna 1 = nazwa celu
`x score compute <yml> <tsv>` działa tak samo jak `python compute.py`.
## Scenariusze zastosowania
1. **Daje agentom przepływ decyzyjny.** score.yml zakotwicza agenta w ustrukturyzowanym procesie — agent podąża za standardem, a nie za nastrojem ostatniej wiadomości.
2. **Decyzje opierają się na regułach.** Wymiary × czynniki × dowody → ważona suma → ranking. Każdy wynik zakotwiczony w faktach. Rozumowanie jest przejrzyste.
3. **Dostraja się do różnych potrzeb.** Podmień wymiary, dostosuj czynniki, dodaj twarde filtry (kolumna `block`). Ten sam szablon, różni użytkownicy.
4. **Rozwija się wraz z klarowaniem potrzeb.** Szkic → punktacja → uwagi → doprecyzowanie → ostrzejsza.
5. **Plik standardu + zarchiwizowane wyniki dla każdej umiejętności.** score.yml = standard decyzji. score.tsv = zapis decyzji. Oba można archiwizować, przeglądać i udostępniać.
---
## Wzór
```
total = Σ(faktor × score) ÷ Σ(faktor) × 10   →   0–100
```
- **factor** — liczba całkowita 1–10. Wartość bazowa = 2. 1=niski, 4=2×, 6=3×, 8=4×, 10=5×. Normalizowany automatycznie.
- **score** — 0–10 dla każdego wymiaru, zakotwiczony w dowodach.
- **total** — ważona suma 0–100.
Nagłówki wymiarów pokazują wagę w procentach: `factor ÷ Σ(faktor) × 100`.
## Kolumny wyjściowe
| Kolumna | Źródło | Opis |
|--------|--------|-------------|
| `target` | wejście | Nazwa kandydata |
| `total` | wyliczane | Wynik ważony (0–100) |
| `rank` | wyliczane | 1 = najlepszy. `X` jeśli zablokowany |
| `block` | wejście | Twardy filtr — niepusty = dyskwalifikacja, przesunięcie na dół, rank=X |
| `reason` | wejście/wyjście | Opcjonalnie: uwagi AI o niuansach punktacji |
| `<dim> (X%)` | wyliczane | Punktacja w wymiarach, nagłówek pokazuje wagę w % |
| `evidence` | wejście | Fakty uzasadniające każdy wynik |
## Skala
- 9–10 — Doskonale — w pełni spełnia kryteria
- 7–8 — Dobrze — spełnia kryteria, drobna luka
- 5–6 — Zadowalająco — dobry kierunek, zauważalne przeoczenie
- 3–4 — Słabo — znaczna luka
- 1–2 — Nie — ledwo poruszone
- 0 — Nie dotyczy — nie ma zastosowania
## Reguły
1. **Zakotwiczenie w dowodach** — każdy wynik MUSI mieć dowód. Fakty, nie odczucia.
2. **Używaj całego zakresu** — 5 to środek skali, nie domyślna wartość. 0 i 10 są rzadkie, ale możliwe.
3. **Czynniki to względne wzmacniacze** — czynnik 2 = 2× wpływ czynnika 1. Normalizowane automatycznie.
4. **Cele unikalne i niepuste** — kolumna 1 w każdym wierszu musi zawierać nazwę celu. Bez duplikatów, bez pustych pól.
5. **Agent czyta, raportuje, decyduje** — po compute wyjaśnij wyniki. W razie potrzeby punktuj ponownie lub zmień wagi.
## Pliki
- `SKILL.cn.md` — wersja chińska
- `compute.py` — waliduje + wylicza sumę i ranking
- `template/*.score.yml` — 35+ szablonów. `x score ls` je wypisuje, `x score init -t <nazwa>` kopiuje
- `EXAMPLE.md` — więcej przykładów użycia
- `rule-vs-score.md` — kiedy stosować regułę, a kiedy ocenę
- `score-template-writer.md` — jak pisać szablony punktacji

## Powiązane

- [rule](../rule/SKILL.md) — powiązana umiejętność zgodności
- [naming](../naming/SKILL.md) — tutaj punktowane są nazwy kandydatów