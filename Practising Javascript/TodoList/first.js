
let TodoArray =[{
    name: 'name1',
    dueDate:'20-23-24'
}];
function renderTodoList(){
let createdHtml='';
TodoArray.forEach(function(TodoList,index){
    
    let dueDate = TodoArray.dueDate;
    let name = TodoArray.name;
    let html = `<div class=row><div class="column">${TodoList.name}</div> <div class="column dateElement">${TodoList.dueDate}</div><div class="column"><button class=htmlButton onclick="TodoArray.splice(${index} ,1); renderTodoList();">Delete</button></div></div>`;
    createdHtml +=html;
});

    document.querySelector('.listDisplay').innerHTML = createdHtml;
};




function addTodo(){
    let userInputElement = document.querySelector('.userInput');
    let dateInputElement = document.querySelector('.date-input');
    let dueDate =dateInputElement.value;
    

    let userInput = userInputElement.value;
    TodoArray.push({name:userInput,dueDate:dueDate});
    console.log(TodoArray);
    dateInputElement.value ='';

    userInputElement.value = '';
    renderTodoList();
}