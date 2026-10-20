---
name: issue
description: Manajemen issue untuk devloop — template untuk goal, rule.yml, key-results, dan siklus hidup issue.
metadata:
  related: "devloop,repo"
---


# issue

Bagian dari [devloop](../devloop/SKILL.md).

## Template issue devs baru

```
gh issue create --title "<scope>: <short description>" --body "$(cat <<'EOF'
## Goal
<one-line objective>

## Key Results
- [ ] KR-1: <verifiable outcome>
- [ ] KR-2: <verifiable outcome>

## rule.yml
```yaml
goal: "<same as above>"
keyresults:
  - kr-1: "<same as above>"
  - kr-2: "<same as above>"
rules:
  - id: <rule-id>
    name: <name>
    apply: "<file pattern>"
    level: error
    desc:
    - <criterion>
```

## Screenshots
- Before: <image or "N/A">
- After: <image or "pending">
EOF
)"
```

## Siklus hidup issue

| Tahap | Tindakan | Isi komentar |
|-------|--------|-----------------|
| Dibuat | `gh issue create` dengan template | goal, key-results, rule.yml |
| Berjalan | Diperbarui seiring pekerjaan berjalan | catatan kemajuan, screenshot di tengah |
| Terverifikasi | `x rule check` lolos | hasil rule check, screenshot sesudah |
| Ditutup | `gh issue close` | commit SHA, ringkasan verifikasi akhir |

## Template komentar penyelesaian

```
gh issue comment <n> --body "$(cat <<'EOF'
## Verified
- rule.yml: <code block or link>
- x rule check: PASS
- Before: <image>
- After: <image>
- Commit: <sha>
EOF
)"
```

## Aturan

- **WAJIB** sertakan `goal` dan `keyresults` di setiap issue devs — tanpa pengecualian
- **WAJIB** unggah rule.yml sebagai blok kode di body issue atau komentar pertama
- **WAJIB** ambil screenshot sebelum dan sesudah untuk perubahan frontend
- **JANGAN PERNAH** menutup issue tanpa bukti verifikasi
- Hubungkan issue ke papan proyek agar terlihat di roadmap

## Terkait

- [devloop](../devloop/SKILL.md) — pelacak untuk loop bertumpu tujuan (goal/rule.yml/KR)
- [repo](../repo/SKILL.md) — issue menempel pada repo dalam tata letak x-repo