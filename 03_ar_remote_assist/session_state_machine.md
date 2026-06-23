# Session State Machine

```text
CREATED
  → WAITING_FOR_EXPERT
  → CONNECTING
  → LIVE
  → PAUSED
  → LIVE
  → COMPLETING
  → REPORT_GENERATING
  → REVIEW_PENDING
  → CLOSED
```

## 상태 정의
| 상태 | 설명 | 주요 이벤트 |
|---|---|---|
| CREATED | 워크오더 또는 즉시 지원 요청 생성 | session.created |
| WAITING_FOR_EXPERT | 전문가 배정 대기 | expert.assigned |
| CONNECTING | WebRTC 연결 협상 | media.connected |
| LIVE | 영상/음성/주석 진행 | annotation.created, ai.answer.generated |
| PAUSED | 일시중지, 네트워크 복구, 작업 대기 | session.paused |
| COMPLETING | 종료 전 체크리스트 확인 | checklist.completed |
| REPORT_GENERATING | AI 리포트 생성 | report.generated |
| REVIEW_PENDING | 전문가/관리자 검토 | report.approved |
| CLOSED | 세션 종료 및 보관 | session.closed |

## 예외 상태
| 상태 | 설명 | 처리 |
|---|---|---|
| NETWORK_DEGRADED | 품질 저하 | 저대역폭 모드 전환 |
| EXPERT_DROPPED | 전문가 연결 끊김 | 백업 전문가 초대 |
| AI_UNAVAILABLE | AI 서비스 불가 | 수동 검색 fallback |
| POLICY_BLOCKED | 보안 정책 위반 | 세션 중단/관리자 승인 요청 |
| EMERGENCY_STOP | 안전 위험 감지 | 모든 지시 중단, 안전 절차 표시 |

## 상태 전환 정책
- LIVE에서 CLOSED로 바로 이동하지 않고 COMPLETING을 거쳐 누락 증거를 확인한다.
- 고위험 작업은 Supervisor 승인 이벤트가 없으면 다음 단계로 넘어가지 않는다.
- AI가 생성한 절차는 Expert Confirmed 상태가 되어야 작업자에게 실행 지시로 표시된다.
