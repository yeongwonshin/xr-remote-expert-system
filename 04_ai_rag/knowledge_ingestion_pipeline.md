# Knowledge Ingestion Pipeline

## 수집 대상
- PDF 매뉴얼
- DOCX/SOP 문서
- HTML 위키/Confluence
- 장비 도면, 부품표, BOM
- 과거 작업 리포트
- 오류코드 DB
- 안전 규정 문서
- 교육 자료와 동영상 자막

## 파이프라인 단계
1. **Source Connector**
   - SharePoint, Google Drive, S3, ERP, CMMS, PLM, 파일 업로드
2. **Document Normalization**
   - 텍스트 추출, OCR, 표 추출, 이미지 캡션, 레이아웃 보존
3. **Metadata Enrichment**
   - 장비 모델, 부품번호, 오류코드, 문서 버전, 보안등급 태깅
4. **Chunking**
   - 제목/절차/표/경고문 단위로 의미 기반 분할
5. **Embedding & Indexing**
   - 벡터화, 키워드 인덱스, 권한 필터 인덱스 생성
6. **Quality Check**
   - 누락 페이지, OCR 품질, 중복 문서, 버전 충돌 확인
7. **Approval Workflow**
   - 지식 관리자 승인 후 운영 인덱스 반영
8. **Monitoring**
   - 검색 실패, 낮은 채택률, 오래된 문서 알림

## 메타데이터 스키마
```json
{
  "document_id": "doc_001",
  "title": "Pump-X200 Service Manual",
  "version": "3.2",
  "effective_date": "2026-01-15",
  "asset_models": ["Pump-X200", "Pump-X220"],
  "error_codes": ["E37", "E41"],
  "security_level": "internal",
  "language": "ko-KR",
  "owner_team": "Maintenance Engineering",
  "approval_status": "approved"
}
```

## Chunking 전략
| 문서 유형 | 분할 기준 |
|---|---|
| 매뉴얼 | 섹션, 오류코드, 절차 단계 |
| SOP | 작업 단계, 위험 경고, 승인 조건 |
| 표 | 행/열 의미 보존, 표 단위 검색 |
| 도면 | 객체/부품번호/위치 메타데이터 |
| 리포트 | 증상, 원인, 조치, 결과, 부품 |

## 품질 게이트
- OCR confidence 0.85 미만 문서 검토
- 문서 버전 충돌 시 최신 승인본만 운영 인덱스 반영
- 보안등급 누락 문서 차단
- 출처 페이지 없는 chunk 차단
- 위험 절차는 safety tag 필수
