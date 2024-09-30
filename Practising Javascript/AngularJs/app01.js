angular.module('myApp', [])
.controller('addController', addController)
.controller('showController', showController)
.service('myService', myService);

// Add Controller
addController.$inject = ['myService'];

function addController(myService) {
    let itemAdder = this;
    itemAdder.itemName = '';
    itemAdder.itemQuantity = '';

    itemAdder.addItem = () => {
        myService.addItem(itemAdder.itemName, itemAdder.itemQuantity);
    }
}

// Show Controller
showController.$inject = ['myService'];

function showController(myService) {
    let show = this;
    show.items = myService.getItems();
}

// Services
function myService() {
    let service = this;
    let items = [];

    service.addItem = (itemName, itemQuantity) => {
        let item = {
            name: itemName,
            quantity: itemQuantity
        };

        items.push(item);
    };

    service.getItems = () =>{
        return items;
    }
}
