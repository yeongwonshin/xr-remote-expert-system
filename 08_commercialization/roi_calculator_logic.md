# ROI Calculator Logic

## 입력값
| 변수 | 설명 |
|---|---|
| incidents_per_month | 월 장애/지원 건수 |
| avg_downtime_hours | 건당 평균 다운타임 |
| downtime_cost_per_hour | 시간당 다운타임 비용 |
| expert_travel_cost | 전문가 출장 1회 비용 |
| travel_required_rate | 출장 필요 비율 |
| report_hours | 건당 리포트 작성 시간 |
| labor_cost_per_hour | 시간당 인건비 |
| expected_mttr_reduction | 예상 MTTR 감소율 |
| expected_travel_reduction | 예상 출장 감소율 |
| expected_report_time_reduction | 예상 리포트 시간 감소율 |
| monthly_subscription | 월 구독료 |

## 계산식
```text
monthly_downtime_cost = incidents_per_month * avg_downtime_hours * downtime_cost_per_hour
monthly_travel_cost = incidents_per_month * travel_required_rate * expert_travel_cost
monthly_report_cost = incidents_per_month * report_hours * labor_cost_per_hour

saved_downtime = monthly_downtime_cost * expected_mttr_reduction
saved_travel = monthly_travel_cost * expected_travel_reduction
saved_report = monthly_report_cost * expected_report_time_reduction

total_monthly_savings = saved_downtime + saved_travel + saved_report
net_monthly_benefit = total_monthly_savings - monthly_subscription
roi = net_monthly_benefit / monthly_subscription
payback_months = setup_cost / max(net_monthly_benefit, 1)
```

## 예시 메시지
“월 80건의 장애 대응에서 평균 다운타임을 25% 줄이고 출장의 40%를 원격 대체하며 리포트 시간을 60% 줄이면, 월 구독료 대비 순절감액을 산출할 수 있다.”

## 주의
ROI는 고객 산업별 다운타임 비용에 따라 크게 달라진다. 파일럿 전에는 추정치로 계산하고, 파일럿 후 실제 세션 데이터를 반영해 갱신한다.
