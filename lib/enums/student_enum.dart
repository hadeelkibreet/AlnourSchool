enum StudentStatus {
  accepted(id: 0, name: "مقبول"),
  pending(id: 1, name: "قيد المعالجة"),
  rejected(id: 2, name: "مرفوضة"),
  unknown(id: 3, name: "غير معرف");

  final int id;
  final String name;
  const StudentStatus({required this.id, required this.name});
}
