---
name: repo
description: Konvensi + perkakas untuk tempat repo hasil clone agent tinggal dan bagaimana worktree-nya ditata. Repo bare bawaan di `~/.x-repo/.bare/<provider>/<owner>/<name>.git` dengan working tree tertaut di bawah `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]`. Ditemukan lewat `x repo ls`. Manajemen worktree lewat `x repo wt`. Gunakan untuk "where to clone", "git clone path", "workspace layout", "shared repos between agents", "worktree path".
metadata:
  related: "git"
---

# repo

## Mengapa

Semua clone bertemu di `~/.x-repo/<provider>/<owner>/<name>`. Path yang sama untuk setiap agent, manusia, CI — bisa di-mount ke container atau sandbox agent sehingga mereka berbagi tanpa clone ulang. Satu akar untuk dicadangkan; bisa ditemukan lewat `x repo ls`. Tata letaknya mencerminkan path github sehingga `../<sibling>` dari worktree mana pun mengarah ke worktree bawaan sibling tersebut — config dan skrip yang merujuk sibling bekerja seragam di semua wt dan agent.

## Tata letak path

- bare: `~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- wt bawaan: `~/.x-repo/<provider>/<owner>/<name>`
- wt dirancang: `~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` — wtname adalah pengenal apa pun untuk workspace ini: nama agent/worker, nama branch, tag, SHA pendek, id issue, string bebas. `/` pada wtname di-encode menjadi `~`.

Secara bawaan, repo bersifat bare dengan worktree tertaut — repo bare ada di `.bare/`, direktori terpisah dari worktree, sehingga `rm -rf` pada satu wt tidak bisa menjangkauinya. `git clone` biasa juga diterima (`x repo ls/which/update` mengenalinya) tapi tanpa perlindungan geometris. Mohon berhati-hati dalam kasus itu: jangan `rm -rf`, lebih baik pakai `git worktree remove`, dan hindari heuristik pembersihan yang menyasar `.git/`. Pekerjaan di tengah tugas yang hilang dengan cara ini tidak bisa disejajarkan kembali dengan repo aslinya.

## Perintah

```bash
x repo <id>                      # cd ke wt bawaan (clone otomatis jika belum ada)
x repo wt <id> <wtname>          # pasang ke branch yang ada, atau buat baru dari HEAD
x repo wt ls <id>                # daftar wt
x repo wt rm <id> <wtname>       # hapus dengan rapi (pakai ini, bukan rm -rf)
x repo update <id>               # segarkan wt bawaan setelah perubahan upstream
x repo ls [--raw|--tsv]          # temukan apa yang sudah di-clone
x repo which <id>[@<wtname>]     # resolve id ke path absolut
```

## Jangan

- `rm -rf` sebuah worktree yang dirancang. Itu meninggalkan entri basi di registri `worktrees/` milik repo bare. Pakai `x repo wt rm`. Kalau memang harus, jalankan `git -C <bare> worktree prune` sesudahnya.

## Terkait

- [doc/path-layout.md](doc/path-layout.md) — tata bahasa path lengkap dan penamaan worktree
- [doc/workflow.md](doc/workflow.md) — prosedur operasional dan prinsip pembersihan-bukan-penghapusan
- [doc/design.md](doc/design.md) — mengapa tata letak ini dibentuk begitu