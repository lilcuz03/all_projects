const formArray =[{
    username:'Tafadzwa',
    userEmail:'123@wagwan.com',
    userPassword:'Siuuuu',
    userTelephone: '1234567'

},];
//  let createdHtml = ''; 
//  let value = formArray[index];
 function Display(){
//     formArray.forEach(value ,()=>{
   
//     let html = `<div>
//     <p>
//     Username: ${value.username}
//     </p>
//     <p>
//     Username: ${value.userEmail}
//     </p>
//     <p>
//     Username: ${value.userPassword}
//     </p>
//     <p>
//     Username: ${value.userTelephone}
//     </p>
//     </div>`;

//     createdHtml +=html;
//     document.querySelector('.results').innerHTML=createdHtml;
// })
// }


 let createdHtml='';
for(let i =0 ; i<formArray.length;i++){
    let List = formArray[i];
   
    


    let html = `<div>
        <p>Username: ${List.username}</p>
        <p> UserEmail: ${List.userEmail}</p>
        <p>UserPassword: ${List.userPassword}</p>
        <p>UserTelephone:  ${List.userTelephone}</p>
        <hr>
    </div>`;
    createdHtml += html;

}
document.querySelector('.results').innerHTML=createdHtml;




 };




function submitContent(){
    
    
    let usernameElement= document.querySelector(".input-name");
    let username = usernameElement.value;
    let usernameMessage ='';
    let usernameError = '';
    let passwordMessage ='';
    let passwordError ='';
    let emailMessage ='';
    let emailError ='';
    let password1Message='';
    let password1Error ='';
    let telMessage ='';
    let telError ='';

    if(username===''){
        usernameError='Please Fill In your username<img src="images/alert.png" class="alert">';
        document.querySelector(".username-message").style.color="red";
    } else{
        usernameMessage= `Hello ${username}.`;
        document.querySelector(".username-message").style.color="aqua";
    }
    document.querySelector(".username-message").innerHTML= usernameMessage||usernameError;
    usernameElement.value ='';


     
    let emailElement=document.querySelector("#input-email");
    let email = emailElement.value;

    if(email===''){
        emailError='Please Fill out your Email <img src="images/alert.png" class="alert">';
        document.querySelector('.email-message').style.color="red";
    } else{
        emailMessage =`${email}`;
        document.querySelector('.email-message').style.color ="aqua";
    }
    document.querySelector('.email-message').innerHTML = emailMessage ||emailError;
    emailElement.value='';

    

    let telElement = document.querySelector("#input-tel");
    let tel = telElement.value;
    
    if(tel===''||tel===null){
        telError =  'Please Fill out your telephone <img src="images/alert.png" class="alert">';
        document.querySelector('.tel-message').style.color="red";
    }else{
        telMessage =`${tel}`;
        document.querySelector('.tel-message').style.color="aqua";
    }
    document.querySelector('.tel-message').innerHTML=telMessage ||telError;
    telElement.value=' ';
    
    let passwordElement= document.querySelector("#input-password");

    let password =passwordElement.value;

    if(password==='' ||password===null){
        passwordError='Please fill out your password <img src="images/alert.png" class="alert">';
        document.querySelector('.password-message').style.color="red";
    }else{
        passwordMessage=`${password}`;
        document.querySelector('.password-message').style.color ="aqua";
    
    }
    document.querySelector('.password-message').innerHTML=passwordMessage ||passwordError;
    passwordElement.value='';

    
    let passwordElement1 = document.querySelector("#input-password1");
    let password1 =passwordElement1.value;

    if(password1==='' || password1===null){
        password1Error='please fill out your password<img src="images/alert.png" class="alert">';
        
        document.querySelector('.password1-message').style.color="red";
        
    }else if(password1 !=password){
            password1Error ='password do not match <img src="images/alert.png" class="alert">';

            document.querySelector('.password1-message').style.color="red";
    } else{
        password1Message =`${password1}`;
        document.querySelector('.password1-message').style.color="aqua";
    }

    

    document.querySelector('.password1-message').innerHTML = password1Message ||password1Error;
    passwordElement1.value='';





formArray.push({
    username:username,
    userEmail:email,
    userPassword:password,
    userTelephone: tel
})
console.log(formArray);
Display();
}
 
   

document.querySelector('#submit').addEventListener('click',()=>{
    submitContent();
})
let Button= document.querySelector('#submit');
Button.addEventListener('click',()=>{
    if( Button.innerText==='Submit'){

        Button.innerText ='Done';
        Button.style.color ="white"
        Button.style.backgroundColor="black";
    } else if(Button.innerText==='Done'){
        Button.innerText='Submit';
        Button.style.backgroundColor="coral"
    }
    // Button.innerText ='Submit';
})



        

