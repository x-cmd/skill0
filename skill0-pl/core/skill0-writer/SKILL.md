---
name: skill0-writer
description: Konwencje pisania dokumentów skill0 — struktura piramidy, limity linii i reguły układu.
metadata:
  related: "yfm,naming"
---

# skill0-writer

Dokumenty skill0 stosują **zasadę piramidy**: agenci mogą przeczytać tylko pierwsze 10–30 linii, więc najważniejsza informacja musi być na początku. Szczegóły po linii 30 to bonus, a nie ciężar.

## Rzeczy, których żadna reguła nie złapie

- **Jasność ważniejsza od zwięzłości.** Krótki dokument dający błędną odpowiedź jest gorszy niż długi, który daje poprawną.
- **Ostrzeżenia o bezpieczeństwie MUSZĄ być jawne** — używaj MUST, NEVER, DO NOT. Zastrzeżenia formułuj jako pełne zdania, a nie wtrącenia w nawiasie.
- **Nie rozwlejaj wiedzy pospolitej.** Jeśli słowo-klucz w rodzaju konwencji plus jedno-dwa zdania wystarcza, skończ. Czytelnik już wie, czym są YAML, git i cache; wykorzystaj kontekst na to, co jest swoiste dla tego repozytorium. Uzasadnianie to najczęstszy grzesz — podaj powód reguły tylko wtedy, gdy bez niego wygląda ona źle. (`sw-1200`)
- **Tabele tylko dla prawdziwych macierzy.** 3+ kolumn, których wiersze trzeba czytać względem siebie. Tabela dwukolumnowa to lista w składni tabelarycznej — napisz listę. Zbiór danych należy do zewnętrznego `.tsv` obok dokumentu, podlinkowanego, aby `x tsv` mógł go odpytywać. (`sw-1250`)

## YFM — tylko `SKILL.md`

```yaml
---
name: <slug>                  # musi być równe nazwie katalogu
description: <1-2 zdania, z których agent korzysta, by zdecydować, czy wczytać>
---
```

`name` i `description` są niezbędne. Wszystko inne zagnieżdża się w bloku `metadata:` opisanym w [yfm](../yfm/SKILL.md) jako skalary rozdzielone przecinkami — opcjonalne, a daje strukturę dla indeksowania, odkrywania i zaczepów ontologicznych.

**Pliki podrzędne nie mają YFM.** Tylko `SKILL.md` jest filtrowany przez loader, więc tylko on potrzebuje front matter. Każdy inny plik (`references/*`, `usecase/*`, `EXAMPLE.md`, `*.report.md` …) czyta agent, który już postanowił go otworzyć — YFM jest tam czystym kosztem tokenów, powtarza cel, który tytuł i pierwsze zdanie już oddają. Rozpoczynaj te pliki od nagłówka `#`. Odstępienie wymaga uzasadnienia podanego w samym pliku.

Wersje zlokalizowane na chiński twórz jako równoległy `SKILL.cn.md` (jeden na umiejętność). Nie mieszaj języków w jednym pliku.

## Kontrole mechaniczne

Mieszkają w [skill0-writer.rule.yml](skill0-writer.rule.yml). Uruchom `x rule lint skill0-writer.rule.yml` oraz `x rule check -r skill0-writer.rule.yml lib/skill0/`. Zakres: obecność YFM + pola name/description, format nazwy, liczba linii ≤ 100 (idealnie 50), kolejność sekcji install → usage → advanced → links, tylko angielski, bez wstępu / bez podsumowania / bez powtórzeń, bez osieroconych plików.

## Kontrola bezpieczeństwa przy ucięciu

Po napisaniu zajrzyj do linii 30: czy agent, który tu się zatrzyma, wyłoniłby błędne rozumienie?

Jeśli tak, przesuń istotne zastrzeżenie wyżej. Pierwsze 30 linii musi dać poprawny (choć niepełny) model mentalny. Po linii 30 rozwijaj szczegóły — piramida sama się poprawia.

## Dwuwarstwowe ładowanie: description do dopasowania, treść jako referencja

Loadery umiejętności (Claude Code, Cursor, Continue itd.) ładują SKILL.md w dwóch etapach:

  1. **YFM `description:`** — automatycznie ładowane do katalogu agenta
     do dopasowania. Agent czyta opis, aby zdecydować, czy
     wczytać umiejętność.
  2. **Treść** — ładowana na żądanie po dopasowaniu. Materiał referencyjny.

Konsekwencje:

- **Description** = *czym to jest + kiedy wczytać* — gęste od
  słów kluczowych, bogate w wyzwalacze, zwięzłe.
- **Treść** = *jak używać + referencja* — przykłady, schematy, przypadki
  brzegowe, odsyłacze do głębszej dokumentacji.

**Nie duplikuj treści między warstwami.** Cokolwiek przekazuje description, treść powinna *to rozwijać*, a nie powtarzać powierzchniowo. W szczególności pierwszy akapit treści nie może wymieniać tych samych funkcji co description — treść zaczyna się od referencji, a nie od drugiego streszczenia.

Praktyczny test: jeśli usuniesz description w całości i przeczytasz tylko pierwsze 30 linii treści, agent nadal powinien widzieć, czego umiejętność dotyczy i kiedy ją wczytać. Jeśli tę informację niesie wyłącznie description, treść nie ma nic do wniesienia na początku — przenieś wyjaśnienie do treści, a niech description niechaj zostanie nagłówkiem.

## Umiejętność to pakiet wiedzy, nie tutorial

Treść umiejętności to **odprawa dla LLM**, nie kurs dla początkującego.

- **Możliwości** mieszkają w LLM. Treść nie uczy.
- **Wiedza** mieszka w narzędziach danych x-cmd (`x wkp` / `x rfc` / `x cve`, NVD / MITRE / GHSA) i źródłach zewnętrznych. Treść wskazuje; agent pobiera ponownie.
- **Ramowanie** to zadanie umiejętności: nazywa kształt problemu, konwencję, ustrukturyzowane wyjście, narzędzie x-cmd do użycia.

Umiejętność niesie kąt rozwiązania, konwencję, kształt wyjścia i wskaźniki do źródeł. **Nie** niesie możliwości (LLM już je ma), danych statycznych (czechną) ani tutoriali (używaj sidecarów).

Tam, gdzie szczegóły są zbyt rozbudowane lub zbyt aktualne, odłóż je do sidecara (`references/`, `ANALYTICS.md`) lub zewnętrznej, stale aktualizowanej dokumentacji.

## Odnośniki zewnętrzne

Zbieraj dwa typy: **odnośniki główne** (punkty wejścia takie jak `llms.txt`, indeks dokumentacji) i **odnośniki przydatne** (celowane linki do 20% dokumentacji, która pokrywa 80% przypadków użycia). Wymieniaj najpierw główne, potem przydatne — AI rozumie kolejność. **Bez duplikacji**, chyba że podkreślenie jest krytyczne.

## Miękkie zastrzeżenia (oceny sytuacyjne)

- **Pliki podrzędne (CLEANUP.md, references/*)** mogą być dłuższe niż SKILL.md, ale pierwsze 20 linii nadal niesie ciężar (ta sama piramida).
- **MUST** linkować do każdego pliku podrzędnego z jego nadrzędnego SKILL.md (wymagany odnośnik w przód). Odnośnik wstecz do nadrzędnego SKILL.md z pliku podrzędnego jest **opcjonalny** — pliki usecase odwołują się do rodzica implicite przez swoją ścieżkę. Egzekwowane przez `sw-1000-no-orphan-docs` w [skill0-writer.rule.yml](skill0-writer.rule.yml).
- **Spekulacje** — podawaj fakty sprawdzone albo oznacz „nieprzetestowane".
- **Emoji**, chyba że temat umiejętności tego wymaga.

## Powiązane

- [yfm](../yfm/SKILL.md) — konwencja YFM, której warstwy 1 egzekwuje skill0-writer
- [naming](../naming/SKILL.md) — nazewnictwo też stosuje reguły writer
- [skill0-writer.rule.yml](skill0-writer.rule.yml) — egzekwowanie mechaniczne