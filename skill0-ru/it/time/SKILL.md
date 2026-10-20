---
name: time
description: |
  Замер времени выполнения команд — микросекундная точность, статистический анализ, сравнение.
  Нулевой порог входа — используйте с x-cmd или встроенной командой time.
  Применяйте для «timing», «benchmark», «performance», «profiling».

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

Замер времени выполнения команд. От однократного микросекундного замера до многократного статистического анализа.

## Быстрый старт

```bash
# С x-cmd
x time <command>                      # Однократный микросекундный замер
x time stress -c 100 <command>        # Статистика по 100 запускам
x time cmp 'cmd1' 'cmd2' 'cmd3'      # Сравнение команд

# Без x-cmd — встроенные средства shell
time <command>                        # Базовый замер времени
# Для бенчмарка используйте цикл:
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## Что доступно

- `x time <cmd>` — Однократный запуск, микросекундная точность
- `x time getms <cmd>` — Миллисекундная точность
- `x time stress -c N <cmd>` — N запусков с полной статистикой
- `x time stress -b N <cmd>` — Автовыбор числа запусков в пределах бюджета
- `x time cmp 'c1' 'c2'` — Сравнение нескольких команд

## Форматы вывода

- `--csv` — CSV для программного анализа
- `--tsv` — Tab-separated
- `--yml` — YAML

## Этот skill0 растёт

Начинаем с основ. Будет добавлено:
- Шаблоны бенчмаркинга
- Руководство по интерпретации статистики
- Частые антипаттерны производительности

## Связанное

