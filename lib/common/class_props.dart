abstract class ClassProps {
  static const SELECT_GRADE = "Select Grade";

  static const SECTIONS = <String>[
    "Select Section",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
  ];

  static const GRADES = <String, List<String>>{
    SELECT_GRADE: [Subjects.SELECT_SUBJECT],
    "I": [
      Subjects.SELECT_SUBJECT,
      ...Subjects.GRADE_I,
    ],
    "II": [
      Subjects.SELECT_SUBJECT,
      ...Subjects.GRADE_II,
    ],
    "III": [
      Subjects.SELECT_SUBJECT,
      ...Subjects.GRADE_III,
    ],
    "IV": [
      Subjects.SELECT_SUBJECT,
      ...Subjects.GRADE_IV,
    ],
    "V": [
      Subjects.SELECT_SUBJECT,
      ...Subjects.GRADE_V,
    ],
    "VI": [
      Subjects.SELECT_SUBJECT,
      ...Subjects.GRADE_VI,
    ],
    "VII": [
      Subjects.SELECT_SUBJECT,
      ...Subjects.GRADE_VII,
    ],
    "VIII": [
      Subjects.SELECT_SUBJECT,
      ...Subjects.GRADE_VIII,
    ],
    "IX": [
      Subjects.SELECT_SUBJECT,
      ...Subjects.GRADE_IX,
    ],
    "X": [
      Subjects.SELECT_SUBJECT,
      ...Subjects.GRADE_X,
    ],
  };
}

abstract class Subjects {
  static const SELECT_SUBJECT = "Select Subject";
  static const GRADE_I = <String>[
    Subject.MATHEMATICS,
    Subject.EVS,
    Subject.ENGLISH,
    Subject.TAMIL,
  ];

  static const GRADE_II = <String>[
    Subject.MATHEMATICS,
    Subject.EVS,
    Subject.ENGLISH,
    Subject.TAMIL,
  ];

  static const GRADE_III = <String>[
    Subject.MATHEMATICS,
    Subject.SOCIAL_SCIENCE,
    Subject.EVS,
    Subject.ENGLISH,
    Subject.TAMIL,
  ];

  static const GRADE_IV = <String>[
    Subject.MATHEMATICS,
    Subject.SOCIAL_SCIENCE,
    Subject.SCIENCE,
    Subject.ENGLISH,
    Subject.TAMIL,
  ];

  static const GRADE_V = <String>[
    Subject.MATHEMATICS,
    Subject.SOCIAL_SCIENCE,
    Subject.SCIENCE,
    Subject.ENGLISH,
    Subject.HINDI,
    Subject.TAMIL,
  ];

  static const GRADE_VI = <String>[
    Subject.MATHEMATICS,
    Subject.SOCIAL_SCIENCE,
    Subject.SCIENCE,
    Subject.ENGLISH,
    Subject.TAMIL,
    Subject.HINDI,
    Subject.SANSKRIT,
  ];

  static const GRADE_VII = <String>[
    Subject.MATHEMATICS,
    Subject.SOCIAL_SCIENCE,
    Subject.PHYSICS,
    Subject.CHEMISTRY,
    Subject.BIOLOGY,
    Subject.ENGLISH,
    Subject.TAMIL,
    Subject.HINDI,
    Subject.SANSKRIT,
  ];
  static const GRADE_VIII = <String>[
    Subject.MATHEMATICS,
    Subject.SOCIAL_SCIENCE,
    Subject.PHYSICS,
    Subject.CHEMISTRY,
    Subject.BIOLOGY,
    Subject.ENGLISH,
    Subject.TAMIL,
    Subject.HINDI,
    Subject.SANSKRIT,
  ];

  static const GRADE_IX = <String>[
    Subject.MATHEMATICS,
    Subject.SOCIAL_SCIENCE,
    Subject.PHYSICS,
    Subject.CHEMISTRY,
    Subject.BIOLOGY,
    Subject.ENGLISH,
    Subject.TAMIL,
    Subject.HINDI,
    Subject.SANSKRIT,
  ];

  static const GRADE_X = <String>[
    Subject.MATHEMATICS,
    Subject.SOCIAL_SCIENCE,
    Subject.PHYSICS,
    Subject.CHEMISTRY,
    Subject.BIOLOGY,
    Subject.ENGLISH,
    Subject.TAMIL,
    Subject.HINDI,
    Subject.SANSKRIT,
  ];
}

abstract class Subject {
  static const ENGLISH = "English";
  static const TAMIL = "Tamil - தமிழ்";
  static const HINDI = "Hindi - हिंदी";
  static const SANSKRIT = "Sanskrit - संस्कृतम्";

  static const MATHEMATICS = "Mathematics";

  static const SOCIAL_SCIENCE = "Social Science";
  static const HISTORY = "History";
  static const GEOGRAPHY = "Geography";
  static const POLITICAL_SCIENCE = "Political Science";

  static const EVS = "EVS";
  static const SCIENCE = "Science";
  static const PHYSICS = "Physics";
  static const CHEMISTRY = "Chemistry";
  static const BIOLOGY = "Biology";
}
