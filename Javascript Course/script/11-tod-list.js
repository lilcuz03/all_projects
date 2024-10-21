let myTodoList =[{
    name: ' Read Bible',
    dueDate: '12-15-20'
},
{
    name: ' Wash Dishes',
    dueDate: '12-15-24'
}];

renderTodo();

function renderTodo(){
    let createdHtml ='';
    for(let i = 0 ; i<myTodoList.length ; i++){
        let myList = myTodoList[i];
        const{name,dueDate} = myList;
        let html = `<div>${name} </div> <div>${dueDate}</div> <button onclick="myTodoList.splice(${i}, 1); renderTodo();">Delete</button></div>`;
        createdHtml +=html;
    }
    document.querySelector('.js-todo-list').innerHTML = createdHtml;
}



function addTodo(){
    
    let userInputElement = document.querySelector('.js-name-input');
    let dueDateElement = document.querySelector('.dueDate');
    let dueDate = dueDateElement.value;
    let userInput = userInputElement.value ;
    myTodoList.push({name:userInput , dueDate: dueDate });

    userInputElement.value ='';
    dueDateElement.value ='';
    console.log(myTodoList);

    renderTodo();
}
