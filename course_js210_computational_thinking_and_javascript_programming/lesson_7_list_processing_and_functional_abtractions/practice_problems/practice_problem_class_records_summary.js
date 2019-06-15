// At the end of each term, faculty members need to prepare a class record summary for students based on the weighted scores of exams and exercises. In this practice problem, we will prepare one such summary from some provided student records.

// Grading areas include exams and exercises, with the following weights:

// Grading Area    | Weight
// ------------------------
// Exam	           | 65%
// Exercises       | 35%


// Each term has four exams, and several exercises. Every exam has a fixed maximum score of 100, while exercises have varied maximum score values and counts. The total maximum point value for all exercises in any term is always 100, regardless of how many exercises the students had to complete. For example, a term may have five exercises with possible score maximums of [30, 20, 10, 20, 20] while another term may have three exercises with possible score maximums of [20, 30, 50].

// To determine a student's grade, we first determine the student's average score from the four exams, then sum all the exercise scores. We then apply the weights to compute the student's final percent grade. Finally, we determine the letter equivalent grade from the student's percent grade we just computed.

var classScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

// Grade on each student
// Average on each student

const EXAM_WEIGHT = 0.65;
const EXERCISE_WEIGHT = 0.35;

function getClassRecordSummary(classScores) {
  let summery = {
    studentGrades: generateGrades(classScores),
    exams: generateExamStatistics(classScores),
  };

  return summery;
}

getClassRecordSummary(classScores);



function generateGrades(classScores) {
  let grades = [];
  
  forEachScore(classScores, function (score) {
    let grade = generateGrade(score);
    grades.push(grade);
  })

  console.log(grades)
  
  return grades;
}

function generateGrade (scores) {
  let percentGrade = generatePercentGrade(scores);
  let letterGrade;
  
  if (percentGrade >= 93) {
    letterGrade = 'A';
  } else if (percentGrade >= 85) {
    letterGrade = 'B';
  } else if (percentGrade >= 77) {
    letterGrade = 'C';
  } else if (percentGrade >= 69) {
    letterGrade = 'D';
  } else if (percentGrade >= 60) {
    letterGrade = 'E';
  } else {
    letterGrade = 'F';
  }
  
  return `${percentGrade} (${letterGrade})`;
}

function generatePercentGrade(scores) {
  let examAverage = sum(scores.exams) / 4;
  let exerciseTotal = sum(scores.exercises);
  
  let percentGrade = ((examAverage * EXAM_WEIGHT) + (exerciseTotal * EXERCISE_WEIGHT));
  percentGrade = Math.round(percentGrade);
  
  return percentGrade;
}

function sum(numbers) {
  return numbers.reduce((total, number) => total + number);
}

function generateExamStatistics(classScores) {
  let examStatistics = {};
  let classExamScores = getClassExamScores(classScores);

  classExamScores.map(function (examScore) {})
  
  // We need an array per exam containing scores per student
  

  // Then we can find the smallest, average and we know the maximum is 100
}

function getClassExamScores(classScores) {
  let classExamScores = []
  let examNumber;
  let examScores;
  
  for(examNumber = 0; examNumber < 4; examNumber += 1) {
    examScores = [];
    forEachScore(classScores, function (studenScore) {
      examScores.push(studenScore.exams[examNumber]);
    })
    classExamScores.push(examScores)
  }

  return classExamScores;
}

function forEachScore(classScores, callback) {
  let studentNames = Object.keys(classScores);
  let studentScores;
  
  studentNames.forEach(function (name) {
    studentScores = classScores[name]['scores'];
    callback(studentScores);
  });

  return undefined;
}

// returns:
// {
  //   studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
  //   exams: [
    //     { average: 75.6, minimum: 50, maximum: 100 },
    //     { average: 86.4, minimum: 70, maximum: 100 },
    //     { average: 87.6, minimum: 60, maximum: 100 },
    //     { average: 91.8, minimum: 80, maximum: 100 },
    //   ],
    // }