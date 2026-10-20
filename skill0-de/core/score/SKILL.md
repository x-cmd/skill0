---
name: score
description: |
  Gewichtetes Dimensions-Scoring-Framework für KI-Agenten — "Nicht raten. Scoren." Kernidee: Bedürfnisse zuerst verstehen, dann entwerfen und iterieren, der Agent ist der Analyst. Ausgabe ist ein sortiertes TSV über `x score compute`.
metadata:
  related: "rule,naming"
---


# Score
"Nicht raten. Scoren."
Gewichtetes Dimensions-Scoring-Framework für KI-Agenten.
## So wird es verwendet
**Erst verstehen, dann scoren.** Stelle genug Fragen, bevor du Dimensionen definierst. Falsche Dimensionen → falsche Scores, egal wie präzise.
**Entwerfen, dann iterieren.** Wenn die Bedürfnisse noch nicht ganz klar sind, baue einen Standard nach bestem Wissen, score, und zeig die Ergebnisse. Benutzer reagieren auf konkrete Rankings — "dieser Faktor sollte höher", "du hast X verpasst". Das ist das Signal. Verfeinern und neu scoren. Eine Iteration schlägt zehn Ratenversuche.
**Der Agent ist der Analyst.** Lies nach dem Compute das TSV. Erkläre, warum X Y geschlagen hat. Hebe Überraschungen hervor. Schlage Anpassungen vor. Das Ranking beginnt das Gespräch, es beendet es nicht.
## Kernablauf
```
① Bedürfnisse verstehen  →  ② score.yml definieren  →  ③ score.tsv scoren  →  ④ x score compute  →  ⑤ Berichten & iterieren
```
Ausgabe: `target, total, rank, block, reason, <dim> (X%), evidence`. Summe 0–100, absteigend sortiert. rank=1 ist am besten.
## Beispiel — einem Benutzer helfen, sich für Werbeslogans zu entscheiden
1. Diskutiere mit dem Benutzer die Bewertungsdimensionen und -kriterien. Schreibe `slogan.score.yml`.
2. Die KI scored jedes Slogan je Dimension (0–10, mit Belegen) → `slogan.score.tsv`. Summe und Rank leer lassen.
3. `x score compute slogan.score.yml slogan.score.tsv` → füllt Summe + Rank.
4. Ergebnisse lesen, mit dem Benutzer diskutieren. Scores anpassen oder Kandidaten ergänzen, wiederholen.
5. Oder: `x score iter -f slogan.score.yml slogan.score.tsv "<feedback>"`
Weitere Beispiele: [EXAMPLE.md](EXAMPLE.md).
## Zwei-Dateien-Modell
- `*.score.yml` — Wiederverwendbarer Standard: Dimensionen, Faktoren, Beschreibungen
- `**.score.tsv` — Ziele + Scores + Belege; Spalte 1 = Zielname
`x score compute <yml> <tsv>` ist dasselbe wie `python compute.py`.
## Anwendungsszenarien
1. **Gibt Agenten einen Entscheidungsablauf.** score.yml verankert den Agenten in einem strukturierten Prozess — der Agent folgt dem Standard, nicht der Stimmung der letzten Nachricht.
2. **Entscheidungen sind regelbasiert.** Dimensionen × Faktoren × Belege → gewichtete Summe → Rang. Jeder Score ist an Fakten verankert. Das Reasoning ist transparent.
3. **Passt sich verschiedenen Bedürfnissen an.** Dimensionen tauschen, Faktoren anpassen, harte Filter hinzufügen (`block`-Spalte). Dieselbe Vorlage, andere Benutzer.
4. **Entwickelt sich, wenn Bedürfnisse klarer werden.** Entwurf → Score → Feedback → Verfeinerung → schärfer.
5. **Standarddatei + archivierte Ergebnisse für jeden Skill.** score.yml = Entscheidungsstandard. score.tsv = Entscheidungsprotokoll. Beide archivierbar, prüfbar, teilbar.
---
## Formel
```
total = Σ(factor × score) ÷ Σ(factor) × 10   →   0–100
```
- **factor** — ganze Zahl 1–10. Baseline = 2. 1=gering, 4=2×, 6=3×, 8=4×, 10=5×. Automatisch normalisiert.
- **score** — 0–10 je Dimension, evidenzverankert.
- **total** — gewichtete Summe 0–100.
Dimensionsüberschriften zeigen das Gewicht in %: `factor ÷ Σ(factor) × 100`.
## Ausgabespalten
| Spalte | Quelle | Beschreibung |
|--------|--------|-------------|
| `target` | Eingabe | Name des Kandidaten |
| `total` | berechnet | gewichteter Score (0–100) |
| `rank` | berechnet | 1 = am besten. `X` wenn blockiert |
| `block` | Eingabe | harter Filter — nicht leer = disqualifiziert, ans Ende geschoben, rank=X |
| `reason` | Eingabe/Ausgabe | optional: KI-Notizen zu Feinheiten des Scores |
| `<dim> (X%)` | berechnet | Scores je Dimension, Überschrift zeigt das Gewicht in % |
| `evidence` | Eingabe | Fakten, die jeden Score stützen |
## Skala
- 9–10 — Hervorragend — erfüllt die Kriterien vollständig
- 7–8 — Gut — erfüllt die Kriterien, kleine Lücke
- 5–6 — Ausreichend — richtige Richtung, deutliche Lücke
- 3–4 — Schwach — erhebliche Lücke
- 1–2 — Durchgefallen — kaum adressiert
- 0 — N/A — nicht zutreffend
## Regeln
1. **Evidenzverankerung** — jeder Score MUSS Belege haben. Fakten, keine Gefühle.
2. **Die ganze Skala nutzen** — 5 ist der Mittelpunkt, nicht der Standard. 0 und 10 sind selten, aber möglich.
3. **Faktoren sind relative Verstärker** — Faktor 2 = 2× Einfluss von Faktor 1. Automatisch normalisiert.
4. **Ziele eindeutig und nicht leer** — jede Zeile muss in Spalte 1 einen Zielnamen haben. Keine Duplikate, keine Leerwerte.
5. **Agent liest, berichtet, entscheidet** — nach dem Compute die Ergebnisse erklären. Nach Bedarf neu scoren oder neu gewichten.
## Dateien
- `SKILL.cn.md` — chinesische Version
- `compute.py` — validiert + berechnet Summe + Rang
- `template/*.score.yml` — 35+ Vorlagen. `x score ls` listet, `x score init -t <name>` kopiert
- `EXAMPLE.md` — weitere Nutzungsbeispiele
- `rule-vs-score.md` — wann rule vs. score verwenden
- `score-template-writer.md` — wie man Scoring-Vorlagen schreibt

## Verwandt

- [rule](../rule/SKILL.md) — zugehöriges Compliance-Gegenstück
- [naming](../naming/SKILL.md) — hier werden Namenskandidaten gescort
