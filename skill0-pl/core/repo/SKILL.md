---
name: repo
description: Konwencja i narzędzia określające, gdzie mieszkają repozytoria klonowane przez agentów i jak ułożone są ich drzewa robocze. Domyślne repozytorium bare w `~/.x-repo/.bare/<provider>/<owner>/<name>.git` z podłączonymi drzewami roboczymi pod `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]`. Wykrywane przez `x repo ls`. Zarządzanie drzewami roboczymi przez `x repo wt`. Użyj dla „gdzie klonować", „ścieżki git clone", „układu przestrzeni roboczej", „repozytoriów współdzielonych między agentami", „ścieżki drzewa roboczego".
metadata:
  related: "git"
---

# repo

## Dlaczego

Wszystkie klony zbiegają się w `~/.x-repo/<provider>/<owner>/<name>`. Ta sama ścieżka dla każdego agenta, człowieka, CI — można ją podmontować w kontenerach lub piaskownicach agentów, by dzielić repozytorium bez ponownego klonowania. Jeden katalog główny do kopii zapasowej; wykrywalny przez `x repo ls`. Układ odzwierciedla ścieżki githuba, więc `../<sibling>` z dowolnego drzewa roboczego prowadzi do domyślnego drzewa roboczego tego rodzeństwa — konfiguracje i skrypty odwołujące się do rodzeństwa działają tak samo we wszystkich wt i we wszystkich agentach.

## Układ ścieżek

- bare: `~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- domyślne wt: `~/.x-repo/<provider>/<owner>/<name>`
- zaprojektowane wt: `~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` — wtname to dowolny identyfikator tej przestrzeni roboczej: nazwa agenta/workera, nazwa gałęzi, tag, krótki SHA, identyfikator issue, dowolny ciąg znaków. `/` w wtname jest kodowane jako `~`.

Domyślnie repozytoria są bare z podłączonymi drzewami roboczymi — bare w `.bare/`, w katalogu oddzielnym od drzew roboczych, więc `rm -rf` jednego wt nie może go dosięgnąć. Zwykłe `git clone` też jest akceptowane (`x repo ls/which/update` je widzi), ale bez ochrony geometrycznej. W takim przypadku bądź ostrożny: nie używaj `rm -rf`, preferuj `git worktree remove` i unikaj heurystyk sprzątających celujących w `.git/`. Praca w trakcie zadania utracona w ten sposób nie da się już powiązać z oryginalnym repozytorium.

## Polecenia

```bash
x repo <id>                      # cd do domyślnego wt (klonuje automatycznie, jeśli brak)
x repo wt <id> <wtname>          # podłącz do istniejącej gałęzi lub utwórz nową z HEAD
x repo wt ls <id>                # wypisz wt
x repo wt rm <id> <wtname>       # usuń bezpiecznie (użyj tego, a nie rm -rf)
x repo update <id>               # odśwież domyślne wt po zmianach w źródle
x repo ls [--raw|--tsv]          # wykryj, co jest sklonowane
x repo which <id>[@<wtname>]     # rozwiąż id do ścieżki bezwzględnej
```

## Nie rób

- `rm -rf` na zaprojektowanym drzewie roboczym. Zostawia nieaktualne wpisy w rejestrze `worktrees/` repozytorium bare. Użyj `x repo wt rm`. Jeśli musisz, uruchom potem `git -C <bare> worktree prune`.

## Powiązane

- [doc/path-layout.md](doc/path-layout.md) — pełna gramatyka ścieżek i nazewnictwo drzew roboczych
- [doc/workflow.md](doc/workflow.md) — procedura operacyjna i zasady czyszczenia bez usuwania
- [doc/design.md](doc/design.md) — dlaczego układ ma właśnie taki kształt