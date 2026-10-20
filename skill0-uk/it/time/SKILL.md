---
name: time
description: |
  Вимірювання часу виконання команд — мікросекундна точність, статистичний аналіз, порівняння.
  Нульовий бар'єр — працює з x-cmd або вбудованою в shell командою time.
  Використовувати для "timing", "benchmark", "performance", "profiling".

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

Вимірюйте час виконання команд. Від одноразового вимірювання з мікросекундною точністю до статистичного аналізу за багатьма запусками.

## Швидкий старт

```bash
# З x-cmd
x time <command>                      # Одноразове вимірювання, мікросекунди
x time stress -c 100 <command>        # Статистика за 100 запусків
x time cmp 'cmd1' 'cmd2' 'cmd3'      # Порівняння команд

# Без x-cmd — використовуйте вбудовані засоби shell
time <command>                        # Базове вимірювання
# Для бенчмарків використовуйте цикл:
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## Доступні команди

- `x time <cmd>` — один запуск, мікросекундна точність
- `x time getms <cmd>` — мілісекундна точність
- `x time stress -c N <cmd>` — N запусків із повною статистикою
- `x time stress -b N <cmd>` — кількість запусків визначається автоматично в межах бюджету
- `x time cmp 'c1' 'c2'` — порівняння кількох команд

## Формати виводу

- `--csv` CSV для програмного аналізу
- `--tsv` з табуляцією як роздільником
- `--yml` YAML

## Цей skill0 ще зростає

Починаємо з основного. Далі додамо:
- шаблони для бенчмарків
- посібник зі статистичного тлумачення
- типові антипатерни продуктивності

## Related