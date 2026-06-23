# AR Annotation & Spatial Anchor

## 주석 타입
| 타입 | 설명 | 데이터 |
|---|---|---|
| Arrow | 방향 지시 | start/end 좌표, 색상, 라벨 |
| Circle | 특정 부품 강조 | 중심, 반경, 평면/공간 기준 |
| Freehand | 손그림 표시 | path points |
| Text | 짧은 설명 | 텍스트, 위치, 크기 |
| Pin | 번호가 있는 작업 포인트 | 번호, 좌표, 체크 상태 |
| Checklist Marker | 절차 단계와 연결 | step_id, status |
| Measurement | 거리/각도/수치 표시 | 단위, 측정값, 신뢰도 |

## 좌표계 전략
### 2D Screen-Space Annotation
- 빠르고 단순함
- 모바일 초기 버전에 적합
- 사용자가 카메라를 움직이면 주석 위치가 화면 기준으로만 유지됨

### 3D World-Space Annotation
- 실제 장비 위치에 주석 고정
- ARKit/ARCore/Spatial Mapping 필요
- 스마트글래스/고급 모바일 기능에 적합

### Hybrid Strategy
1. 모든 주석은 기본적으로 2D 좌표를 저장한다.
2. 디바이스가 지원하면 3D 앵커를 추가 저장한다.
3. 추적이 손실되면 2D 스냅샷 기반 fallback으로 전환한다.

## Spatial Anchor 데이터 모델
```json
{
  "anchor_id": "anc_123",
  "session_id": "sess_456",
  "anchor_type": "world_space",
  "pose": {
    "position": {"x": 0.12, "y": 1.43, "z": -0.82},
    "rotation": {"x": 0, "y": 0.71, "z": 0, "w": 0.70}
  },
  "confidence": 0.91,
  "created_by": "expert_001",
  "created_at": "2026-06-24T10:00:00+09:00"
}
```

## 안전 설계
- 고위험 지시는 빨간색 등 단일 색상 의미에만 의존하지 않는다.
- 주석은 텍스트와 단계 번호를 함께 표시한다.
- 작업자가 “확인”하기 전까지 다음 단계로 넘어가지 않는다.
- AI가 생성한 주석은 전문가 승인 후 표시한다.

## 주석 품질 평가
- 주석이 목표 객체에 유지되는 시간
- 작업자의 주석 이해도
- 주석 생성 후 작업 완료까지 시간
- 잘못된 주석으로 인한 수정/취소 횟수
