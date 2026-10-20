---
name: prompt
description: Convenções de engenharia de prompt para o x-cmd — reuso via variáveis de template, regras de estrutura, padrões de imposição de segurança.
metadata:
  related: "devloop,rule"
---


# Prompt

## Princípio central: reuso, não duplicação

Os prompts no x-cmd são montados a partir de fragmentos reutilizáveis, não escritos como monólitos. Um template de prompt contém variáveis `<PLACEHOLDER>` que são resolvidas em runtime pelo módulo shell.

Exemplo do `claw`:
```
first_contact.md          # standalone — carregado em <FIRST_CONTACT_PROMPT>
msg_telegram.md           # monta: <FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # mesmos fragmentos, adaptador de plataforma diferente
heartbeat.md              # workflow diferente, compartilha <CHECK_PROMPT>
```

**Por quê**: uma correção se propaga para todo lugar. Adaptadores de plataforma (Telegram, Feishu, WeChat) compartilham regras de comportamento, mas diferem nos comandos de envio e nos limites de formatação.

Veja [reusing.md](reusing.md) para padrões detalhados de reuso.

## Regras de estrutura

- Cada arquivo de prompt é um conjunto de instruções completo e autocontido para um cenário
- Use placeholders `<UPPER_CASE>` para variáveis — nunca embuta dados reais
- Os placeholders são resolvidos pelo módulo que chama, não pelo próprio prompt
- Fragmento = função (lógica e fluxo), os dados são acrescentados em runtime (como passar argumentos)

## Padrão de imposição de segurança

As regras de segurança e comportamento DEVEM ser explícitas e firmes:

```
=== REGRAS INEGOCIÁVEIS ===
>> REGRA 1: Seu stdout é INVISÍVEL. Toda resposta DEVE usar o comando de envio. <<
>> REGRA 2: Responda PRIMEIRO, pense DEPOIS. Para tarefas não triviais, envie o ack imediatamente. <<
>> REGRA 3: Tarefas complexas/longas → use `x agent run`. NÃO bloqueie o usuário. <<
```

Use DEVE, NUNCA, NÃO. Veja [skill0-writer](../skill0-writer/SKILL.md) para a regra de linguagem de segurança.

## Padrão de guia de formatação

Quando os prompts miram múltiplas plataformas com capacidades de formatação diferentes:

```
GUIA DE FORMATAÇÃO:
- WeChat / WeChat corporativo: formatação limitada. Texto simples, listas, emoji. Sem tabelas.
- Telegram: markdown completo, incluindo tabelas. Máximo de 4096 caracteres.
- Feishu: markdown completo. Mensagens em card precisam de JSON.
```

## Exemplos reais

Os fragmentos de prompt hoje vivem em `lib/data/prompt/` de cada módulo (ex.: `claw/lib/data/prompt/`).
Eles vão migrar para `skill0/lib/skill0/<subskill>/` — mesma estrutura, localização canônica.

Exemplos atuais em `claw/lib/data/prompt/`:
- `first_contact.md` — saudação de novo workspace, fragmento reutilizável
- `heartbeat.md` — agente em background, lê o estado do workspace
- `msg_<platform>.md` — handlers de mensagem por plataforma, compartilham fragmentos comuns

## Relacionados

- [devloop](../devloop/SKILL.md) — prompts frequentemente conduzem tarefas do devloop
- [rule](../rule/SKILL.md) — as regras de estrutura de prompt são impostas pelo x rule