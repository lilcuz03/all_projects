function subscribeButton(){
    let subscribe = document.getElementById('subscribe');

    if(subscribe.innerText==='Subscribe'){
        subscribe.innerText='Subscribed';
        subscribe.classList.add('is-subscribed');
    } else{
        subscribe.innerText='Subscribe';
        subscribe.classList.remove('is-subscribed');
    }
};

//Calculator
function calculator(){
    let calculate = document.getElementById('input');
    cost = Number(calculate.value);

    if(cost<40){
        cost +=10;
    }else if (cost===null){
        cost= 0;
    } else{
        cost = cost;
    }
    let costInformation = document.getElementById('costResults');
    costInformation.textContent=`Total Cost :$${cost}`;
}