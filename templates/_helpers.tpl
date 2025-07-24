{{/*
Expand the name of the chart.
*/}}
{{- define "florestad-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "florestad-chart.fullname" -}}
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
Create chart name and version as used by the chart label.
*/}}
{{- define "florestad-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "florestad-chart.labels" -}}
helm.sh/chart: {{ include "florestad-chart.chart" . }}
{{ include "florestad-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "florestad-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "florestad-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the image reference with priority: sha > tag > appVersion
*/}}
{{- define "florestad-chart.image" -}}
{{- if .Values.image.sha }}
{{- printf "%s@%s" .Values.image.repository .Values.image.sha }}
{{- else if .Values.image.tag }}
{{- printf "%s:%s" .Values.image.repository .Values.image.tag }}
{{- else }}
{{- printf "%s:%s" .Values.image.repository .Chart.AppVersion }}
{{- end }}
{{- end }}
