---
name: devloop
description: Цикл розробки, керований цілями — визначити ціль, написати правила з ключовими результатами, перевірити візуально, синхронізувати з трекером задач.
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Налаштування

```
x rule init :ror                          # або набір правил під конкретний проєкт
x env use agent-browser                   # для візуальної перевірки
```

## Робочий процес

```
goal → rule.yml → code → verify → issue
```

### 1. Визначити ціль → написати rule.yml

Перед написанням коду створи rule.yml для задачі:

```yaml
goal: "Українська версія показує китайські теги в розділі Features"
keyresults:
  - kr-1: "Теги Features в англійському режимі — усі англійською"
  - kr-2: "Теги Features у китайському режимі — лишаються китайськими"
  - kr-3: "Збірка проходить без регресій"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - Коли language=en, усі елементи details[] мають бути англійською
    - Жодного китайського символу в жодному бейджі тегу в англійському режимі
```

Поля правила: `id`, `name`, `apply`, `level`, `desc`, `tldr`. Дивися `x rule -h`.

**МУСИТЬ** містити `goal` і `keyresults` — два обов'язкові поля для кожної задачі розробки.

### 2. Виконати → візуальна перевірка (фронтенд)

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... внесення змін ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**МУСИТЬ** робити скриншоти до і після. Порівняй з наміром:
1. Перевірка зором ШІ: чи відповідає after.png цілі?
2. Якщо не збігається → ітеруй і перероби скриншот
3. **Вичисти всі приватні дані** (токени, пошта, персональна інформація) перед завантаженням

### 3. Перевірити через x rule

```
x rule scan <files>     # швидко (~1 хв), для внутрішнього циклу
x rule check <files>    # ретельно (~10 хв)
x rule audit <files>    # повний звіт (~30 хв)
```

### 4. Синхронізувати з трекером задач

Дивися [issue/SKILL.md](../issue/SKILL.md). Мінімум: опублікувати в задачі ціль, ключові результати, rule.yml та скриншоти до/після.

## Агентні інструменти

- `x rule scan` — швидка перевірка під час ітерацій
- `x rule check` — повна відповідність перед комітом
- `agent-browser screenshot` — візуальний доказ до/після
- `gh issue create/comment` — синхронізація цілі + rule.yml із трекером

## Пов'язане

- [rule](../rule/SKILL.md) — rule.yml — це скелет перевірки
- [score](../score/SKILL.md) — оцінювання KR використовує фреймворк score
- [install](../install/SKILL.md) — налаштовує середовище розробки
- [agent-browser](../../it/agent-browser/SKILL.md) — візуальна перевірка до/після
- [issue](../issue/SKILL.md) — синхронізує ціль + KR + скриншоти з трекером задач
- [repo](../repo/SKILL.md) — підтягує/надсилає роботу в репозиторіях
- [prompt](../prompt/SKILL.md) — конвенції промптів часто задають задачі devloop