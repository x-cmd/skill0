---
name: repo
description: Agent'ların klonladığı repoların nereye düştüğü ve worktree'lerinin nasıl yerleştirildiği için konvansiyon + araç seti. Varsayılan bare repo `~/.x-repo/.bare/<provider>/<owner>/<name>.git` konumunda, bağlantılı çalışma ağaçları ise `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]` altında. `x repo ls` ile keşfedilir. Worktree yönetimi `x repo wt` ile. "nereye klonlayacağım", "git clone yolu", "workspace yerleşimi", "agent'lar arası paylaşılan repolar", "worktree yolu" için kullan.
metadata:
  related: "git"
---

# repo

## Neden

Tüm klonlar `~/.x-repo/<provider>/<owner>/<name>` altında birleşir. Her agent, insan, CI için aynı yol — container'lara ya da agent sandbox'larına mount edilip yeniden klonlamadan paylaşılabilir. Yedeklenecek tek kök; `x repo ls` ile keşfedilebilir. Yerleşim github yollarını yansıtır, böylece herhangi bir worktree'den `../<kardeş>` yazınca o kardeşin varsayılan worktree'sine gidilir — kardeşlere atıfta bulunan config ve script'ler tüm wt'ler ve agent'lar arasında tekdüze çalışır.

## Yol yerleşimi

- bare: `~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- varsayılan wt: `~/.x-repo/<provider>/<owner>/<name>`
- tasarlanmış wt: `~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` — wtname bu çalışma alanına ait herhangi bir tanımlayıcı olabilir: agent/worker adı, branch adı, tag, kısa SHA, issue id, serbest metin. wtname içindeki `/` karakteri `~` olarak kodlanır.

Varsayılan olarak repolar bare'dır ve bağlantılı worktree'lere sahiptir — bare, `.bare/` içinde, worktree'lerden ayrı bir dizide durur, böylece bir wt'nin `rm -rf` ile silinmesi ona ulaşamaz. Düz `git clone` da kabul edilir (`x repo ls/which/update` görür) ama geometrik koruma olmadan. Bu durumda dikkatli ol: `rm -rf` kullanma, `git worktree remove` tercih et ve `.git/`'i hedefleyen temizlik sezgilerinden kaçın. Bu şekilde kaybolan görev içi çalışma orijinal repo ile yeniden hizalanamaz.

## Komutlar

```bash
x repo <id>                      # varsayılan wt'ye cd (yoksa otomatik klonlar)
x repo wt <id> <wtname>          # var olan branch'e bağlanır, ya da HEAD'den yenisi oluşturur
x repo wt ls <id>                # wt'leri listele
x repo wt rm <id> <wtname>       # nazik kaldırma (rm -rf değil, bunu kullan)
x repo update <id>               # upstream değişikliklerinden sonra varsayılan wt'yi yenile
x repo ls [--raw|--tsv]          # nelerin klonlandığını keşfet
x repo which <id>[@<wtname>]     # id'yi mutlak yola çöz
```

## Yapma

- Tasararlanmış bir worktree'ye `rm -rf` uygulama. Bare'ın `worktrees/` kaydında bayat girdiler bırakır. `x repo wt rm` kullan. Zorunda kalırsan ardından `git -C <bare> worktree prune` çalıştır.

## İlgili

- [doc/path-layout.md](doc/path-layout.md) — tam yol grameri ve worktree adlandırma
- [doc/workflow.md](doc/workflow.md) — işletim prosedürü ve temizleme-değil-silme ilkeleri
- [doc/design.md](doc/design.md) — yerleşim neden bu şekilde şekillendi