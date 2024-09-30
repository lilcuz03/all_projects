let readline = require('readline');  //imports the readline module

let readLine = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const taskArray = [];   //Array to store tasks
let taskIdNumber = 1;   //initial number for the task id number 

function createTaskId() {
  return taskIdNumber++;   //increments the task id number from the previous id number 
}

function displayOptions() {             //function to display options 
  console.log('\n Task Manager Application\n');
  console.log('1. Add a Task');
  console.log('2. Mark a Task as Completed');
  console.log('3. List All Tasks');
  console.log('4. Delete a Task');
  console.log('5. Exit');
}

function addTask() {          //function for adding Tasks into the array 
  readLine.question('Enter task title: ', title => {
    readLine.question('Enter task description: ', description => {
      let taskId = createTaskId();
      taskArray.push({ id: taskId, title, description, completed: false });
      console.log(`Task "${title}" added with ID: ${taskId}`);
      displayOptions();
      userInput();
    });
  });
}

function markTaskAsCompleted() {      //this function marks task as completed or not
  readLine.question('Enter the task ID to mark as completed: ', taskId => {
    taskId = Number(taskId);
    const task = taskArray.find(task => task.id === taskId);
    if (task) {
      task.completed = true;
      console.log(`Task "${task.title}" marked as completed.`);
    } else {
      console.log('Task not found.');
    }
    displayOptions();
    userInput();
  });
}

function listTasks() {        //function for displaying list of Tasks
  if (taskArray.length === 0) {
    console.log('No tasks available.');
  } else {
    console.log('Tasks:');
    taskArray.forEach(task => {
      let status = task.completed ? '[X] Completed' : '[ ] Incomplete';
      console.log(`ID: ${task.id}, ${status} ${task.title}`);
    });
  }
  displayOptions();
  userInput();
}

function deleteTask() {   //function for deleting task from the array
  readLine.question('Enter the task ID to delete: ', taskId => {
    taskId = Number(taskId);
    let taskIndex = taskArray.findIndex(task => task.id === taskId);
    if (taskIndex !== -1) {
      const deletedTask = taskArray.splice(taskIndex, 1);
      console.log(`Task "${deletedTask[0].title}" with ID ${taskId} deleted.`);
    } else {
      console.log('Task not found.');
    }
    displayOptions();
    userInput();
  });
}

function userInput() {     //function that checks user's inputs 
  readLine.question('Enter your choice: ', option => {
    switch (option) {
      case '1':
        addTask();
        return;
      case '2':
        markTaskAsCompleted();
        return;
      case '3':
        listTasks();
        return;
      case '4':
        deleteTask();
        return;
      case '5':
        console.log('Exiting Task Management Application.');
        readLine.close();
        return;
      default:
        console.log('Invalid choice. Please enter a valid option.');
        displayMenu();
        handleUserInput();
        return;
    }
  });
}

displayOptions();
userInput();
