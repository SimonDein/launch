/*
In an earlier exercise, we created a school object. It works, however, it can still be improved. The following are improvements for you to implement:

Make the list students private. Right now, anyone can gain access to it and manipulate it.
Make the constraint for allowed values for years private variable. As a private variable it avoids an unnecessary statement in the addStudent method and at the same time makes the code more declarative
Make the getCourse function accessible in the addGrade method also. As it is, only the courseReport method has access.
*/

let createStudent = (function() {
  let id = 0;

  function getNextId() {
    return id += 1;
  }

  return function(name, year) {
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
})()

let school = (function () {
  let students = [];
  function isValidYear(year) {
    const validYears = ['1st', '2nd', '3rd', '4th', '5th'];
    return validYears.includes(year);
  };

  function displayReportCard (enrolledCourses, studentGrades) {
    let grade;

    enrolledCourses.forEach(function (course) {
      gradeInfo = studentGrades[course.name];
      grade = gradeInfo !== undefined ? gradeInfo.grade : 'In progress';

      console.log(`${course.name}: ${grade}`);
    });
  };
  return {
    courses: [
      {name: 'Math', code: 101, enrolledStudents: []},
      {name: 'Advanced Math', code: 201, enrolledStudents: []},
      {name: 'Physics', code: 105, enrolledStudents: []},
      {name: 'Advanced Physics', code: 205, enrolledStudents: []},
      {name: 'Computer Science', code: 308, enrolledStudents: []},
    ],

    addStudent: function(student) {
      if (isValidYear(student.year)) {
        students.push(student);
      } else {
        console.log('Invalid Year');
      };
    },

    enrollStudent: function(student, courseName, courseCode) {
      let courseIndex = this.courses.findIndex((course) => course.name === courseName && course.code === courseCode);
      let course = this.courses[courseIndex];
      course.enrolledStudents.push(student);
    },

    addGrade: function(student, courseName, courseCode, grade) {
      let gradeInfo = {code: courseCode, grade: grade};
      student.grades[courseName] = gradeInfo;
    },

    getReportCard: function(student) {
      let enrolledCourses = this.courses.filter((course) => course.enrolledStudents.includes(student));
      let grades = student.grades;
      displayReportCard(enrolledCourses, grades);
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
  }
})();

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
