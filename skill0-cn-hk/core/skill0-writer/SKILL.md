---
name: skill0-writer
description: skill0 文檔的寫作約定 —— 金字塔結構、行數上限、佈局規則。
metadata:
  related: "yfm,naming"
---

# skill0-writer

Skill0 文檔遵循 **金字塔原則**：agent 可能只讀前 10–30 行，所以最重要的信息必須前置。30 行之後的細節是 bonus，不是主力。

## 沒有規則能約束的事

- **清晰優先於簡潔。** 給錯答案的短文檔比給正確答案的長文檔更糟。
- **安全 / 警告必須 顯式** —— 使用 MUST、NEVER、DO NOT。把 caveat 寫成完整陳述，而不是括注。
- **不要展開常識。** 一個約定詞加一兩句話能講清就停。讀者已經知道 YAML、git、cache 是什麼；把 context 花在倉裏特有的東西上。理由是常見冗餘 —— 只在"看起來不對"時給一句理由。（`sw-1200`）
- **表只為真正的矩陣服務。** 3+ 列、行需要互相對照的。兩列表格是穿表格外衣的列表 —— 寫成列表。數據集應放在文檔旁的外部 `.tsv`，鏈過去，讓 `x tsv` 可以查詢。（`sw-1250`）

## YFM —— 僅 `SKILL.md`

```yaml
---
name: <slug>                  # 必須等於目錄名
description: <1-2 sentence summary an agent uses to decide whether to load>
---
```

`name` 與 `description` 是 load-bearing。其他都嵌套在來自 [yfm](../yfm/SKILL.md) 的 `metadata:` 塊下，做逗號分隔的 scalar —— 可選，為索引、發現、本體鈎子增加結構。

**子文件不帶 YFM。** 只有 `SKILL.md` 被 loader 過濾，所以只有它需要 frontmatter。其他文件（`references/*`、`usecase/*`、`EXAMPLE.md`、`*.report.md` …）由已經決定打開它的 agent 直接閲讀 —— 那裏的 YFM 是純 token 成本，重述標題與首行已經給出的目的。這些文件從 `#` 標題起。需要偏離就在文件內聲明原因。

中文本地化版本使用平行的 `SKILL.cn.md`（每個 skill 一份）。不要在一份文件裏混語言。

## 機械檢查

見 [skill0-writer.rule.yml](skill0-writer.rule.yml)。運行 `x rule lint skill0-writer.rule.yml` 與 `x rule check -r skill0-writer.rule.yml lib/skill0/`。覆蓋：YFM 存在 + name/description 字段、name 格式、行數 ≤ 100（理想 50）、section 順序 install → usage → advanced → links、純英文、無引言 / 無結論 / 無重複、無孤兒文件。

## 截斷安全性檢查

寫完後，停在第 30 行檢查：只讀到這裏的 agent 會不會形成錯誤理解？

如果是，把關鍵限定前置。前 30 行必須給出（即便不完整的）正確心智模型。30 行之後，再用細節擴展 —— 金字塔是自我修正的。

## 雙層加載：description 負責匹配，body 負責參考

Skills loader（Claude Code、Cursor、Continue 等）分兩階段加載 SKILL.md：

  1. **YFM `description:`** —— 自動載入 agent 的目錄用於匹配。agent 讀 description 決定是否加載該 skill。
  2. **Body** —— 匹配後按需加載。參考材料。

含義：

- **Description** = *它是什麼 + 何時加載* —— 關鍵字密集、觸發詞豐富、簡練。
- **Body** = *如何使用 + 參考* —— 示例、schema、邊緣情況、鏈向更深文檔的鏈接。

**不要在兩層之間複製內容。** description 傳達的，body 應該 *展開*，而不是複述同一面。body 的開頭段尤其不得羅列與 description 相同的特性 —— body 以參考領起，而非第二份摘要。

一個實操測試：完全刪掉 description，只讀 body 的前 30 行，agent 應該仍能看到 skill 做什麼、何時加載。如果只有 description 承載那些信息，body 在頂部就無可加 —— 把解釋挪進 body，讓 description 只帶標題。

## skill 是知識包，不是教程

skill body 是 **給 LLM 的簡報**，不是給初學者的課程。

- **能力** 在 LLM 裏。body 不教。
- **知識** 在 x-cmd 數據工具（`x wkp` / `x rfc` / `x cve`，NVD / MITRE / GHSA）與外部來源中。body 只指；agent 自己再取。
- **框定** 是 skill 的工作：命名問題形態、約定、結構化輸出、要用的 x-cmd 工具。

skill 承載解題角度、約定、輸出形態與源指針。它 **不** 承載能力（LLM 已經有了）、靜態數據（會腐）、或教程（用 sidecar）。

具體太細或太新的部分，推到 sidecar（`references/`、`ANALYTICS.md`）或外部常更文檔。

## 外部鏈接

收集兩類：**root links**（入口如 `llms.txt`、docs index）與 **useful links**（覆蓋 80% 用例的 20% 文檔的定向鏈接）。root 在前，useful 在後 —— AI 理解順序。**不重複** 除非強調至關重要。

## 軟 caveat（判斷題）

- **子文件（CLEANUP.md, references/*）** 可以比 SKILL.md 長，但前 20 行仍承重（同樣金字塔）。
- **必須** 從父 SKILL.md 鏈接每個子文件（前向鏈接必須）。從子文件回鏈父 SKILL.md **可選** —— usecase 文件通過路徑隱式引用父文件。由 `sw-1000-no-orphan-docs` 在 [skill0-writer.rule.yml](skill0-writer.rule.yml) 中強制。
- **猜測** —— 寫經過測試的事實，或標註"untested"。
- **Emoji** —— 除非 skill 主題需要。

## Related

- [yfm](../yfm/SKILL.md) — skill0-writer 強制第 1 層的 YFM 約定
- [naming](../naming/SKILL.md) — 命名也遵循 writer 規則
- [skill0-writer.rule.yml](skill0-writer.rule.yml) — 機械強制