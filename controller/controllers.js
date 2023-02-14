const mariadb = require("mariadb");
const { fileLoader } = require("ejs");
const ejs = require("ejs");
const { toNamespacePath } = require("path");
const docCookies = require("doc-cookies");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const { promisify } = require("util");

const db = mariadb.createPool({
    host: process.env.host,
    user: process.env.user,
    password: process.env.password,
    database: process.env.database
});

exports.getCategories = async(req,res) =>{
    let conn = await db.getConnection();
    try{
        var result = await conn.query("SELECT * FROM category");
    }
    catch(err){
        console.log(err);
    }
    var cat = [];
    for ( x = 0; x < result.length; x++){
        cat.push(result[x].category_name);
        cat.push(result[x].foto);
    }
    conn.release();
    return cat;
};

exports.showProducts = async(req,res) =>{
    let conn = await db.getConnection();
    try{
        var products = await conn.query("SELECT * FROM products WHERE categoryID="+req.params.catID);
    }
    catch(err){
        console.log(err);
    }
    conn.release();
    return products;
};

exports.getProductInfo = async(req,res) =>{
    let conn = await db.getConnection();
    try{
        var product = await conn.query("SELECT * FROM products WHERE name='"+req.params.product+"'");
    }
    catch(err){
        console.log(err);
    }
    conn.release();
    return product;
};

exports.logIn = async(req,res) =>{
    let conn = await db.getConnection()
    console.log(req.body)
    const {email, password} = req.body
    console.log("EMAIL:"+email)
    try{
        let cHashPassword = await conn.query('SELECT password FROM users WHERE email="'+email+'"')
        var hash = cHashPassword[0].password
        console.log("AA:"+cHashPassword[0].password);
        var t = [];
        var g;
        const match = await bcrypt.compare(password,hash);
        if (match){
            console.log("OK")
            token = jwt.sign({ email }, process.env.JWT_SECRET, {
                expiresIn: process.env.JWT_EXPIRES_IN.toString()
            });
            t.push(token);
            t.push(true);
            console.log("RESULT:"+t);
            conn.release();
            return t;
        }
        else{
            r=['',false];
            conn.release();
            return r;
        }
    }
    catch(err){
        console.log(err);
        conn.release()
        return false;
    }
};

exports.register = async(req,res) =>{
    let conn = await db.getConnection()
    console.log(req.body)
    const {name, email, password, passwordConfirm} = req.body
    
    try{
        let result = await conn.query('SELECT email FROM users WHERE email ="'+email+'"')
        
        if ((result.length>0) || (password != passwordConfirm)){
            conn.release()
            return false;
        }
        else{
            const salt = await bcrypt.genSalt()
            const HashPass = await bcrypt.hash(password,salt)
            
            await conn.query('INSERT INTO users(name,email,password,salt) VALUES ("'+name+'","'+email+'","'+HashPass+'","'+salt+'")', async (err,result) => {
                if(err){
                    console.log(err);
                }
            })
            conn.release();
            return true;
        }
    }
    catch(err){
        console.log(err)
    }
};

exports.isLoggedIn = async (req, res) => {
    if (req.cookies.UserSave) {
        try {
            let conn;
            conn = await db.getConnection();
            // 1. Verify the token
            const decoded = await promisify(jwt.verify)(req.cookies.UserSave,
                process.env.JWT_SECRET
            );
            console.log("ID:"+decoded.email);

            // 2. Check if the user still exist
            var results = await conn.query('SELECT * FROM users WHERE email = "'+decoded.email+'"');
            console.log("RR:"+results);
            if (!results){
                conn.release();
                return false;
            }
            else{
                conn.release();
                return true;
            }
            
        } catch (err) {
            console.log(err)
            conn.release();
            return false;
        }
    } else {
       return false;
    }
    
}

exports.logout = (req, res) => {
    try{
        if (req.cookies.UserSave != '') return true;
        else return false;
    }
    catch(err){
        console.log(err);
    }
}

exports.addToCart = async(req,res) =>{
    let conn = await db.getConnection();
    const decoded = await promisify(jwt.verify)(req.cookies.UserSave,
        process.env.JWT_SECRET
    );
    var email = decoded.email;
    console.log(email);

    try{
        //verifico se esiste un carrello per l'utente, se non esiste lo creo --OK
        //se l'oggetto è già presente nel carrello incremento quantità, altrimenti creo nuovo elemento
        let cart = await conn.query('select * from cart where userID = (select userID from users where email="'+email+'")')
        console.log("1")
        if (cart.length == 0){
            console.log("carrello non trovato");
            await conn.query('insert into cart(userID) select userID from users where email="'+email+'"');
            console.log("2")
        }
        cartID = await conn.query('select cartID from cart where userID = (select userID from users where email="'+email+'")')
        console.log("3")
        console.log(cartID[0].cartID)
        cart_element = await conn.query('select * from cart_element where cartID='+cartID[0].cartID+' and productID = (select productID from products where name="'+req.params.name+'")')
        if (cart_element[0] !=null){
            console.log("oggetto presente");
            await conn.query('update cart_element set quantity= quantity+'+req.body.text+' where cartID='+cartID[0].cartID+' and productID ='+cart_element[0].productID)
            console.log("4")
            conn.release()
        }
        else{
            console.log("oggetto non presente")
            userID = await conn.query('select userID from users where email="'+email+'"')
            productID = await conn.query('select productID from products where name="'+req.params.name+'"')
            await conn.query('insert into cart_element(userID,productID,cartID,quantity) values("'+userID[0].userID+'","'+productID[0].productID+'","'+cartID[0].cartID+'","'+req.body.text+'")')
            console.log("5")
            conn.release()
        }

    }
    catch(err){
        console.log(err);
    }
}

exports.showCart = async(req,res) =>{
    let conn = await db.getConnection();
    const decoded = await promisify(jwt.verify)(req.cookies.UserSave,
        process.env.JWT_SECRET
    );
    var email = decoded.email;
    var result = [];
    
    try{
        var cartItems = await conn.query('select productID from cart_element where userID = (select userID from users where email="'+email+'")');
        if (cartItems.length != 0){
            for(x = 0; x < cartItems.length; x++){
                product = await conn.query('select * from products where productID='+cartItems[x].productID)
                quantity = await conn.query('select quantity from cart_element')
                result.push(product)
                result.push(quantity)
            }
            conn.release();
            return result;
        }
    }
    catch(err){
        console.log(err);
        conn.release();
    }
}

exports.removeItem = async(req,res) =>{
    let conn = await db.getConnection();
    const decoded = await promisify(jwt.verify)(req.cookies.UserSave,
        process.env.JWT_SECRET
    );
    var email = decoded.email;
    try{
        await conn.query("DELETE FROM cart_element WHERE userID = (SELECT userID FROM users WHERE email ='"+email+"') AND productID = (SELECT productID FROM products WHERE name='"+req.params.productName+"')")
        conn.release()
    }
    catch(err){
        console.log(err);
        conn.release();
    }
}

exports.confirmOrder = async(req,res) =>{
    let conn = await db.getConnection();
    const decoded = await promisify(jwt.verify)(req.cookies.UserSave,
        process.env.JWT_SECRET
        );
    var email = decoded.email;
    var m = new Date();
    var date = 
    m.getUTCFullYear() + "/" +
    ("0" + (m.getUTCMonth()+1)).slice(-2) + "/" +
    ("0" + m.getUTCDate()).slice(-2) + " " +
    ("0" + m.getUTCHours()).slice(-2) + ":" +
    ("0" + m.getUTCMinutes()).slice(-2) + ":" +
    ("0" + m.getUTCSeconds()).slice(-2);
    try{
        var userID = await conn.query('SELECT userID FROM users WHERE email="'+email+'"')
        
        var cartID = await conn.query('SELECT cartID from cart where userID ="'+userID[0].userID+'"')
        if (cartID.length != 0){
        console.log("CARTID:"+cartID[0].cartID)
        await conn.query('INSERT INTO orders(userID,Date,cartID) VALUES ('+userID[0].userID+',"'+date+'",'+cartID[0].cartID+')')
        let orderID = await conn.query('select ID from orders order by ID desc') 
        console.log("orderID: "+orderID.ID)
        let items = await conn.query('SELECT * FROM cart_element WHERE cartID='+cartID[0].cartID)
        for (x = 0; x < items.length; x++){
            console.log("AAA: "+items[x].productID)
            price = await conn.query('select price from products where productID ='+items[x].productID+'')
            console.log("Price: "+price[0].price)
            await conn.query('insert into order_element(orderId,itemId,quantity,price) values('+orderID[0].ID+','+items[x].productID+','+items[x].quantity+','+price[0].price+')')
            await conn.query('update products set quantity=quantity-'+items[x].quantity+' where productID='+items[x].productID+'')
        }
        await conn.query('delete from cart where userID='+userID[0].userID+'')
        await conn.query('delete from cart_element where userID='+userID[0].userID+'')
        conn.release()
        return 0;
    }
    else return 1;
    }
    catch(err){
        console.log(err)
        conn.release();
    }
}

exports.getOrders = async(req,res)=>{
    let conn = await db.getConnection();
    const decoded = await promisify(jwt.verify)(req.cookies.UserSave,
        process.env.JWT_SECRET
        );
    var email = decoded.email;
    var ordersID = [];
    var ordersList = [];
    var result = [];
    try{
        var userID = await conn.query('SELECT userID FROM users WHERE email="'+email+'"')
        ordersID = await conn.query('select ID from orders where userId='+userID[0].userID+'')
        
        for(x = 0; x < ordersID.length; x++){
            console.log("ORDERid:"+ordersID[x].ID)
            ordersList = await conn.query('select * from order_element where orderId='+ordersID[x].ID+'')
            var foto = await conn.query('select photo from products where productID='+ordersList[0].itemId) 
            var data = await conn.query('select Date from orders where ID='+ordersList[0].orderId)
            var a = [ordersList,foto,data]
            result.push(a)
        }
        conn.release();
        return result
    }
    catch(err){
        console.log(err)
        conn.release();
    }
}

exports.getOrderDetails = async(req,res) =>{
    let conn = await db.getConnection()
    var orderID = req.params.id
    let a = []
    try{
        productID = await conn.query('select * from order_element where orderId='+orderID)
        for(k=0; k < parseInt(productID.length); k++){
            item = await conn.query('select * from products where productID='+productID[k].itemId)
            a.push(item)
        }
        var result=[a,productID]

    }
    catch(err){
        console.log(err)
    }
    conn.release()
    return result
}

exports.Search = async(req,res)=>{
    let conn = await db.getConnection()
    const{item} = req.body
    console.log("name: "+item)
    var items = []
    try{
        var result = await conn.query('select * from products where name like"%'+item+'%" or longDesc like"%'+item+'%"or description like"%'+item+'%"')
    }
    catch(err){
        console.log(err)
    }
    conn.release()
    return result
}
