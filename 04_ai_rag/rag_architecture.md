# RAG Architecture

## 목표
작업자가 장비 앞에서 자연어로 질문하면, 시스템은 해당 장비·오류·작업상황에 맞는 최신 매뉴얼/SOP/이력 문서를 검색하고, 출처가 명확한 답변과 다음 절차를 제공한다.

## RAG 파이프라인
```text
User Query + Session Context
  ↓
Query Understanding
  - 장비 ID, 모델, 오류코드, 증상, 언어, 위험도 추출
  ↓
Policy & Permission Filter
  - 사용자 권한, 현장, 문서 보안등급 적용
  ↓
Hybrid Retrieval
  - Keyword BM25 + Vector Search + Metadata Filter
  ↓
Reranking
  - 장비 모델, 문서 버전, 오류코드, 절차 단계 기준 재정렬
  ↓
Answer Generation
  - 근거 문서 기반 요약, 단계 제안, 주의사항
  ↓
Guardrail
  - 위험 작업, 불확실성, 문서 미근거 답변 차단
  ↓
Expert Confirmation
  - 필요 시 전문가 승인 후 작업자 화면 표시
```

## 컨텍스트 구성
- 장비 ID, 모델, 시리얼번호
- 워크오더 유형과 긴급도
- 현장 위치와 규정
- 현재 세션 전사/주석/체크리스트 상태
- 과거 유사 고장 리포트
- 사용자의 역할과 자격

## 검색 인덱스
| 인덱스 | 내용 |
|---|---|
| Manual Index | 장비 매뉴얼, 서비스 가이드 |
| SOP Index | 표준 작업 절차, 안전 절차 |
| Fault History Index | 과거 고장, 원인, 조치 |
| Parts Index | 부품번호, 대체품, 재고 연동 키 |
| Drawing Index | 도면/BIM/PLM 메타데이터 |
| Safety Index | 위험물, LOTO, 전기/압력/화학 안전 |

## 답변 정책
- 출처 없는 답변 금지
- 문서 버전과 날짜 표시
- 위험 작업은 “전문가 확인 필요” 표시
- 여러 문서가 충돌하면 충돌 사실을 알리고 최신 승인 문서 우선
- 불확실한 경우 추측하지 않고 추가 확인 질문 또는 전문가 연결 제안

## 응답 예시
```text
오류 E37은 냉각수 유량 부족과 관련될 가능성이 높습니다.
근거: Pump-X200 Service Manual v3.2, p.118, Troubleshooting E37.

다음 확인 절차:
1. 전원 차단 및 LOTO 확인
2. 냉각수 밸브 V-12 개방 상태 확인
3. 필터 F-03 막힘 여부 확인
4. 유량 센서 FS-2 연결 상태 확인

주의: 펌프가 최근 30분 이내 운전된 경우 고온 부품 접촉을 피하십시오.
```
