// Create an object factory for a student object. The student object should have the following methods and it should produce the expected results demonstrated in the sample code:

// - info: Logs the name and year of the student.
// - addCourse: Enrolls student in a course. A course is an object literal that has properties for its name and code.
// - listCourses: Returns a list of the courses student has enrolled in.
// - addNote: Adds a note property to a course. Takes a code and a note as an argument. If a note already exists, the note is appended to the existing one.
// - updateNote: Updates a note for a course. Updating a note replaces the existing note with the new note.
// - viewNotes: Logs the notes for all the courses. Courses without notes are not displayed.

function createStudent(name, year) {
  return {
    name: name,
    year: year,
    courses: [],

    info: function() {
      let info = `${this.name} is a ${this.year} student`;
      console.log(info);
    },

    listCourses: function() {
      console.log(this.courses);
    },

    addCourse: function(courseInfo) {
      this.courses.push(courseInfo);
    },

    addNote: function(code, note) {
      courseIndex = this.getCourseIndex(code);
      if (courseIndex === -1) return;
      if (this.notesExists()) {
        this.courses[courseIndex].notes += `; ${note}`;
      } else {
        this.courses[courseIndex].notes = note;
      };
    },
    
    notesExists: function() {
      return this.courses[courseIndex].notes !== undefined;
    },
    
    viewNotes: function() {
      this.courses.forEach(function (course){
        if (course.notes) {
          console.log(`${course.name}: ${course.notes}`);
        };
      });
    },
    
    updateNote(code, note) {
      courseIndex = this.getCourseIndex(code);
      if (courseIndex === -1) return;
      this.courses[courseIndex].notes = note;
    },

    getCourseIndex: function(code) {
      return this.courses.findIndex((course) => course.code === code);
    }
  }
}

let philip = createStudent('Philip', '1st');
philip.info()
philip.listCourses()

philip.addCourse({name: 'Data Science', code: 101});
philip.addCourse({name: 'Scout Leader Course', code: 207});
philip.listCourses();
philip.addNote(101, 'Science is fun!');
philip.addNote(101, "It's also very hard...");
philip.addNote(207, "Scouting get's us out in nature");
philip.viewNotes()
philip.updateNote(207, "Nevermind, i hate scouting! Bears!");
philip.viewNotes()