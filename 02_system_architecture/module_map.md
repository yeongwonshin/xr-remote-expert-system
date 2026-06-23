# Module Map

## Frontend Modules
| 모듈 | 설명 |
|---|---|
| Field Mobile App | 현장 작업자용 모바일 앱 |
| Smart Glass App | 스마트글래스용 핸즈프리 앱 |
| Expert Web Console | 전문가용 웹 콘솔 |
| Admin Console | 관리자용 조직/정책/지식 관리 콘솔 |
| Analytics Dashboard | 운영 KPI와 세션 품질 분석 |

## Backend Services
| 서비스 | 책임 |
|---|---|
| Identity Service | SSO, 사용자, 조직, 테넌트 |
| Session Service | 세션 생성, 참여자, 상태, 권한 |
| Signaling Service | WebRTC 연결 협상 |
| Annotation Service | 주석 생성, 동기화, 저장 |
| Media Service | 녹화, 스냅샷, 미디어 보관 |
| Work Order Service | 작업 요청, 상태, 체크리스트 |
| Knowledge Service | 문서, 매뉴얼, 인덱스, 권한 |
| AI Orchestrator | RAG, 요약, 리포트, 위험 감지 |
| Report Service | 리포트 생성, 승인, 내보내기 |
| Integration Gateway | CMMS, ERP, 티켓, PLM 연동 |
| Audit Service | 감사 이벤트, 보존, 검색 |
| Notification Service | 이메일, 푸시, 메신저 알림 |

## Data Stores
| 저장소 | 데이터 |
|---|---|
| PostgreSQL | 업무 데이터, 조직, 세션 메타데이터 |
| Object Storage | 영상, 이미지, 문서, 리포트 |
| Vector DB | 문서 임베딩, 장비 이력 임베딩 |
| Redis | 세션 상태, 큐, 임시 토큰 |
| Event Stream | 실시간 이벤트, 분석 파이프라인 |
| Warehouse | KPI, 사용량, 품질 분석 |

## 외부 연동
- EAM/CMMS: SAP PM, IBM Maximo, ServiceNow, Hexagon, 자체 시스템
- Field Service: Dynamics 365 Field Service, Salesforce Field Service
- Document Management: SharePoint, Confluence, Google Drive, Box
- ERP: SAP, Oracle, MS Dynamics
- Identity: Azure AD/Entra ID, Okta, Google Workspace
- Device Management: Intune, Workspace ONE, Android Enterprise
