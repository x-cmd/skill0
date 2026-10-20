---
name: skill0-writer
description: Quy ước viết cho tài liệu skill0 — cấu trúc kim tự tháp, giới hạn số dòng, và các quy tắc bố cục.
metadata:
  related: "yfm,naming"
---

# skill0-writer

Tài liệu skill0 tuân theo **nguyên tắc kim tự tháp**: agent có thể chỉ đọc 10–30 dòng đầu, nên thông tin quan trọng nhất phải đến trước. Chi tiết ngoài dòng 30 là phần thưởng, không phải gánh nặng.

## Những điều không quy tắc nào bắt được

- **Rõ ràng quan trọng hơn ngắn gọn.** Một tài liệu ngắn mà trả lời sai còn tệ hơn một tài liệu dài mà trả lời đúng.
- **Cảnh báo bảo mật / an toàn PHẢI nêu rõ** — dùng MUST, NEVER, DO NOT. Trình bày các giới hạn thành câu đầy đủ, không phải chú thích trong ngoặc.
- **Đừng giải thích những thứ hiển nhiên.** Nếu một từ khái niệm cộng thêm một hai câu là đủ truyền tải ý nghĩa, dừng lại. Người đọc đã biết YAML, git và cache là gì; hãy dành phần ngữ cảnh cho những gì riêng biệt của repo này. Lý do giải thích là thủ phạm thường gặp — chỉ nêu lý do của một quy tắc khi thiếu lý do mà quy tắc trông có vẻ sai. (`sw-1200`)
- **Chỉ dùng bảng cho ma trận thực sự.** 3+ cột mà các dòng phải đọc đối chiếu nhau. Bảng hai cột chỉ là một danh sách mặc cú pháp bảng — hãy viết thành danh sách. Tập dữ liệu nên nằm ở file `.tsv` bên cạnh tài liệu, có liên kết, để `x tsv` truy vấn được. (`sw-1250`)

## YFM — chỉ `SKILL.md`

```yaml
---
name: <slug>                  # phải bằng tên thư mục
description: <tóm tắt 1-2 câu để agent quyết định có nên nạp hay không>
---
```

`name` và `description` mang tính quyết định. Mọi thứ khác nằm dưới khối `metadata:` từ [yfm](../yfm/SKILL.md) dưới dạng các giá trị vô hướng phân tách bằng dấu phẩy — tùy chọn, và giúp thêm cấu trúc cho việc lập chỉ mục, khám phá, và các móc nối ontology.

**File phụ không mang YFM.** Chỉ `SKILL.md` được bộ nạp lọc, nên chỉ nó cần front matter. Mọi file khác (`references/*`, `usecase/*`, `EXAMPLE.md`, `*.report.md` …) được agent đọc trực tiếp sau khi đã quyết định mở nó — YFM ở đó chỉ là chi phí token vô ích, lặp lại một mục đích mà tiêu đề và dòng đầu đã nói rõ. Hãy bắt đầu những file đó bằng tiêu đề `#`. Lệch chuẩn thì cần nêu lý do ngay trong file đó.

Với các bản bản địa hóa tiếng Trung, hãy dùng `SKILL.cn.md` song song (mỗi skill một file). Đừng trộn nhiều ngôn ngữ trong cùng một file.

## Kiểm tra cơ học

Nằm trong [skill0-writer.rule.yml](skill0-writer.rule.yml). Chạy `x rule lint skill0-writer.rule.yml` và `x rule check -r skill0-writer.rule.yml lib/skill0/`. Phạm vi: có YFM + các trường name/description, định dạng name, số dòng ≤ 100 (lý tưởng 50), thứ tự mục install → usage → advanced → links, chỉ dùng tiếng Anh, không có intro / không có kết luận / không lặp lại, không có file mồ côi.

## Kiểm tra an toàn khi bị cắt

Sau khi viết xong, hãy xem lại ở dòng 30: liệu một agent dừng lại ở đây có hình thành hiểu biết sai không?

Nếu có, hãy chuyển điều kiện quan trọng lên trước. 30 dòng đầu phải cho ra một mô hình tinh thần đúng (dù chưa đầy đủ). Sau dòng 30, hãy mở rộng bằng chi tiết — kim tự tháp tự điều chỉnh.

## Nạp hai lớp: description để khớp, body để tra cứu

Các bộ nạp skill (Claude Code, Cursor, Continue, v.v.) nạp SKILL.md qua hai giai đoạn:

  1. **`description:` trong YFM** — được tự động nạp vào danh mục của agent
     để khớp. Agent đọc description để quyết định có
     nạp skill hay không.
  2. **Body** — nạp theo yêu cầu sau khi khớp. Tài liệu tham chiếu.

Hệ quả:

- **Description** = *nó là gì + khi nào nên nạp* — dày chữ khoá,
  nhiều từ kích hoạt, ngắn gọn.
- **Body** = *cách dùng + tra cứu* — ví dụ, schema, trường hợp
  biên, liên kết tới tài liệu sâu hơn.

**Đừng lặp lại nội dung qua hai lớp.** Bất cứ điều gì description đã truyền tải, body nên *mở rộng* nó chứ đừng phát lại. Đặc biệt đoạn mở đầu của body không được liệt kê lại các tính năng giống description — body dẫn dắt bằng tài liệu tham chiếu, không phải bằng một bản tóm tắt thứ hai.

Một bài kiểm tra thực tế: nếu bạn xoá hẳn description và chỉ đọc 30 dòng đầu của body, agent vẫn nên thấy skill này làm gì và khi nào nên nạp. Nếu chỉ mỗi description mang thông tin đó, thì body chẳng thêm được gì ở đầu — hãy chuyển phần giải thích vào body và để description mang tiêu đề.

## Một skill là gói kiến thức, không phải hướng dẫn từng bước

Body của một skill là **bản tóm tắt cho LLM**, không phải một khóa học cho người mới.

- **Năng lực** nằm ở LLM. Body không dạy.
- **Kiến thức** nằm ở các công cụ dữ liệu của x-cmd (`x wkp` / `x rfc` / `x cve`, NVD / MITRE / GHSA) và các nguồn bên ngoài. Body chỉ chỉ đường; agent tự nạp lại.
- **Định khung** là việc của skill: gọi tên hình dạng vấn đề, quy ước, đầu ra có cấu trúc, công cụ x-cmd cần dùng.

Một skill mang góc giải quyết, quy ước, hình dạng đầu ra, và con trỏ tới nguồn. Nó **không** mang năng lực (LLM đã có sẵn), dữ liệu tĩnh (sẽ lỗi thời), hay hướng dẫn từng bước (hãy dùng sidecar).

Khi chi tiết nào quá rườm rà hoặc quá dễ lỗi thời, hãy đẩy sang sidecar (`references/`, `ANALYTICS.md`) hoặc tài liệu bên ngoài luôn được cập nhật.

## Liên kết bên ngoài

Thu thập hai loại: **liên kết gốc** (các điểm vào như `llms.txt`, mục lục tài liệu) và **liên kết hữu ích** (liên kết có đích cho 20% tài liệu bao phủ 80% tình huống sử dụng). Liệt kê gốc trước, liên kết hữu ích sau — AI hiểu thứ tự. **Không lặp lại** trừ khi nhấn mạnh là thật sự quan trọng.

## Lưu ý mềm (các điểm cần phán đoán)

- **File phụ (CLEANUP.md, references/*)** có thể dài hơn SKILL.md nhưng 20 dòng đầu vẫn phải gánh phần chính (cùng kim tự tháp).
- **PHẢI** liên kết đến mọi file phụ từ SKILL.md cha của nó (bắt buộc có liên kết xuôi). Liên kết ngược về SKILL.md cha từ một file phụ là **tùy chọn** — file usecase tham chiếu ngữ cảnh cha một cách ngầm định qua đường dẫn của nó. Quy tắc `sw-1000-no-orphan-docs` trong [skill0-writer.rule.yml](skill0-writer.rule.yml) thực thi điều này.
- **Phỏng đoán** — hãy nêu các sự thật đã kiểm chứng, hoặc dán nhãn "chưa kiểm chứng".
- **Biểu tượng cảm xúc**, trừ khi chủ đề skill bắt buộc phải có.

## Liên quan

- [yfm](../yfm/SKILL.md) — quy ước YFM mà skill0-writer thực thi ở lớp 1
- [naming](../naming/SKILL.md) — việc đặt tên cũng tuân theo quy tắc của writer
- [skill0-writer.rule.yml](skill0-writer.rule.yml) — thực thi cơ học
