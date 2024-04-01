const App = {
    data() {
     return {
        status: 0, // условeн номер на текущо визуализираната секция (или група секции)
        catalog: [],
        cart: [],
        order_total: 0,
        order_details:{
            first_name: '',
            last_name: '',
            company: '',
            address: '',
            email: '',
            phone: '',
            note: '',
            order_details: '',
            }
        }
     },

    methods: {
        setSection(SectionName){
            if (SectionName=='начало')
                {this.status=0}
            if (SectionName=='количка')
                {this.status=1}
            if (SectionName=='поръчка')
                {this.status=2}
            if (SectionName=='край')
                {this.status=3}
        },
        loadCategories(){
            vm = this
            axios.get('/api/items/')
            .then(function(response){
                vm.catalog = response.data;
                })
        },
        addToCart(idx){
            // проверка дали вече има такъв запис
            let found = -1
            for(i=0; i<this.cart.length; i++)
                {
                if (this.cart[i].id==this.catalog[idx].id){found = i}
                }
            if(found == -1){ // не е намерен в количката - дабавям го
                this.cart[this.cart.length] =
                    {
                    idx:idx,
                    id:this.catalog[idx].id,
                    qt:1,
                    }
            }
            else
                { // има го в количката - увеличавам бройката с 1
                this.cart[found].qt += 1
                }
            this.makeTotal()
            this.setSection('количка')
        },
        changeQt(i,idx){
            this.cart[idx].qt += i
            if(this.cart[idx].qt<0){this.cart[idx].qt=0}
            this.makeTotal()
        },
        removeCartItem(idx){
            this.cart.splice(idx, idx)
            this.makeTotal()
        },
        makeTotal(){
            this.order_total=0
            for(i=0; i<this.cart.length; i++)
                {
                this.order_total += this.cart[i].qt*this.catalog[this.cart[i].idx].price
                }
        },
        addOrder(){
            const vm=this
            /* първо формирам текста на самата поръчка */
            this.order_details.order_details = ''
            for(i=0; i<this.cart.length; i++)
                {
                let item = this.cart[i]
                this.order_details.order_details += this.catalog[item.idx].name+' x '+(this.catalog[item.idx].price*item.qt).toFixed(2)+' лв.\n'
                }
            this.order_details.order_details += ' ----------------------------------------------\n'
            this.order_details.order_details += ' Сума общо: '+this.order_total.toFixed(2)+' лв.\n'
            console.log(this.order_details.order_details)
            /* изпращам данните към сървъра */
            axios({
                method:'POST',
                url:'/api/order/',
                headers:{
                    'X-CSRFToken': CSRF_TOKEN,
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                data:{
                    first_name: this.order_details.first_name,
                    last_name: this.order_details.last_name,
                    company: this.order_details.company,
                    address: this.order_details.address,
                    email: this.order_details.email,
                    phone: this.order_details.phone,
                    note: this.order_details.note,
                    order_details: this.order_details.order_details,
                }
            })
            .then(function(response){
                if (response.status==201){
                    console.log('Поръчката е записана')
                    vm.setSection('край')
                    }
                else{
                    console.log('Грешка при запис на поръчка')
                    }
            })
       },
       },
    created: function(){
    this.status = 0
    this.loadCategories()
    }
}

Vue.createApp(App).mount('#app')
