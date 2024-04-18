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
            },
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
                {this.status=4}
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

