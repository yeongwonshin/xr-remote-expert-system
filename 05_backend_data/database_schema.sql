-- XR Remote Expert Professional System - Core Schema

CREATE TABLE tenants (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  plan TEXT NOT NULL,
  data_region TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE sites (
  id UUID PRIMARY KEY,
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  name TEXT NOT NULL,
  address TEXT,
  timezone TEXT NOT NULL DEFAULT 'Asia/Seoul',
  risk_level TEXT NOT NULL DEFAULT 'normal',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE assets (
  id UUID PRIMARY KEY,
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  site_id UUID REFERENCES sites(id),
  asset_code TEXT NOT NULL,
  name TEXT NOT NULL,
  manufacturer TEXT,
  model TEXT,
  serial_number TEXT,
  location_label TEXT,
  metadata JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (tenant_id, asset_code)
);

CREATE TABLE users (
  id UUID PRIMARY KEY,
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  email TEXT NOT NULL,
  display_name TEXT NOT NULL,
  user_type TEXT NOT NULL, -- technician, expert, supervisor, admin, vendor
  status TEXT NOT NULL DEFAULT 'active',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (tenant_id, email)
);

CREATE TABLE work_orders (
  id UUID PRIMARY KEY,
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  asset_id UUID REFERENCES assets(id),
  external_ref TEXT,
  title TEXT NOT NULL,
  description TEXT,
  priority TEXT NOT NULL DEFAULT 'medium',
  status TEXT NOT NULL DEFAULT 'open',
  error_code TEXT,
  created_by UUID REFERENCES users(id),
  assigned_to UUID REFERENCES users(id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE sessions (
  id UUID PRIMARY KEY,
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  work_order_id UUID REFERENCES work_orders(id),
  asset_id UUID REFERENCES assets(id),
  status TEXT NOT NULL DEFAULT 'created',
  started_at TIMESTAMPTZ,
  ended_at TIMESTAMPTZ,
  media_recording_url TEXT,
  network_quality JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE session_participants (
  session_id UUID NOT NULL REFERENCES sessions(id),
  user_id UUID NOT NULL REFERENCES users(id),
  role_in_session TEXT NOT NULL,
  joined_at TIMESTAMPTZ,
  left_at TIMESTAMPTZ,
  PRIMARY KEY(session_id, user_id)
);

CREATE TABLE annotations (
  id UUID PRIMARY KEY,
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  session_id UUID NOT NULL REFERENCES sessions(id),
  created_by UUID REFERENCES users(id),
  annotation_type TEXT NOT NULL,
  coordinate_type TEXT NOT NULL, -- screen_space, world_space, hybrid
  payload JSONB NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE knowledge_documents (
  id UUID PRIMARY KEY,
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  title TEXT NOT NULL,
  source_uri TEXT,
  document_type TEXT NOT NULL,
  version TEXT,
  security_level TEXT NOT NULL DEFAULT 'internal',
  approval_status TEXT NOT NULL DEFAULT 'draft',
  metadata JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  indexed_at TIMESTAMPTZ
);

CREATE TABLE knowledge_chunks (
  id UUID PRIMARY KEY,
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  document_id UUID NOT NULL REFERENCES knowledge_documents(id),
  chunk_index INTEGER NOT NULL,
  page_start INTEGER,
  page_end INTEGER,
  content TEXT NOT NULL,
  metadata JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE ai_answers (
  id UUID PRIMARY KEY,
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  session_id UUID REFERENCES sessions(id),
  question TEXT NOT NULL,
  answer TEXT NOT NULL,
  citations JSONB NOT NULL DEFAULT '[]',
  confidence NUMERIC(4,3),
  safety_class TEXT NOT NULL DEFAULT 'normal',
  feedback TEXT, -- accepted, edited, rejected
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE evidence_items (
  id UUID PRIMARY KEY,
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  session_id UUID NOT NULL REFERENCES sessions(id),
  evidence_type TEXT NOT NULL, -- photo, video_clip, measurement, note
  uri TEXT,
  description TEXT,
  captured_by UUID REFERENCES users(id),
  captured_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  metadata JSONB NOT NULL DEFAULT '{}'
);

CREATE TABLE reports (
  id UUID PRIMARY KEY,
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  session_id UUID NOT NULL REFERENCES sessions(id),
  status TEXT NOT NULL DEFAULT 'draft',
  report_body JSONB NOT NULL DEFAULT '{}',
  pdf_uri TEXT,
  approved_by UUID REFERENCES users(id),
  approved_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE audit_events (
  id UUID PRIMARY KEY,
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  actor_user_id UUID REFERENCES users(id),
  event_type TEXT NOT NULL,
  resource_type TEXT NOT NULL,
  resource_id UUID,
  ip_address INET,
  user_agent TEXT,
  payload JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_assets_tenant_model ON assets(tenant_id, model);
CREATE INDEX idx_work_orders_status ON work_orders(tenant_id, status, priority);
CREATE INDEX idx_sessions_work_order ON sessions(work_order_id);
CREATE INDEX idx_annotations_session ON annotations(session_id, created_at);
CREATE INDEX idx_knowledge_documents_tenant ON knowledge_documents(tenant_id, approval_status, security_level);
CREATE INDEX idx_ai_answers_session ON ai_answers(session_id, created_at);
CREATE INDEX idx_audit_events_tenant_time ON audit_events(tenant_id, created_at DESC);
