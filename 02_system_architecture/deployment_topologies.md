# Deployment Topologies

## 1. SaaS Multi-Tenant
```text
Customer Devices → Public Internet/VPN → SaaS Cloud → Managed AI/RAG
```
- 적합: 일반 제조, 중소/중견 기업, 빠른 PoC
- 장점: 빠른 도입, 운영 부담 낮음
- 고려: 데이터 레지던시, 외부망 접속 정책

## 2. Private Cloud
```text
Customer Network/VPN → Dedicated Cloud VPC → Private AI/RAG → Customer IAM
```
- 적합: 대기업, 의료, 에너지, 통신
- 장점: 네트워크/권한/데이터 분리 강화
- 고려: 고객별 운영 비용 증가

## 3. On-Premise
```text
Field LAN/Private 5G → On-Prem Kubernetes → Local Object Storage/Vector DB
```
- 적합: 보안구역, 국가기간산업, 선박/항공 정비센터
- 장점: 데이터 외부 반출 최소화, 내부망 운영
- 고려: 설치/업데이트/장애 대응 체계 필요

## 4. Edge-Assisted
```text
Field Device → Edge Gateway → Cloud or On-Prem Core
```
- 적합: 저대역폭 현장, 해상/산악/발전소
- 장점: 로컬 캐시, 영상 전처리, 오프라인 지식팩
- 고려: 엣지 장비 관리와 동기화 충돌 처리

## 배포 선택 기준
| 기준 | SaaS | Private Cloud | On-Prem | Edge |
|---|---:|---:|---:|---:|
| 도입 속도 | 높음 | 중간 | 낮음 | 중간 |
| 데이터 통제 | 중간 | 높음 | 매우 높음 | 높음 |
| 운영 비용 | 낮음 | 중간 | 높음 | 중간~높음 |
| 오프라인 대응 | 낮음 | 중간 | 높음 | 매우 높음 |
| 대기업 보안 적합성 | 중간 | 높음 | 매우 높음 | 높음 |
