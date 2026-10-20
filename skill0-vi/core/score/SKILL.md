---
name: score
description: |
  Khung chấm điểm theo chiều có trọng số cho AI agent — "Don't guess. Score." Ý tưởng cốt lõi: hiểu nhu cầu trước, soạn thảo rồi lặp lại, agent là nhà phân tích. Xuất ra TSV đã xếp hạng qua `x score compute`.
metadata:
  related: "rule,naming"
---


# Score
"Don't guess. Score."
Khung chấm điểm theo chiều có trọng số cho AI agent.
## Cách dùng
**Hiểu trước, chấm sau.** Hãy hỏi đủ câu trước khi định nghĩa các chiều. Chiều sai → điểm sai, dù có chính xác đến đâu.
**Soạn thảo rồi lặp lại.** Khi nhu cầu chưa rõ hoàn toàn, hãy dựng một tiêu chuẩn theo khả năng tốt nhất, chấm điểm, rồi trình kết quả. Người dùng sẽ phản hồi với những thứ hạng cụ thể — "yếu tố này lên cao hơn", "bạn bỏ sót X". Đó chính là tín hiệu. Tinh chỉnh rồi chấm lại. Một vòng lặp còn hơn mười vòng đoán mò.
**Agent là nhà phân tích.** Sau khi compute, hãy đọc TSV. Giải thích vì sao X thắng Y. Chỉ ra những điều bất ngờ. Đề xuất điều chỉnh. Bảng xếp hạng mở đầu cuộc trò chuyện, không kết thúc nó.
## Luồng chính
```
① Hiểu nhu cầu  →  ② Định nghĩa score.yml  →  ③ Chấm điểm score.tsv  →  ④ x score compute  →  ⑤ Báo cáo & lặp lại
```
Đầu ra: `target, total, rank, block, reason, <dim> (X%), evidence`. Total 0–100, sắp xếp giảm dần. rank=1 là tốt nhất.
## Ví dụ — giúp người dùng chọn slogan quảng bá
1. Thảo luận với người dùng để xác định các chiều và tiêu chí đánh giá. Viết `slogan.score.yml`.
2. AI chấm điểm từng slogan theo từng chiều (0–10, kèm bằng chứng) → `slogan.score.tsv`. Để trống total và rank.
3. `x score compute slogan.score.yml slogan.score.tsv` → điền total + rank.
4. Đọc kết quả, thảo luận với người dùng. Điều chỉnh điểm hoặc thêm ứng viên, lặp lại.
5. Hoặc: `x score iter -f slogan.score.yml slogan.score.tsv "<feedback>"`
Thêm ví dụ: [EXAMPLE.md](EXAMPLE.md).
## Mô hình hai tệp
- `*.score.yml` — Tiêu chuẩn dùng lại được: các chiều, hệ số, mô tả
- `**.score.tsv` — Mục tiêu + điểm + bằng chứng; cột 1 = tên mục tiêu
`x score compute <yml> <tsv>` tương đương với `python compute.py`.
## Kịch bản ứng dụng
1. **Cho agent một quy trình ra quyết định.** score.yml neo agent vào một quy trình có cấu trúc — agent tuân theo tiêu chuẩn, không theo tâm trạng của tin nhắn gần nhất.
2. **Quyết định dựa trên quy tắc.** Chiều × hệ số × bằng chứng → tổng có trọng số → thứ hạng. Mọi điểm đều neo vào sự thật. Lập luận minh bạch.
3. **Tinh chỉnh theo nhu cầu khác nhau.** Đổi chiều, chỉnh hệ số, thêm bộ lọc cứng (cột `block`). Cùng một template, người dùng khác nhau.
4. **Tiến hoá cùng khi nhu cầu được làm rõ.** Soạn thảo → chấm điểm → phản hồi → tinh chỉnh → sắc bén hơn.
5. **Tệp tiêu chuẩn + kết quả lưu trữ cho bất kỳ skill nào.** score.yml = tiêu chuẩn ra quyết định. score.tsv = biên bản ra quyết định. Cả hai đều có thể lưu trữ, rà soát, chia sẻ.
---
## Công thức
```
total = Σ(factor × score) ÷ Σ(factor) × 10   →   0–100
```
- **factor** — số nguyên 1–10. Mốc cơ sở = 2. 1=thấ nhất, 4=2×, 6=3×, 8=4×, 10=5×. Tự động chuẩn hóa.
- **score** — 0–10 cho mỗi chiều, neo vào bằng chứng.
- **total** — tổng có trọng số 0–100.
Tiêu đề chiều hiển thị trọng số %: `factor ÷ Σ(factor) × 100`.
## Các cột đầu ra
| Cột | Nguồn | Mô tả |
|--------|--------|-------------|
| `target` | input | Tên ứng viên |
| `total` | computed | Điểm có trọng số (0–100) |
| `rank` | computed | 1 = tốt nhất. `X` nếu bị chặn |
| `block` | input | Bộ lọc cứng — khác rỗng = mất tư cách, đẩy xuống cuối, rank=X |
| `reason` | input/output | Tùy chọn: ghi chú của AI về sắc thái của điểm |
| `<dim> (X%)` | computed | Điểm theo từng chiều, tiêu đề hiển thị trọng số % |
| `evidence` | input | Sự thật đứng sau mỗi điểm |
## Thang điểm
- 9–10 — Excellent — đáp ứng hoàn toàn tiêu chí
- 7–8 — Good — đáp ứng tiêu chí, thiếu sót nhỏ
- 5–6 — Adequate — đúng hướng, có điểm lệch đáng kể
- 3–4 — Weak — thiếu sót nghiêm trọng
- 1–2 — Fail — mới nhắm được thoáng qua
- 0 — N/A — không áp dụng
## Quy tắc
1. **Neo vào bằng chứng** — mọi điểm đều PHẢI có bằng chứng. Là sự thật, không phải cảm giác.
2. **Dùng hết khoảng điểm** — 5 là giữa khoảng, không phải mặc định. 0 và 10 hiếm nhưng vẫn có thể.
3. **Hệ số là bộ khuếch đại tương đối** — factor 2 = ảnh hưởng gấp 2 lần factor 1. Tự động chuẩn hóa.
4. **Mục tiêu duy nhất và không rỗng** — cột 1 mỗi dòng đều phải có tên mục tiêu. Không trùng, không trống.
5. **Agent đọc, báo cáo, quyết định** — sau khi compute, giải thích kết quả. Chấm lại hoặc đánh lại trọng số khi cần.
## Files
- `SKILL.cn.md` — phiên bản Trung Quốc
- `compute.py` — Kiểm tra + tính total + rank
- `template/*.score.yml` — hơn 35 template. `x score ls` để liệt kê, `x score init -t <name>` để sao chép
- `EXAMPLE.md` — Thêm ví dụ sử dụng
- `rule-vs-score.md` — Khi nào dùng rule và khi nào dùng score
- `score-template-writer.md` — Cách viết template chấm điểm

## Liên quan

- [rule](../rule/SKILL.md) — bạn đồng hành về tuân thủ
- [naming](../naming/SKILL.md) — tên ứng viên được chấm điểm ở đây
