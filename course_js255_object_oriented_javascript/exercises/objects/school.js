// Create a school object. The school object uses the student object from the previous exercise. It has methods that use and update information about the student. Be sure to check out the previous exercise for the other arguments that might be needed by the school object. Implement the following methods for the school object:

// addStudent: Adds a student by creating a new student and adding the student to a collection of students. The method adds a constraint that the year can only be any of the following values: '1st', '2nd', '3rd', '4th', or '5th'. Returns a student object if year is valid otherwise it logs "Invalid Year".
// enrollStudent: Enrolls a student in a course.
// addGrade: Adds the grade of a student for a course.
// getReportCard: Logs the grades of a student for all courses. If the course has no grade, it uses "In progress" as the grade.
// courseReport: Logs the grades of all students for a given course name. Only student with grades are part of the course report.
// To test your code, use the three student objects listed below. Using the three student objects, produces the following values from the getReportCard and courseReport methods respectively.

let nextId = 1;

function getNextId() {
  let currentId = nextId;
  nextId += 1;
  return currentId;
}

function createStudent(name, year) {
  return {
    name: name,
    year: year,
    grades: {},
    id: getNextId(),

    info: function() {
      let info = `${this.name} is a ${this.year} student`;
      console.log(info);
    },
  }
}

let school = {
  students: [],
  courses: [
    {name: 'Math', code: 101, enrolledStudents: []},
    {name: 'Advanced Math', code: 201, enrolledStudents: []},
    {name: 'Physics', code: 105, enrolledStudents: []},
    {name: 'Advanced Physics', code: 205, enrolledStudents: []},
    {name: 'Computer Science', code: 308, enrolledStudents: []},
  ],

  addStudent: function(student) {
    if (this.isValidYear(student.year)) {
      this.students.push(student);
    } else {
      console.log('Invalid Year');
    };
  },

  enrollStudent: function(student, courseName, courseCode) {
    let courseIndex = this.getCourseIndex(courseName, courseCode);
    let course = this.courses[courseIndex];
    course.enrolledStudents.push(student);
  },

  addGrade: function(student, courseName, courseCode, grade) {
    let gradeInfo = {code: courseCode, grade: grade};
    student.grades[courseName] = gradeInfo;
  },

  getReportCard: function(student) {
    let enrolledCourses = this.getEnrolledCourses(student);
    let grades = student.grades;
    this.displayReportCard(enrolledCourses, grades);
  },

  courseReport: function(courseName) {
    let course = this.courses.find((course) => course.name === courseName);

    if (course === undefined) {
      console.log("Course doesn't exist");
      return;
    }

    let gradeCount = 0;
    let gradeTotal = 0;
    let average;;

    console.log(`=${courseName} Grades=`)
    course.enrolledStudents.forEach(function (student) {
      let gradeInfo = student.grades[courseName]
      if (gradeInfo !== undefined) {
        gradeCount += 1;
        gradeTotal += gradeInfo.grade;

        console.log(`${student.name}: ${gradeInfo.grade}`)
      }
    });

    average = Math.floor(gradeTotal / gradeCount);
    console.log(`---\naverage:${average}`)
  },

  // ------------- Helper Functions -------------
  getCourseIndex: function(name, code) {
    return this.courses.findIndex((course) => course.name === name &&
                                              course.code === code);
  },

  displayReportCard: function(enrolledCourses, studentGrades) {
    let grade;

    enrolledCourses.forEach(function (course) {
      gradeInfo = studentGrades[course.name];
      grade = gradeInfo !== undefined ? gradeInfo.grade : 'In progress';
      
      console.log(`${course.name}: ${grade}`);
    });
  },

  getEnrolledCourses: function(student) {
    return this.courses.filter((course) => course.enrolledStudents.includes(student));
  },

  isValidYear: function(year) {
    const validYears = ['1st', '2nd', '3rd', '4th', '5th'];
    return validYears.includes(year);
  }
}

let thomas = createStudent('Thomas', '1st');
let philip = createStudent('Philip', '2nd');
let bill = createStudent('Bill', '1st');

school.addStudent(thomas);
school.addStudent(philip);
school.addStudent(bill);

school.enrollStudent(thomas, 'Math', 101);
school.enrollStudent(thomas, 'Physics', 105);
school.enrollStudent(bill, 'Advanced Math', 201);
school.enrollStudent(bill, 'Physics', 105);
school.enrollStudent(bill, 'Computer Science', 308);
school.enrollStudent(philip, 'Physics', 105);
school.enrollStudent(philip, 'Computer Science', 308);
school.enrollStudent(philip, 'Math', 101);

school.addGrade(thomas, 'Math', 101, 95);
school.addGrade(thomas, 'Physics', 105, 70);
school.addGrade(bill, 'Advanced Math', 201, 80);
school.addGrade(bill, 'Computer Science', 308, 85);
school.addGrade(philip, 'Physics', 105, 70);
school.addGrade(philip, 'Computer Science', 308, 95);
school.addGrade(philip, 'Math', 101, 75);

school.getReportCard(thomas);
school.getReportCard(philip);
school.getReportCard(bill);

school.courseReport('Math');
school.courseReport('Advanced Math');
school.courseReport('Computer Science');
school.courseReport('Physics');
/*
// only returning the properties that aren't methods for the three objects
foo;
// {
//   name: 'foo',
//   year: '3rd',
//   courses: [
//     { name: 'Math', code: 101, grade: 95, },
//     { name: 'Advanced Math', code: 102, grade: 90, },
//     { name: 'Physics', code: 202, }
//   ],
// }

bar;
// {
//   name: 'bar',
//   year: '1st',
//   courses: [
//     { name: 'Math', code: 101, grade: 91, },
//   ],
// }

qux;
// {
//   name: 'qux',
//   year: '2nd',
//   courses: [
//     { name: 'Math', code: 101, grade: 93, },
//     { name: 'Advanced Math', code: 102, grade: 90, },
//    ],
// }


// getReportCard output
school.getReportCard(foo);
// Math: 95
// Advanced Math: 90
// Physics: In progress

school.courseReport('Math');
// =Math Grades=
// foo: 95
// bar: 91
// qux: 93
// ---
// Course Average: 93

school.courseReport('Advanced Math');
// =Advanced Math Grades=
// foo: 90
// qux: 90
// ---
// Course Average: 90

// school.courseReport('Physics');
// undefined
*/