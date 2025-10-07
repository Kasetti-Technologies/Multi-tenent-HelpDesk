{{/*
Expand the name of the chart.
*/}}
{{- define "tool-registry-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "tool-registry-service.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart labels for use in selector and metadata.
*/}}
{{- define "tool-registry-service.labels" -}}
helm.sh/chart: {{ include "tool-registry-service.name" . }}
{{ include "tool-registry-service.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels that must be on all pods.
*/}}
{{- define "tool-registry-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "tool-registry-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}