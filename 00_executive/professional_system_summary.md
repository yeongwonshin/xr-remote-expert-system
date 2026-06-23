# 전문 시스템 요약

## 시스템 명칭
XR 원격 전문가 지원 및 AI 작업 코파일럿 플랫폼

## 시스템 경계
이 시스템은 단순 영상통화 도구가 아니다. 현장 작업의 전 과정을 `작업 요청 → 원격 연결 → 절차 안내 → 지식 검색 → 증거 수집 → 리포트 → 후속 작업`으로 관리하는 운영 플랫폼이다.

## 주요 서브시스템
| 서브시스템 | 설명 | 핵심 산출물 |
|---|---|---|
| XR Collaboration | 1인칭 영상, 음성, AR 주석, 공간 앵커 | 세션 녹화, 주석 로그, 스냅샷 |
| AI Copilot | 매뉴얼 RAG, 절차 추천, 질의응답, 위험 알림 | 근거 포함 답변, 체크리스트, 경고 |
| Knowledge Hub | 매뉴얼, SOP, 도면, 부품표, 고장 이력 인덱싱 | 검색 인덱스, 문서 버전, 접근권한 |
| Work Orchestration | 워크오더, 티켓, 승인, 후속 작업 | 작업 상태, 부품 요청, 승인 기록 |
| Report Automation | 작업 리포트, 원인 분석, 품질 점검 | PDF/HTML 리포트, ERP 전송 데이터 |
| Enterprise Control | SSO, RBAC, 감사로그, 보안 정책 | 권한 정책, 로그, 규정 준수 증적 |
| Admin & Analytics | 조직/장비/사용자/성과 관리 | MTTR, FTF, 세션 품질, 지식 활용률 |

## 전문 시스템의 필수 조건
1. **현장성:** 장갑 착용, 소음, 저대역폭, 오프라인 상황을 전제로 설계
2. **정확성:** AI 답변은 원문 근거와 문서 버전을 반드시 표시
3. **안전성:** 고위험 작업은 AI가 단독 지시하지 않고 전문가 확인을 요구
4. **추적성:** 누가 어떤 지시를 했고 어떤 조치를 했는지 감사 가능해야 함
5. **통합성:** 기존 워크오더·자산관리·문서관리 체계와 연결되어야 함
6. **확장성:** 모바일, 태블릿, 웹, HoloLens, RealWear, 기타 스마트글래스 지원

## 기술 키워드
WebRTC, SFU, ARKit/ARCore, OpenXR, Spatial Anchor, RAG, Vector DB, OCR, ASR, LLM Guardrails, SSO, SCIM, RBAC, Audit Log, Edge Deployment, Kubernetes, Observability.
