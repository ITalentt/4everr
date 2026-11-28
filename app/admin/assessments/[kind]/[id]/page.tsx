"use client";

import { useParams } from "next/navigation";
import AdminAssessmentsManager from "@/components/AdminAssessmentsManager";
import type { AssessmentKind } from "@/lib/assessments";

export default function EditAssessmentPage() {
  const params = useParams<{ kind: string; id: string }>();
  const kind: AssessmentKind = params.kind === "survey" ? "survey" : "test";
  return <AdminAssessmentsManager editorOnly initialKind={kind} initialId={params.id} />;
}
