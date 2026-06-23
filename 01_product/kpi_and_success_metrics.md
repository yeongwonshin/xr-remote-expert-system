# KPI & Success Metrics

## 비즈니스 KPI
| KPI | 정의 | 목표 예시 |
|---|---|---|
| MTTR | 평균 복구 시간 | 20~40% 감소 |
| First-Time Fix Rate | 첫 방문 해결률 | 10~25%p 개선 |
| Expert Utilization | 전문가 시간 활용률 | 원격 지원 세션 수 증가 |
| Travel Cost | 전문가 출장 비용 | 30~60% 감소 |
| Report Time | 리포트 작성 시간 | 50~80% 감소 |
| Training Time | 신입 작업자 독립 작업까지 기간 | 20~40% 단축 |

## 제품 KPI
| KPI | 정의 | 목표 예시 |
|---|---|---|
| Session Success Rate | 세션이 중단 없이 완료된 비율 | 95%+ |
| Annotation Accuracy | 주석이 목표 위치에 유지된 비율 | 90%+ |
| RAG Answer Acceptance | 전문가가 AI 답변을 채택한 비율 | 70%+ |
| Citation Coverage | AI 답변 중 출처가 있는 비율 | 100% |
| Report Edit Distance | AI 리포트 수정량 | 릴리스별 감소 |
| Search Latency | 매뉴얼 검색 응답 시간 | 3초 이하 목표 |

## 운영 KPI
- 영상 평균 지연시간
- 네트워크 패킷 손실률
- AI 오류/환각 신고율
- 감사로그 누락률
- 지식 문서 최신화율
- SLA 위반률

## 측정 이벤트
- session_started
- expert_joined
- annotation_created
- manual_search_performed
- ai_answer_accepted
- checklist_step_completed
- evidence_captured
- report_generated
- report_approved
- work_order_synced
