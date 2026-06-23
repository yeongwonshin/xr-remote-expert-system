# Domain Model

## 핵심 엔티티
| 엔티티 | 설명 |
|---|---|
| Tenant | 고객 기업 또는 조직 |
| Site | 공장, 병원, 현장, 선박, 기지국 등 위치 |
| Asset | 장비/설비/부품 단위 |
| User | 작업자, 전문가, 관리자, 외부 벤더 |
| Role | Technician, Expert, Supervisor, Admin, Vendor |
| WorkOrder | 작업 요청, 고장 티켓, 점검 과제 |
| Session | XR 원격 지원 세션 |
| Annotation | AR 주석과 공간 앵커 |
| Checklist | 작업 단계와 완료 상태 |
| KnowledgeDocument | 매뉴얼, SOP, 도면, 리포트 |
| KnowledgeChunk | 검색 가능한 문서 조각 |
| AIAnswer | AI 답변, 출처, 신뢰도, 사용자 피드백 |
| Evidence | 사진, 영상 구간, 측정값, 주석 스냅샷 |
| Report | 작업 리포트와 승인 상태 |
| AuditEvent | 모든 중요 활동 로그 |

## 관계
```text
Tenant 1 ─ N Site
Site 1 ─ N Asset
Asset 1 ─ N WorkOrder
WorkOrder 1 ─ N Session
Session 1 ─ N Annotation
Session 1 ─ N Evidence
Session 1 ─ N AIAnswer
Session 1 ─ 1 Report
KnowledgeDocument 1 ─ N KnowledgeChunk
AIAnswer N ─ N KnowledgeChunk
User N ─ N Session
User N ─ N Role
```

## 상태 모델
### WorkOrder
- OPEN
- ASSIGNED
- IN_PROGRESS
- BLOCKED
- RESOLVED
- CLOSED

### Report
- DRAFT
- AI_GENERATED
- EXPERT_REVIEWED
- SUPERVISOR_APPROVED
- EXPORTED
- ARCHIVED

## 멀티테넌시
- 모든 엔티티는 tenant_id를 가진다.
- 데이터베이스 row-level security 또는 application-level tenant isolation 적용.
- Object Storage 경로는 tenant/site/session 기준으로 분리.
- Vector DB 검색도 tenant_id와 문서 권한 필터를 필수 적용.
