const App = {
    data() {
     return {
        PageSize: 12,
        status: 0, // условeн номер на текущо визуализираната секция (или група секции)
        categories: [],
        page:{
            data:[],
            max:0,
            current:0,
            page_nums:[]
            },
        items: [],
        filter: {
            group_id:0,
            cat_id:0,
            order_by:0,
            },

        grid_mode:3,
        selected_item_quantity:0,
        selected_item_id:0,
        conf: [],
        conf_total: 0,
        conf_MB:0,
        conf_CPU:0,
        conf_FAN:0,
        conf_BOX:0,
        conf_PSU:0,
        conf_RAM:0,
        conf_HDD:0,
        conf_Video:0,
        conf_sum:0,

        cart: [],
        order_details:{
            first_name: '',
            last_name: '',
            company: '',
            address: '',
            email: '',
            phone: '',
            note: '',
            order_details: '',
            },
        order_total: 0,
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
            if (SectionName=='за нас')
                {this.status=3}
            if (SectionName=='конфигуратор')
                {this.status=4
                this.setFilterByGroup(2)}
            let st=this.status
        /*
            setTimeout(function(){setSectionTA(st)}, 100)
        */
           },
        loadCategories(){
            vm = this
            axios.get('/api/categories/')
            .then(function(response){
                vm.categories = response.data;
                /* setTimeout(function(){Init()}, 100) */
                })
        },
        loadItems(){
            console.log('loadItems()')
            vm = this
            let url = 'api/items/'+this.filter.group_id+'/'+this.filter.cat_id+'/'+this.filter.order_by+'/'
            axios.get(url)
            .then(function(response){
                vm.items = response.data;
                vm.page.max = Math.ceil(vm.items.length / vm.PageSize)
                vm.page.current=0
                vm.showPage();
                })
        },
        showPage(){
            let p = this.PageSize*this.page.current
            this.page.data=this.items.slice(p,p+this.PageSize);
            this.page.page_nums=[]
            for(i=1;i<=this.page.max;i++){
                this.page.page_nums[i-1]=i
            }
        },
        showNextPage(){
            if(this.page.current<(this.page.max-1)){this.page.current+=1}
            this.showPage()
        },
        showPrevPage(){
            if(this.page.current>0){this.page.current-=1}
            this.showPage()
        },
        showNumPage(n){
            this.page.current=n
            this.showPage()
        },
        setFilterByBrandModel(group,category){
            this.filter.group_id=group
            this.filter.cat_id=category
            this.loadItems()
        },
        setFilterByGroup(group){
            this.filter.group_id=1
            this.filter.cat_id=group
            this.loadItems()
        },
        selectModalItem(index){
            this.selected_item_id=index
            this.selected_item_quantity=1
        },
        changeSelectedItemQuantity(value){
            this.selected_item_quantity+=value
            console.log(value,'-->',this.selected_item_quantity)
        },
        addToCart(idx){
            // проверка дали вече има такъв запис
            let found = -1
            for(i=0; i<this.cart.length; i++)
                {
                if (this.cart[i].id==this.items[idx].id){found = i}
                }
            if(found == -1){ // не е намерен в количката - дабавям го
                this.cart[this.cart.length] =
                    {
                    idx:idx,
                    id:this.items[idx].id,
                    name:this.items[idx].name,
                    photo:this.items[idx].photo,
                    price:this.items[idx].price,
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
        addToConf(idx){
            if(this.items[idx].category.id==2){this.conf_MB += 1}
            if(this.items[idx].category.id==3){this.conf_CPU += 1}
            if(this.items[idx].category.id==6){this.conf_FAN += 1}
            if(this.items[idx].category.id==4){this.conf_RAM += 1}
            if(this.items[idx].category.id==21){this.conf_HDD += 1}
            if(this.items[idx].category.id==5){this.conf_Video += 1}
            if(this.items[idx].category.id==22){this.conf_PSU += 1}
            if(this.items[idx].category.id==7){this.conf_BOX += 1}

            if(this.conf_HDD<2){this.setFilterByGroup(21)}
            if(this.conf_RAM<4){this.setFilterByGroup(4)}
            if(this.conf_BOX==0){this.setFilterByGroup(7)}
            if(this.conf_PSU==0){this.setFilterByGroup(22)}
            if(this.conf_Video==0){this.setFilterByGroup(5)}
            if(this.conf_FAN==0){this.setFilterByGroup(6)}
            if(this.conf_CPU==0){this.setFilterByGroup(3)}
            if(this.conf_MB==0){this.setFilterByGroup(2)}

            this.conf_sum = this.conf_BOX+this.conf_PSU+this.conf_Video+this.conf_FAN+this.conf_CPU+this.conf_MB+
                            this.conf_HDD+this.conf_RAM
            console.log('*** ', this.conf_sum)

            this.conf[this.conf.length] = this.items[idx]
            this.conf_total=0
            for(i=0; i<this.conf.length; i++)
                {
                this.conf_total += parseFloat(this.conf[i].price)
                }
        },
        changeQt(i,idx){
            let q = parseInt(this.cart[idx].qt)
            q += i
            this.cart[idx].qt = q
            if(this.cart[idx].qt<0){this.cart[idx].qt=0}
            this.makeTotal()
        },
        removeCartItem(idx){
            console.log('idx:',idx)
            this.cart.splice(idx, 1)
            this.makeTotal()
        },
        makeTotal(){
            this.order_total=0
            for(i=0; i<this.cart.length; i++)
                {
                this.order_total += this.cart[i].qt*this.items[this.cart[i].idx].price
                }
        },
   },
    created: function(){
    this.loadCategories()

    this.loadItems()

/*
    setTimeout(function(){Init()}, 1000)
*/
    }
}

Vue.createApp(App).mount('#app')

