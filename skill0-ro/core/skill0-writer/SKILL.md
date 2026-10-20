---
name: skill0-writer
description: Convenții de scriere pentru documentele skill0 — structură de tip piramidă, limite de linii și reguli de layout.
metadata:
  related: "yfm,naming"
---

# skill0-writer

Documentele skill0 urmează **principiul piramidei**: agenții pot citi doar primele 10–30 de linii, deci informația cea mai importantă trebuie să vină prima. Detaliul dincolo de linia 30 e bonus, nu povară.

## Lucruri pe care nicio regulă nu le prinde

- **Claritate înainte de concizie.** Un document scurt care dă răspunsul greșit e mai prost decât unul lung care dă răspunsul corect.
- **Avertismentele de securitate / siguranță TREBUIE să fie explicite** — folosește MUST, NEVER, DO NOT. Enunță nuanțele ca afirmații de sine stătătoare, nu ca paranteze.
- **Nu dezvolta cunoștințele comune.** Dacă un cuvânt de convenție plus una-două propoziții transmit ideea, oprește-te. Cititorul știe deja ce sunt YAML, git și un cache; cheltuiește contextul pe ce e specific acestui repo. Justificarea e principalul vinovat — dă motivul unei reguli doar când pare greșită fără el. (`sw-1200`)
- **Tabele doar pentru matrice adevărate.** 3+ coloane ale căror rânduri trebuie citite unul față de altul. Un tabel cu două coloane e o listă care poartă sintaxă de tabel — scrie lista. Un set de date aparține unui `.tsv` extern lângă document, legat, ca `x tsv` să-l poată interoga. (`sw-1250`)

## YFM — doar `SKILL.md`

```yaml
---
name: <slug>                  # must equal the directory name
description: <1-2 sentence summary an agent uses to decide whether to load>
---
```

`name` și `description` sunt purtătoare de semnificație. Tot restul niștează sub blocul `metadata:` din [yfm](../yfm/SKILL.md) ca scalare separate prin virgulă — opțional, și adaugă structură pentru indexare, descoperire și cârlige ontologice.

**Sub-fișierele nu poartă YFM.** Doar `SKILL.md` e filtrat de un loader, deci doar el are nevoie de front matter. Toate celelalte fișiere (`references/*`, `usecase/*`, `EXAMPLE.md`, `*.report.md` …) sunt citite direct de un agent care a decis deja să le deschidă — un YFM acolo e cost pur de tokeni, repetând un scop pe care titlul și prima linie îl dau deja. Începe acele fișiere cu heading-ul `#`. Abaterea cere un motiv enunțat chiar în fișier.

Pentru versiunile localizate în chineză, folosește un `SKILL.cn.md` paralel (unul per skill). Nu amesteca limbile într-un singur fișier.

## Verificări mecanice

Trăiesc în [skill0-writer.rule.yml](skill0-writer.rule.yml). Rulează `x rule lint skill0-writer.rule.yml` și `x rule check -r skill0-writer.rule.yml lib/skill0/`. Acoperire: prezența YFM + câmpurile name/description, formatul numelui, număr de linii ≤ 100 (ideal 50), ordinea secțiunilor install → usage → advanced → links, doar engleză, no-intro / no-conclusion / no-repetition, no-orphan files.

## Verificare de siguranță la trunchiere

După ce ai scris, review la linia 30: un agent care se oprește aici ar forma o înțelegere greșită?

Dacă da, mută mai devreme calificatorul critic. Primele 30 de linii trebuie să dea un model mental corect (chiar dacă incomplet). Dincolo de linia 30, extinde cu detaliu — piramida se corectează singură.

## Încărcare în două straturi: descrierea pentru potrivire, corpul pentru referință

Loader-ele de skill-uri (Claude Code, Cursor, Continue etc.) încarcă SKILL.md în două etape:

  1. **YFM `description:`** — încărcat automat în catalogul agentului
     pentru potrivire. Agentul citește descrierea ca să decidă dacă
     încarce skill-ul.
  2. **Corpul** — încărcat la cerere, după potrivire. Material de referință.

Implicații:

- **Descrierea** = *ce e + când să-l încarci* — densă în cuvinte-cheie,
  bogată în trigger-e, concisă.
- **Corpul** = *cum să-l folosești + referință* — exemple, scheme, cazuri
  limită, linkuri către documente mai adânci.

**Nu duplica conținut între cele două straturi.** Ce transmite descrierea, corpul ar trebui să *dezvolte*, nu să repete la suprafață. În particular, primul paragraf al corpului nu trebuie să listeze aceleași funcții ca descrierea — corpul intră cu referința, nu cu încă o sumă.

Un test practic: dacă ștergi descrierea cu totul și citești doar primele 30 de linii ale corpului, agentul ar trebui să vadă în continuare ce face skill-ul și când să-l încarce. Dacă doar descrierea poartă informația, corpul nu are ce adăuga sus — mută explicația în corp și lasă descrierea să poarte titlul.

## Un skill e un pachet de cunoștințe, nu un tutorial

Corpul unui skill e un **briefing pentru LLM**, nu un curs pentru începător.

- **Capabilitatea** stă în LLM. Corpul nu predă.
- **Cunoștințele** stau în uneltele de date x-cmd (`x wkp` / `x rfc` / `x cve`, NVD / MITRE / GHSA) și surse externe. Corpul indică; agentul re-preia.
- **Încadrarea** e jobul skill-ului: numește forma problemei, convenția, ieșirea structurată, unealta x-cmd de folosit.

Un skill poartă unghiul de rezolvare, convenția, forma ieșirii și pointeri către surse. Nu poartă **capabilitate** (LLM-ul o are deja), **date statice** (se degradează) sau **tutoriale** (folosește sidecar-uri).

Unde detaliile sunt prea amănunțite sau prea volatile, mută-le într-un sidecar (`references/`, `ANALYTICS.md`) sau într-o doc externă actualizată mereu.

## Linkuri externe

Adună două tipuri: **linkuri rădăcină** (puncte de intrare ca `llms.txt`, indexul de documentație) și **linkuri utile** (linkuri țintite către cele 20% din documente care acoperă 80% din cazurile de folosire). Listează rădăcina întâi, utile după — AI-ul înțelege ordinea. **Fără duplicare** dacă accentul nu e critic.

## Nuențe soft (decizii de judecată)

- **Sub-fișierele (CLEANUP.md, references/*)** pot fi mai lungi decât SKILL.md, dar primele 20 de linii poartă tot povara (aceeași piramidă).
- **TREBUIE** să lege fiecare sub-fișier din SKILL.md-ul părinte (link înainte obligatoriu). Linkul înapoi către SKILL.md din partea unui sub-fișier e **opțional** — fișierele usecase trimit implicit la părinte prin calea lor. Impus de `sw-1000-no-orphan-docs` în [skill0-writer.rule.yml](skill0-writer.rule.yml).
- **Speculație** — enunță fapte testate sau etichetează "netestat".
- **Emoji** doar dacă subiectul skill-ului le cere.

## Related

- [yfm](../yfm/SKILL.md) — convenția YFM a cărei prim strat îl impune skill0-writer
- [naming](../naming/SKILL.md) — și naming-ul urmează regulile de scriere
- [skill0-writer.rule.yml](skill0-writer.rule.yml) — impunere mecanică