---
name: skill0-writer
description: Konvence psaní dokumentů skill0 — pyramídová struktura, limity počtu řádků a pravidla rozvržení.
metadata:
  related: "yfm,naming"
---

# skill0-writer

Dokumenty skill0 se řídí **pyramídovým principem**: agent si může přečíst jen prvních 10–30 řádků, takže nejdůležitější informace musí být na začátku. Detail po 30. řádku je bonus, ne náklad.

## Co žádné pravidlo nechytí

- **Srozumitelnost před stručností.** Krátký dokument, který dává špatnou odpověď, je horší než dlouhý, který dává správnou.
- **Bezpečnostní výhrady MUSÍ být výslovné** — používejte MUSÍ, NIKDY, NEPOUŽÍVEJ. Výhrady formulujte jako celé výroky, ne jako vsuvky v závorce.
- **Nerozšiřujte obecné znalosti.** Pokud konvenci vystihne jedno slovo plus jedna či dvě věty, končete. Čtenář už ví, co je YAML, git a cache; kontext věnujte tomu, co je specifické pro tento repo. Zdůvodnění bývá nejčastějším viníkem — důvod pravidla uvádějte jen tehdy, když bez něj působí divně. (`sw-1200`)
- **Tabulky jen pro skutečné matice.** 3+ sloupců, jejichž řádky se musí číst proti sobě. Dvousloupcová tabulka je seznam v tabulkové syntakti — napište seznam. Datová sada patří do externího `.tsv` vedle dokumentu, na který se odkáže, aby ji šlo dotazovat přes `x tsv`. (`sw-1250`)

## YFM — pouze `SKILL.md`

```yaml
---
name: <slug>                  # musí být shodné s názvem adresáře
description: <shrnutí na 1–2 věty, podle kterého agent rozhodne, zda skill načte>
---
```

`name` a `description` jsou nosné. Vše ostatní se vnořuje pod blok `metadata:` z [yfm](../yfm/SKILL.md) jako skalární hodnoty oddělené čárkami — volitelné, přidává strukturu pro indexování, vyhledávání a ontologické háčky.

**Dílčí soubory nenesou YFM.** Filtruje se pouze `SKILL.md`, takže front matter potřebuje jen on. Každý další soubor (`references/*`, `usecase/*`, `EXAMPLE.md`, `*.report.md` …) čte agent přímo, a už se rozhodl, že ho otevře — YFM v něm je čistá spotřeba tokenů, protože opakuje účel, který už sdělují titulek a první řádek. Tyto soubory začínejte nadpisem `#`. Odchylka vyžaduje uvedený důvod přímo v souboru.

Pro čínské lokalizované verze použijte paralelní `SKILL.cn.md` (jedna na skill). Nemíchejte jazyky v jednom souboru.

## Mechanické kontroly

Žijí v [skill0-writer.rule.yml](skill0-writer.rule.yml). Spusťte `x rule lint skill0-writer.rule.yml` a `x rule check -r skill0-writer.rule.yml lib/skill0/`. Pokrytí: přítomnost YFM + polí name/description, formát name, počet řádků ≤ 100 (ideálně 50), pořadí sekcí install → usage → advanced → links, pouze angličtina, žádný úvod / žádný závěr / žádné opakování, žádné osiřelé soubory.

## Kontrola bezpečnosti při useknutí

Po napsání zkontrolujte 30. řádek: vytvořil by si agent, který tady skončí, chybné pochopení?

Pokud ano, přesuňte kritickou kvalifikaci dřív. Prvních 30 řádků musí dát správný (byť neúplný) mentální model. Po 30. řádku rozšiřujte detaily — pyramída se sama opravuje.

## Dvouvrstvé načítání: description pro párování, body jako referenční materiál

Načítače skillů (Claude Code, Cursor, Continue atd.) načítají SKILL.md ve dvou fázích:

  1. **YFM `description:`** — automaticky se načítá do katalogu agenta
     pro párování. Agent přečte description a rozhodne se,
     zda skill načte.
  2. **Body** — načítá se na vyžádání po shodě. Referenční materiál.

Důsledky:

- **Description** = *co to je + kdy to načíst* — husté na klíčová slova,
  bohaté na spouštěče, stručné.
- **Body** = *jak to používat + reference* — příklady, schémata, okrajové
  případy, odkazy na hlubší dokumentaci.

**Neopakujte obsah mezi oběma vrstvami.** Co description sděluje, body mají *rozvinout*, ne znovu přeříkat na stejné úrovni. Úvodní odstavec body zejména nesmí opakovat seznam vlastností z description — body začíná referencí, ne druhým souhrnem.

Praktická zkouška: když description úplně smažete a přečtete jen prvních 30 řádků body, agent by stále měl vidět, co skill dělá a kdy ho načíst. Pokud tuto informaci nese jen description, body nemá na začátku co přidat — přesuňte vysvětlení do body a nechte description nést titulek.

## Skill je balíček znalostí, ne kurz

Tělo skillu je **briefing pro LLM**, ne kurz pro začátečníka.

- **Schopnost** žije v LLM. Body neucí.
- **Znalosti** žijí v datech x-cmd (`x wkp` / `x rfc` / `x cve`, NVD / MITRE / GHSA) a v externích zdrojích. Body ukazují; agent si znovu dohledá.
- **Rámování** je úkolem skillu: pojmenovává tvar problému, konvenci, strukturovaný výstup, x-cmd nástroj, který se má použít.

Skill nese úhel řešení, konvenci, tvar výstupu a ukazatele na zdroje. Nese **ne** schopnost (tu LLM už má), **ne** statická data (zastarávají) a **ne** tutoriály (používejte sidecary).

Kde jsou podrobnosti příliš jemné nebo příliš aktuální, odložte je do sidecaru (`references/`, `ANALYTICS.md`) nebo do externí dokumentace, která se průběžně aktualizuje.

## Externí odkazy

Sbírejte dva typy: **kořenové odkazy** (vstupní body jako `llms.txt`, index dokumentace) a **užitečné odkazy** (cílené odkazy na 20 % dokumentace, která pokrývá 80 % případů použití). Kořenové uvádějte první, užitečné poté — AI chápe pořadí. **Žádná duplicita**, pokud zdůraznění není zásadní.

## Měkké výhrady (úvahová rozhodnutí)

- **Dílčí soubory (CLEANUP.md, references/*)** mohou být delší než SKILL.md, ale prvních 20 řádků stále nese tíhu (stejná pyramída).
- **MUSÍ** odkazovat na každý dílčí soubor z jeho nadřazeného SKILL.md (dopředný odkaz povinný). Zpětný odkaz na nadřazený SKILL.md z dílčího souboru je **volitelný** — soubory usecase odkazují na nadřazený dokument implicitně svou cestou. Vynucuje to `sw-1000-no-orphan-docs` v [skill0-writer.rule.yml](skill0-writer.rule.yml).
- **Spekulace** — uvádějte ověřená fakta, nebo to označte jako „neotestováno“.
- **Emoji**, pokud téma skillu nevyžaduje.

## Související

- [yfm](../yfm/SKILL.md) — konvence YFM, kterou skill0-writer vynucuje ve vrstvě 1
- [naming](../naming/SKILL.md) — pojmenování se řídí také pravidly pro writery
- [skill0-writer.rule.yml](skill0-writer.rule.yml) — mechanické vynucování
