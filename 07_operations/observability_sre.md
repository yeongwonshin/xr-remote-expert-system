# Observability & SRE

## 관측 대상
| 영역 | 지표 |
|---|---|
| 미디어 품질 | RTT, jitter, packet loss, bitrate, resolution |
| 세션 안정성 | 연결 성공률, 재연결 횟수, 중단률 |
| AI/RAG | 검색 지연, 생성 지연, citation coverage, 오류율 |
| 백엔드 | API latency, error rate, queue depth |
| 데이터 | 인덱싱 성공률, 문서 처리 실패율, 저장소 사용량 |
| 보안 | 로그인 실패, 권한 거부, 외부 초대, 다운로드 |

## SLO 예시
| 서비스 | SLO |
|---|---|
| 세션 생성 API | 99.9% 월간 가용성 |
| WebRTC 연결 성공 | 95% 이상 |
| AI/RAG 응답 | P95 3초 이하 |
| 리포트 생성 | P95 60초 이하 |
| 감사로그 기록 | 99.99% 성공 |

## 알림 정책
- Critical: 세션 생성 불가, 미디어 라우터 장애, 감사로그 중단
- High: AI/RAG 전체 장애, 문서 인덱싱 실패 급증
- Medium: 특정 테넌트 지연 증가, TURN 사용량 급증
- Low: 문서 OCR 품질 저하, 오래된 지식 문서 증가

## 장애 대응 Runbook
### WebRTC 연결 실패
1. Signaling 로그 확인
2. ICE candidate 실패 여부 확인
3. TURN 서버 부하 확인
4. 고객 방화벽 정책 확인
5. 스냅샷/음성 우선 모드 안내

### AI 응답 오류
1. Retrieval service 상태 확인
2. Vector DB 지연 확인
3. LLM provider 또는 로컬 모델 상태 확인
4. Guardrail 차단 로그 확인
5. 수동 검색 fallback 안내

### 리포트 생성 실패
1. 세션 이벤트 타임라인 완성도 확인
2. 전사 데이터 존재 여부 확인
3. 템플릿 렌더링 오류 확인
4. 재시도 큐 처리
5. 수동 리포트 템플릿 제공
