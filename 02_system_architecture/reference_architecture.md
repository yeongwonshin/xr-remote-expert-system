# Reference Architecture

## 전체 구조
```text
[Field Device]
  - Mobile App / Smart Glass App
  - Camera, Mic, IMU, Depth, QR/NFC
  - AR Rendering, Local Cache, Voice Commands
        │ WebRTC / HTTPS / MQTT
        ▼
[Realtime Collaboration Layer]
  - Signaling Server
  - SFU/Media Router
  - Annotation Sync
  - Session Recorder
        │ Events / Media / Metadata
        ▼
[Application Backend]
  - Session Service
  - Work Order Service
  - User/Org Service
  - Report Service
  - Notification Service
  - Integration Gateway
        │
        ├── [AI/RAG Platform]
        │     - ASR, OCR, Vision Tagging
        │     - Retrieval Service
        │     - LLM Orchestrator
        │     - Guardrail/Evaluator
        │
        ├── [Knowledge Hub]
        │     - Document Store
        │     - Vector DB
        │     - Metadata DB
        │     - Version Control
        │
        ├── [Data Platform]
        │     - Relational DB
        │     - Object Storage
        │     - Event Stream
        │     - Analytics Warehouse
        │
        └── [Enterprise Control]
              - SSO/OIDC/SAML
              - RBAC/ABAC
              - Audit Log
              - Policy Engine
```

## 핵심 설계 원칙
1. 실시간 미디어 경로와 업무 데이터 경로를 분리한다.
2. AI 판단은 항상 근거 문서와 세션 컨텍스트에 묶는다.
3. 작업 지시, AI 답변, 주석, 승인 이벤트는 모두 감사 가능해야 한다.
4. 엣지/온프레미스/클라우드 배포를 동일한 논리 아키텍처로 지원한다.
5. 산업별 규정과 네트워크 제약을 정책으로 흡수한다.

## 주요 컴포넌트
### Field Client
- 모바일: iOS/Android, ARKit/ARCore
- 스마트글래스: HoloLens, RealWear, Android 기반 웨어러블
- 주요 기능: 세션 참여, 음성 명령, AR 오버레이, 증거 캡처, 오프라인 캐시

### Realtime Layer
- WebRTC 기반 저지연 영상/음성
- SFU 기반 다자 세션
- 네트워크 품질 기반 adaptive bitrate
- 주석 좌표계 동기화: 2D screen-space + 3D world-space 지원

### AI/RAG Platform
- 문서 수집: PDF, DOCX, HTML, 이미지, CAD/BIM 메타데이터
- 검색: 하이브리드 검색, 문서 권한 필터링, 버전 필터링
- 생성: 절차 요약, 위험 경고, 리포트 초안
- 평가: 정답성, 출처 충실도, 위험 지시 차단

### Enterprise Backend
- 조직/현장/장비/사용자/역할 관리
- 세션과 워크오더 라이프사이클 관리
- 외부 시스템 연동 API
- 감사로그, 보존정책, 데이터 마스킹
