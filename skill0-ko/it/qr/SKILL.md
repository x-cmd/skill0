---
name: qr
description: |
  QR 코드 생성 — 터미널 표시, PNG 출력, 순수 셸 인코딩.
  진입 장벽 없음 — x-cmd, Python qrcode 또는 어떤 QR 라이브러리로든 사용.
  "qr", "qrcode", "barcode", "encode"에 활용.

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

텍스트나 URL로부터 QR 코드 생성. 터미널 표시, PNG 출력, 또는 순수 셸 인코딩.

## 빠른 시작

```bash
# x-cmd 사용
x qr "Hello World"                   # 터미널 QR 코드
x qr "https://example.com"           # URL을 QR로

# x-cmd 없이 — Python 사용
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# 또는 온라인 API 사용
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## 사용 가능 형태

- 터미널 — 터미널에 QR 표시
- PNG — PNG 파일 생성
- 순수 셸 — AWK 기반 인코딩 (의존성 없음)

## 이 skill0는 성장 중

핵심부터 시작합니다. 앞으로 추가될 내용:
- QR 인코딩 알고리즘
- 오류 정정 레벨
- WiFi QR 포맷

## Related

