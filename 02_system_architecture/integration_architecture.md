# Integration Architecture

## 통합 철학
고객사는 이미 워크오더, 자산관리, 문서관리, 재고관리, 티켓 시스템을 사용하고 있다. 본 시스템은 이를 대체하지 않고 **XR 세션과 AI 지식 레이어를 기존 업무 시스템에 연결**한다.

## 대표 연동 시나리오
### CMMS/EAM 연동
- 워크오더 생성/조회
- 장비 ID, 위치, 모델, 보증 상태 조회
- 작업 결과와 리포트 첨부
- 부품 사용량과 후속 작업 업데이트

### 문서관리 연동
- 매뉴얼, SOP, 도면, 서비스 불릿틴 수집
- 문서 버전과 권한 동기화
- 문서 변경 시 인덱스 재생성
- 문서 접근 로그 기록

### 티켓/ITSM 연동
- 긴급 장애 티켓 생성
- 담당 전문가 배정
- SLA 상태 업데이트
- 세션 리포트 자동 첨부

### ERP/재고 연동
- 필요한 부품 번호 추출
- 재고 확인
- 구매 요청 생성
- 비용 코드와 작업 코드 연결

## Integration Gateway 패턴
```text
Internal Service → Integration Gateway → Connector → External System
```
- Connector는 시스템별 인증, 스키마 변환, 재시도, 오류 매핑 담당
- 모든 외부 전송은 감사로그에 기록
- 민감 데이터는 정책에 따라 마스킹 후 전송

## 이벤트 기반 통합
- work_order.created
- session.completed
- report.approved
- part.requested
- ai.answer.generated
- knowledge.index.updated

## 데이터 매핑 예시
| XR 시스템 | CMMS/EAM |
|---|---|
| asset_id | equipment_id |
| session_id | service_session_ref |
| report_url | attachment_url |
| root_cause | failure_code |
| corrective_action | action_taken |
| parts_used | material_consumption |
