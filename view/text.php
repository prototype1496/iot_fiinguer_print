

<link href="../css/changepass/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<style>
    
    
    .register{
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
    margin-top: 3%;
    padding: 3%;
      font-family: Helvetica, Sans-Serif;
}
.register-left{
    text-align: center;
    color: #fff;
    margin-top: 4%;
}
.register-left input{
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    width: 60%;
    background: #f8f9fa;
    font-weight: bold;
    color: #383d41;
    margin-top: 30%;
    margin-bottom: 3%;
    cursor: pointer;
}
.register-right{
    background: #f8f9fa;
    border-top-left-radius: 10% 50%;
    border-bottom-left-radius: 10% 50%;
}
.register-left img{
    margin-top: 20%;
    margin-bottom: 5%;
    width: 50%;
/*    -webkit-animation: mover 2s infinite  alternate;
    animation: mover 1s infinite  alternate;*/
}
@-webkit-keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
@keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
.register-left p{
    font-weight: lighter;
    padding: 12%;
    margin-top: -9%;
}
.register .register-form{
    padding: 10%;
    margin-top: 10%;
}
.btnRegister{
    float: right;
    margin-top: 10%;
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    background: #0062cc;
    color: #fff;
    font-weight: 600;
    width: 40%;
    cursor: pointer;
    margin-right: 2%;
}

.btnReject{
    float: right;
    margin-top: 10%;
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    background: #8b0000;
    color: #fff;
    font-weight: 600;
    width: 40%;
    cursor: pointer;
}
.register .nav-tabs{
    margin-top: 3%;
    border: none;
    background: #0062cc;
    border-radius: 1.5rem;
    width: 28%;
    float: right;
}
.register .nav-tabs .nav-link{
    padding: 2%;
    height: 34px;
    font-weight: 600;
    color: #fff;
    border-top-right-radius: 1.5rem;
    border-bottom-right-radius: 1.5rem;
}
.register .nav-tabs .nav-link:hover{
    border: none;
}
.register .nav-tabs .nav-link.active{
    width: 100px;
    color: #0062cc;
    border: 2px solid #0062cc;
    border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
}
.register-heading{
    text-align: center;
    margin-top: 8%;
    margin-bottom: -15%;
    color: #495057;
}

.circular {
  border-radius: 50%;
}

</style>
<div class="container register">
                <div class="row">
                    <div class="col-md-3 register-left">
                        <img class="circular" src="../images/a.jpg" alt=""/>
                         <h3>Alinuswe Mwnadobo</h3>
                    </div>
                    <div class="col-md-9 register-right">
                      
                        <div class="tab-content" id="myTabContent">
                        
                            
                            <div class="tab-pane  show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Report Mangemnt System</h3>
                                <div class="row register-form">
                                   
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="email" class="form-control" placeholder="Your Email *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" minlength="10" maxlength="10" name="txtEmpPhone" class="form-control" placeholder="Your Phone *" value="" />
                                        </div>
                                       
                                        
                                        <input type="submit" class="btnRegister"  value="Login"/>
                                        
                                       
                                        
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>