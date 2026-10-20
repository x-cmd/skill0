---
name: time
description: |
  Penadian waktu eksekusi perintah — presisi mikrodetik, analisis statistik, perbandingan.
  Tanpa hambatan — pakai dengan x-cmd atau perintah time bawaan shell.
  Gunakan untuk "penadian", "benchmark", "kinerja", "profiling".

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

Ukur waktu eksekusi perintah. Dari penadian mikrodetik sekali jalan sampai analisis statistik banyak percobaan.

## Mulai Cepat

```bash
# Dengan x-cmd
x time <command>                      # Penadian mikrodetik sekali jalan
x time stress -c 100 <command>        # Statistik 100 kali jalan
x time cmp 'cmd1' 'cmd2' 'cmd3'      # Bandingkan perintah

# Tanpa x-cmd — pakai bawaan shell
time <command>                        # Penadian dasar
# Untuk benchmark, pakai loop:
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## Yang Tersedia

- `x time <cmd>` — Sekali jalan, presisi mikrodetik
- `x time getms <cmd>` — Presisi milidetik
- `x time stress -c N <cmd>` — N kali jalan dengan statistik lengkap
- `x time stress -b N <cmd>` — Otomatis tentukan jumlah jalan sesuai anggaran waktu
- `x time cmp 'c1' 'c2'` — Bandingkan beberapa perintah

## Format Keluaran

- `--csv` CSV untuk analisis terprogram
- `--tsv` Dipisah tab
- `--yml` YAML

## skill0 Ini Berkembang

Mulai dari yang paling dasar. Akan ditambahkan:
- Pola benchmark
- Panduan interpretasi statistik
- Anti-pola kinerja yang sering terjadi

## Terkait