<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" type="text/css" href="styles/qaforff_nw.css">
    <link rel="stylesheet" type="text/css" href="/stylesvifontstyle2new.css">
    <script language="javascript" src="json2.js"></script>
    <link rel="stylesheet" type="text/css" href="styleregister.css" >
<script language="javascript" src="online_educationv1.13new.js"></script>
    
<script language="javascript" src="online_education_cap.js"></script>
    
<script language="javascript" src="register1new1.js"></script>
<script language="javascript" src="register_new_v3.0.js"></script>

<script language="javascript" src="register_new_cap.js"></script>

<script language="javascript" src="forum_discussion.js"></script>

</head>
  <div style="position: absolute;"><jsp:include page="movingtest.jsp"></jsp:include></div>
 <div style="position: absolute; top: 286px; left: 120px; width: 922px; height: 24px;"> 
</div>

<body>
<div style="position: absolute; top: 318px; height: 541px; left: 249px; width: 674px;">
	<div id="newmahisign" style="display:none;"></div>

<form action="register" method="post">
    <div class="VerdanablckAsh12" id="firstname7"> 
  					<div align="right"> 
					  	*Valid email 
					 </div> 
				</div> 
 
 
 
				<div id="firstname8"> 
  					<input type="text" name="email" class="photonewcommunity" value="${param.email}" style="width: 300px;"> 
<span style="color: red; font-size: 12px;">${messages.error}</span> 
<span style="color: green; font-size: 12px;">${messages.success}</span> 
				  				</div> 
 
 
				<div class="VerdanablckAsh12" id="firstname9"> 
  					<div align="right"> 
					  	*Enter password 
				    </div> 
				</div> 
 
				<div id="firstname10"> 
  					<input type="password" name="password" class="photonewcommunity" style="width: 300px;" onfocus="return emailValidate();"> 
				</div> 
 
				<div class="Verdana10Ash" id="atlest"> 
					Atleast 6 characters long 
				</div> 
 
				<div class="VerdanablckAsh12" id="firstname11"> 
  					<div align="right"> 
					  	*Re-enter password 
					</div> 
				</div> 
 
				<div id="firstname12"> 
				  <input type="password" name="repass" class="photonewcommunity" style="width: 300px;"> 
				</div> 
 
 				<div class="VerdanablckAsh12" id="firstname"> 
  					<div align="right"> 
					  	*First name 
				   </div> 
				</div> 
  
				<div id="firstname2"> 
					<input type="text" name="fname" class="photonewcommunity" value="${param.fname}" style="width: 300px;"> 
				</div> 
  
				<div class="Verdana10Ash" id="atlest"> 
					Atleast 3 characters long 
				</div> 

				<div class="VerdanablckAsh12" id="firstname3"> 
  					<div align="right"> 
					  	Middle name 
					 </div> 
				</div> 
  
				<div id="firstname4"> 
				  <input type="text" name="mname" class="photonewcommunity" value="${param.mname}" style="width: 300px;"> 
				</div> 
 
				<div class="VerdanablckAsh12" id="firstname5"> 
  					<div align="right"> 
					  	*Last name 
				    </div> 
				</div> 
 
				<div id="firstname6"> 
				  <input type="text" name="lname" class="photonewcommunity" value="${param.lname }" style="width: 300px;"> 
				</div> 
 
				<div class="VerdanablckAsh12" id="firstname13"> 
  					<div align="right"> 
					  	*Sex 
					</div> 
				</div> 
 
				<div id="firstname14"> 
  					<select name="sex" class="regbox"> 
				  		<option selected="selected" value="0">Select</option> 
  			  			<option value="Male">Male</option> 
  			  			<option value="Female">Female</option> 
		    		</select> 
 			    </div> 
 <br>
				<div class="VerdanablckAsh12" id="firstname15"> 
  					<div align="right"> 
					  	*Ph./Mob. 
				    </div> 
				</div> 
 
				<div id="firstname14"> 
					 <input type="text" name="phone" value="${param.mobile}" class="photonewcommunity" style="width: 300px;" maxlength="10"> 
				</div> 
 
				<div class="VerdanablckAsh12" id="firstname15"> 
  					<div align="right"> 
					  	*Currently 
				    </div> 
				</div> 
 
				<div id="firstname16"> 
					<input type="text" name="currently" class="photonewcommunity" value="${param.currently }" style="width: 300px;"> 
				</div> 
 
				<div class="Verdana10Black" style="padding-left: 140px; padding-bottom: 20px;"> 
					Eg: CEO, Software engg., Student 
				</div> 
<div class="VerdanablckAsh12" id="firstname"> 
  					<div align="right"> 
					  	*City 
				   </div> 
				</div> 
 
				<div id="firstname2"> 
					<input type="text" name="city" class="photonewcommunity" value="${param.city}" style="width: 300px;"> 
				</div> 
 
				<div class="Verdana10Ash" id="atlest"> 
					 
				</div> 
				 
<div class="VerdanablckAsh12" id="firstname"> 
  					<div align="right"> 
					  	*State 
				   </div> 
				</div> 
 
				<div id="firstname2"> 
					<input type="text" name="state" class="photonewcommunity" value="${param.state}" style="width: 300px;"> 
				</div> 
 
				<div class="Verdana10Ash" id="atlest"> 
					 
				</div>				 
				 
				 
				<div class="VerdanablckAsh12" id="firstname15"> 
  					<div align="right"> 
					  	*Country 
				    </div> 
				</div>        
         
				<div id="firstname14">       
					 <input type="text" name="country" class="photonewcommunity" value="${param.country}" style="width: 300px;" onkeypress="return googlecap();">   
				</div>  
           
 
				<div id="firstname34"> 
				 
					</div>     
					<div id="firstname37"> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="submit" name="submit1" class="people" value="Cancel"> 
						<input type="submit" name="submit" class="people" value="Register">
						 
					</div>    
 
					&nbsp;&nbsp;&nbsp;&nbsp; 
                     
       
					<div id="loader" style="margin-left: 80px; margin-top: -15px; clear: left; display: none;"> 
						<img src="images/loader.gif"> 
					</div> 
 
			
</form>

</body>
</html>