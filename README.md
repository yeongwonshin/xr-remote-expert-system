# XR 원격 전문가 지원 시스템 — 전문 시스템 디렉토리

본 디렉토리는 단순 MVP가 아니라 **엔터프라이즈 상용 시스템**으로 확장하기 위한 제품·기술·운영·보안·상용화 설계 패키지입니다.

## 제품 한 줄 정의
현장 작업자의 1인칭 영상·음성·공간 정보를 원격 전문가와 공유하고, 전문가 주석을 AR로 정합하며, AI가 매뉴얼 검색·절차 추천·위험 감지·작업 리포트를 자동화하는 산업용 XR 협업 플랫폼.

## 핵심 차별화
- 단순 화상/주석이 아니라 **작업 절차 중심의 Assistance Operating System**
- RAG 기반 매뉴얼·도면·SOP·장비 이력 검색
- 세션 중 자동 기록: 음성, 영상 스냅샷, 주석, 부품, 측정값, 의사결정
- 정비 리포트, 원인 분석, 후속 작업, 부품 요청 자동 생성
- EAM/CMMS, Field Service, HIS/EMR, ERP, PLM, BIM, SCADA/MES 연계
- 보안 구역용 온프레미스/프라이빗 클라우드/엣지 배포 옵션

## 디렉토리 구조
```text
xr_remote_expert_pro_system/
├─ README.md
├─ 00_executive/
│  ├─ system_one_pager.md
│  ├─ professional_system_summary.md
│  └─ target_industries.md
├─ 01_product/
│  ├─ product_vision.md
│  ├─ persona_and_use_cases.md
│  ├─ feature_catalog.md
│  ├─ workflow_blueprint.md
│  ├─ kpi_and_success_metrics.md
│  └─ competitive_positioning.md
├─ 02_system_architecture/
│  ├─ reference_architecture.md
│  ├─ module_map.md
│  ├─ deployment_topologies.md
│  ├─ integration_architecture.md
│  └─ data_flow.mmd
├─ 03_ar_remote_assist/
│  ├─ realtime_collaboration_design.md
│  ├─ ar_annotation_and_spatial_anchor.md
│  ├─ device_support_matrix.md
│  └─ session_state_machine.md
├─ 04_ai_rag/
│  ├─ rag_architecture.md
│  ├─ knowledge_ingestion_pipeline.md
│  ├─ ai_copilot_behaviors.md
│  ├─ prompt_and_guardrail_design.md
│  └─ evaluation_plan.md
├─ 05_backend_data/
│  ├─ domain_model.md
│  ├─ database_schema.sql
│  ├─ api_contract_openapi.yaml
│  ├─ event_schema.json
│  └─ report_template.md
├─ 06_security_compliance/
│  ├─ security_architecture.md
│  ├─ privacy_and_data_governance.md
│  ├─ enterprise_controls.md
│  └─ threat_model.md
├─ 07_operations/
│  ├─ observability_sre.md
│  ├─ admin_console.md
│  ├─ support_and_sla.md
│  └─ onboarding_playbook.md
├─ 08_commercialization/
│  ├─ packaging_and_pricing.md
│  ├─ go_to_market.md
│  ├─ roi_calculator_logic.md
│  └─ pilot_to_scale_plan.md
├─ 09_roadmap/
│  ├─ 12_month_roadmap.md
│  ├─ release_plan.md
│  └─ risk_register.csv
├─ 10_prototype_assets/
│  ├─ sample_session_report.md
│  ├─ sample_manual_chunk.jsonl
│  ├─ sample_work_order.json
│  └─ ui_screen_list.md
└─ 99_references/
   └─ research_and_market_notes.md
```

## 권장 사용법
1. `00_executive`로 투자자/경영진용 핵심 설명을 만든다.
2. `01_product`와 `03_ar_remote_assist`로 고객 데모 시나리오를 정리한다.
3. `02_system_architecture`, `04_ai_rag`, `05_backend_data`로 개발 착수 범위를 확정한다.
4. `06_security_compliance`와 `07_operations`로 대기업 PoC 요구사항에 대응한다.
5. `08_commercialization`, `09_roadmap`으로 가격·파일럿·확장 전략을 수립한다.

## 시스템 성숙도 기준
- **MVP:** 영상 공유, 주석, 음성, 매뉴얼 검색, 리포트 생성
- **Professional:** SSO, 감사로그, 역할권한, 지식 파이프라인, 워크오더 연동, 장비 이력, SLA 운영, 모델 평가
- **Enterprise:** 온프레미스, 엣지, 프라이빗 모델, 산업별 규정, 다국어, 대규모 디바이스 관리, 고가용성, 데이터 레지던시
