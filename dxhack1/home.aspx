<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Surface Sales Inc.</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />    
    <script src="http://vorlonjsa8fe.azurewebsites.net/vorlon.js"></script>
    
     <%-- Adding jquery library test edit--%>
    <script src="Scripts/jquery-1.11.1.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
   
    <script src="jsonobj.js"></script>
    
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
    
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

    <link href="StyleSheet2.css?v=<?=time();?" rel="stylesheet" runat="server" />
    <script  src="http://www.babylonjs.com/hand.minified-1.2.js"></script>
    <script  src="http://www.babylonjs.com/cannon.js"></script>
    <script  src="http://www.babylonjs.com/oimo.js"></script>
    <script  src="http://www.babylonjs.com/babylon.js"></script>
    <script src="Scripts/nativecalls.js"></script>

    <script>
        var productname = "";   //this will store the name of the product chosen

        var imagefolder = "";
        $(document).ready(function () {
            if (window.matchMedia('(max-width: 320px)').matches) {
                imagefolder = "images/submenu/";
                $('.submenu_img').each(function () {
                    $(this).css("width", "109");
                    $(this).css("height", "70");
                })

            } else {
                imagefolder = "images/submenu/";
            }

            if (window.matchMedia('(max-width: 767px)').matches) {
                $("#mslogo").hide();
                $("#brand_mslogo").show();
            } else {
                $("#mslogo").show();
                $("#brand_mslogo").hide();
            }

            $('.submenuCollapse').click(function () {
                $('.maincontent_complete').slideUp();
                $('.submenu_complete').slideUp();                                
            });

            $(window).resize(function () {
                imagefolder = "";
                if (window.matchMedia('(max-width: 320px)').matches) {
                    imagefolder = "images/submenu/";
                    $('.submenu_img').each(function() {                     
                        $(this).css("width", "109");
                        $(this).css("height", "70");
                    })
                }
                else {
                    imagefolder = "images/submenu/";
                    $('.submenu_img').each(function () {
                        var medium = $(this).data('medium');
                        $(this).attr('src', medium);
                        $(this).css("width", "auto");
                        $(this).css("height", "auto");                                         
                    })               
                }

                if (window.matchMedia('(max-width: 767px)').matches) {
                    $("#mslogo").hide();
                    $("#brand_mslogo").show();

                } else {
                    $("#mslogo").show();
                    $("#brand_mslogo").hide();
                }
            });

            $('#goback').click(function () {
                $("#container2").hide('slide', { direction: 'right' }, 500);
                $(".maincontent_complete").delay(500).show('slide', { direction: 'left' }, 500);
                $("html, body").animate({ scrollTop: $('#maincontent_complete_id').offset().top }, 1000);
                $('.submenu_complete').delay(500).slideDown(100);
            });

            $('#leftarrow').click(function () {
                $("#viewvideo").hide('slide', { direction: 'right' }, 300);
                $("#container2").delay(500).show('slide', { direction: 'left' }, 300);
            });

            $('#leftarrow2').click(function () {
                $("#view3d").hide('slide', { direction: 'right' }, 300);
                $("#container2").delay(500).show('slide', { direction: 'left' }, 300);
            });

            $('#buynow').hover(function () {
                $(this).css("background-color", "#d8481d");
            });
            $('#buynow_container').hover(function () {
                $(this).css("background-color", "#d8481d");
            });
        });

        function initialise() {
            $('.submenu_complete').hide();
            $('.maincontent_complete').hide();
            $('#container2').hide();
            $('#viewvideo').hide();
            $('#view3d').hide();
            $('#messagefull').show();
        }

        var oldm=0;
        var olde=0;
        function view_submenu(i , m, e) {
            if (oldm == m)
            {
                if ($(".submenu_complete").is(":visible"))
                    $(".maincontent_complete").hide();
                $('.submenu_complete').slideToggle();
                return;
            }

            else {
                $("#container2").hide(100);
            }
            if (e != olde) {
                $(e).css("background-color", "white");
                $(e).css("color", "black");
                $(e).css("font-weight", "700");

                $(olde).css("background-color", "black");
                $(olde).css("color", "white");
                $(olde).css("font-weight", "normal");
            }

            olde = e;

            $('.submenu_complete').css("margin-top", "-18px");
            $('#container1').hide();
            $('.maincontent_complete').hide();
            $('.submenu_complete').hide();
            $('#viewvideo').hide();
            $('#view3d').hide();

            var obj = JSON.parse(i);
            var str = "";
            for (var k = 0; k < obj.length; k++) {
                str += "<div class='col-sm-3 col-xs-6' style='text-align:center ; height:100px;'> <li class='submenu_text' style='font:bold; ' onclick='view_maincontent(b" + m + "b" + k + "," + (m * 10 + k) + ",this)' ><img src='" + imagefolder + obj[k].name + ".png' data-medium='" + imagefolder + obj[k].name + ".png' data-small='images/maincontent/Type Cover 2.png' class='submenu_img'/><br/>" + obj[k].name + "<span class='caret'></span></li> </div>";
            }
            document.getElementById("submenu1").innerHTML = str;
            reduceImageSize();

           $('.submenu_complete').slideDown(800);
           oldm = m;
        }

        function reduceImageSize() {
            if (window.matchMedia('(max-width: 320px)').matches) {
                $('.submenu_img').each(function () {
                    $(this).width(109);
                    $(this).height(67);
                })
            }
        }

        function submenu_dropup1() {
            $('.submenu_complete').slideUp();
        }
        
        var oldnumber = 0;
        var olde2;

        function view_maincontent(i2, number, e2) {
            if (oldnumber == number)
            {
                $("#container2").fadeOut(200);
                $(".maincontent_complete").slideToggle(900);
                return;
            }
            if (e2 != olde2) {
                $(e2).css("color", "#ffd700");
                $(e2).css("font-weight", "900");
                $(olde2).css("color", "white");
                $(olde2).css("font-weight", "600");
            }
            olde2 = e2;
            $("#container2").hide();
            $(".maincontent_complete").hide();
            $('#messagefull').slideUp(410);
            $('#viewvideo').hide();

            var obj = JSON.parse(i2);
            var str = "";
            for (var k = 0; k < obj.length; k++) {
                str += "<div class='col-sm-3 col-sm-offset-0 col-xs-8 col-xs-offset-2' style='text-align:center ; height:150px;  margin-bottom:30px;'> <li style='text-align:center ;' onclick='view_container(b" + Math.floor(number / 10) + "b" + number % 10 + "," + k + ")' > <img src='images/maincontent/" + obj[k].name + ".png'/><br />" + obj[k].name + "</li></div>";
            }
            document.getElementById("maincontent1").innerHTML = str;
            $(".maincontent_complete").slideDown(1000);
            oldnumber = number;
        }

        function view_container(code1, code2) {
            $(".maincontent_complete").hide('slide', {direction: 'left'}, 500);
            $('.submenu_complete').hide();
            $('#viewvideo').hide();

            var obj = JSON.parse(code1);
            var str = "";

            for (var k = 0; k < obj[code2].description.length; k++) {
                str += "<li>" + obj[code2].description[k].pt + "</li>";
            }

            document.getElementById("container_image").innerHTML = "<img src='images/finalpage/" + obj[code2].name + ".png' style= 'left:0px;'/>";
            document.getElementById("container_heading").innerHTML = obj[code2].name;
            document.getElementById("container_content").innerHTML = str;

            $("#container2").delay(500).show('slide', { direction: 'right' }, 500);

            productname = obj[code2].name;

            console.log('You just viewed' + productname);
        }

        function onClickBuyButton() {
            //Feature detect for Windows
            if (typeof Windows != 'undefined') {
                // Create the message dialog and set its content
                var message = "Checking the Stock";
                var msg = new Windows.UI.Popups.MessageDialog(message);
                // Add commands
                msg.commands.append(new Windows.UI.Popups.UICommand("Okay"));
                // Set default command
                msg.defaultCommandIndex = 1;
                // Show the message dialog
                msg.showAsync();
            }
            else {
                alert("Thank you for placing the order! If the stock is not available, please check back after a week for an update. "); //test for checking the loop entry point is happening or not
            }
        }

        function view_video() {
            $("#container2").hide('slide', { direction: 'left' }, 500);
     //       document.getElementById("videop").innerHTML = "Hello" + productname;
            $('#viewvideo').show(); 
          }

        function view_3d()
        {
            $("#container2").hide('slide', { direction: 'left' }, 500);
            $('#view3d').show();   
        }
    </script>
</head>

<body onload="initialise()">

    <%--Header design--%>

    <nav class="navbar navbar-inverse" role="navigation" style="margin-bottom:0px; background-color:black; color:white;">
  <div class="container-fluid" >
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" style="color:white;">

      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#" style="color:white; font-family:'Segoe UI'; font-size:1.45em; padding-left:10px; padding-right:0px;" onclick="initialise();"> Surface Sales Inc.</a>
        <br /> <br />
      <a id="brand_mslogo" href="#" style=" padding:0px; padding-top:1px; margin-left:-165px; margin-top:5px;"><img src="images/mslogo2.png" /></a>
    </div>

<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

 <ul class="nav navbar-nav navbar-right">
 <li class="dropdown" style="padding-right:20px" id="products"> 
 <a id="a1" onclick="view_submenu(a1,1,this)" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Products <span class="caret"></span></a>
 </li>
 
 <li class="dropdown" style="padding-right:20px" id="accessories" >
 <a id="a2" onclick="view_submenu(a2,2,this)" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Accessories <span class="caret"></span></a>
 
 </li>
 
   <li id="mslogo"><a href="#" style="padding:0px; padding-top:1px;"><img src="images/mslogo2.png" /></a></li>
 
 </ul>
 </div><!-- /.navbar-collapse -->
 </div><!-- /.container-fluid -->
</nav>
 
　
 <%--Header design complete--%>
 <div class="submenu_complete" style="margin-bottom:40px;">
 <%--Design for submenu - displaying the products and accessories--%>
 <ul class="products_submenu" id="submenu1">
 </ul>

<div class="submenuCollapse submenuCarouselSprite"></div>
 </div>

    <div class="container-fluid" id="messagefull" style="height:85vh; ">
            <div id="message" class="col-xs-12 col-sm-6 col-sm-offset-6 col-md-5 col-md-offset-7" style="font-family:'Segoe UI'; font-size:1.6em; top:19%; padding:20px;padding-bottom:35px;">
                <h1 style="color:white; opacity:1;">Surface Tablets</h1> <br />
                <p style="opacity:1; font-size:1.25em; font-family:'Segoe UI'; color:white;">The most productive tablets on planet. Nothing comes close.</p>
                <br/>
            </div>
    </div>


    <div class="maincontent_complete" id="maincontent_complete_id">
        <%--Design for displaying the types of Keyboard/surface pro3 etc.--%>
        <ul class="maincontent" id="maincontent1">
        </ul>
    </div>

            <div class="container" id="container2"  style="background-color: white;">
                <div id="goback" class=""></div>
 
        <div class="row" id="row2" style="font-family: 'Segoe UI';  margin-bottom:30px; border: 0px; padding-top: 0px; padding-bottom: 20px;">

            <div class="col-md-4" id="container_image" style="text-align: center; padding-top:35px;">
            </div>

            <div class="col-md-6 " id="container_text">
                <h3 id="container_heading" style="text-align:center;  padding-top:28px;"></h3>
                <ul id="container_content" style="line-height: 2em;">
                </ul>
            </div>

            <div class="col-sm-6 col-sm-offset-3 col-md-2 col-md-offset-0" id="container_buy" style="padding-top:10px;">
                <ul class="nav nav-pills nav-stacked">
                    <li id="buynow_container" style="background-color: #f15021; text-align: center; border: 1px solid black; 
padding-top: 0px; padding-bottom: 0px; "><a id= "buynow" onclick="onClickBuyButton()" style="color:black; margin-bottom:6px; margin-top:6px;">BUY NOW</a></li>
                    <li style="border: 1px solid black;"><a onclick="view_3d()" style="color: black;"><span>
                        <img src="assets/cheque.png" /></span> View in 3D</a></li>
                    <li style="border: 1px solid black;"><a onclick="view_video()" style="color: black;"><span>
                        <img src="assets/cash.png" /></span> Watch Video</a></li>
           <li style="border: 1px solid black;"><a style="color: black;"><span>
                        <img src="assets/cash.png" /></span> In Stock? 
               <asp:Literal runat="server" id="txtValueA" EnableViewState="false" />
                                                </a></li>
   </ul>
            </div>

           <div style="height:5px"></div>
        </div>
    </div>

     <div class="col-sm-12" id="viewvideo" >
            <div id="leftarrow" class=""></div>
         <div id="video" style="width:100%;">   
<%--             <p id="videop"style="color:white"></p>    --%>
         <video width="300" height="280" src="https://demomediaserviceshcl.blob.core.windows.net/asset-f816345d-1500-80c3-6b70-f1e5383efcba/Surface Pro 3 - Reinvent.mp4?sv=2012-02-12&sr=c&si=2d145b7c-e184-42f9-89b8-14d9b1be6c8f&sig=9h6k9lKDB1V307r9Ab2tmsabknCKpF%2Fcrv8%2B2%2BAohWE%3D&st=2015-08-01T11%3A18%3A30Z&se=2115-07-08T11%3A18%3A30Z" controls >
                    Your browser does not support the video tag.
                </video>
             </div>
            </div>


    <div class="col-sm-12 col-md-12 " id="view3d" >
            <div id="leftarrow2" class=""></div>
         <div id="babylon3d">     
             <%-- Babylon Rendering Code here  --%>  
                <style>
                    html, body {
                        overflow: hidden;
                        width: 100%;
                        height: 100%;
                        margin: 0;
                        padding: 0;
                    }

                    #renderCanvas {
                        width: 100%;
                        height: 100%;
                        touch-action: none;
                    }
                </style>
             <canvas id="renderCanvas"></canvas>
            <script>
                var canvas = document.getElementById("renderCanvas");
                var engine = new BABYLON.Engine(canvas, true);

                var createScene = function () {

                    //var canvas = document.getElementById("renderCanvas");
                    //ar engine = new BABYLON.Engine(canvas, true);

                    var scene = new BABYLON.Scene(engine);

                    var camera = new BABYLON.ArcRotateCamera("Camera", 0, 0, 10, BABYLON.Vector3.Zero(), scene);
                    var box = BABYLON.Mesh.CreateBox("Box", 1.0, scene);
                    var light = new BABYLON.PointLight("Omni", new BABYLON.Vector3(20, 100, 2), scene);

                    camera.setPosition(new BABYLON.Vector3(0, 1, 3));
                    camera.attachControl(canvas);

                    var material = new BABYLON.StandardMaterial("default", scene);
                    material.emissiveColor = new BABYLON.Color3(0.3, 0.3, 0.3);
                    var dynamicTexture = new BABYLON.DynamicTexture("dynamic texture", 512, scene, true);
                    dynamicTexture.hasAlpha = true;
                    material.diffuseTexture = dynamicTexture;

                    box.material = material;

                    var count = 0;
                    var productname = "Surface";
                    scene.beforeRender = function () {
                        // Dynamic
                        var textureContext = dynamicTexture.getContext();
                        var size = dynamicTexture.getSize();
                        var text = productname//count.toString();

                        textureContext.save();
                        textureContext.fillStyle = "red";
                        textureContext.fillRect(0, 0, size.width, size.height);

                        textureContext.font = "bold 120px Calibri";
                        var textSize = textureContext.measureText(text);
                        textureContext.fillStyle = "white";
                        textureContext.fillText(text, (size.width - textSize.width) / 2, (size.height - 120) / 2);

                        textureContext.restore();

                        dynamicTexture.update();
                        count++;
                    };

                    // Render loop
                    var renderLoop = function () {
                        // Start new frame
                        engine.beginFrame();

                        scene.render();

                        // Present
                        engine.endFrame();

                        // Register new frame
                        BABYLON.Tools.QueueNewFrame(renderLoop);
                    };

                    BABYLON.Tools.QueueNewFrame(renderLoop);
                    return scene;
                };


                //non dynamic rendering
                //var createScene = function () {
                //    var scene = new BABYLON.Scene(engine);
        
                //    //Create a light
                //    var light = new BABYLON.PointLight("Omni", new BABYLON.Vector3(-60, 60, 80), scene);
        
                //    //Create an Arc Rotate Camera - aimed negative z this time
                //    var camera = new BABYLON.ArcRotateCamera("Camera", Math.PI / 2, 1.0, 120, BABYLON.Vector3.Zero(), scene);
                //    camera.attachControl(canvas, true);
        
                //    //Creation of 6 spheres
                //    var box1 = BABYLON.Mesh.CreateBox("Box1", 15.0, scene);
            
        	
                //    //Position the spheres
                //    box1.position.x = 8;
            
        
                //    //Creation of a plane
                //    var plane = BABYLON.Mesh.CreatePlane("plane", 120, scene);
                //    plane.position.y = -5;
                //    plane.rotation.x = Math.PI / 2;
        
                //    //Creation of a material with wireFrame
                //    //var materialBox1 = new BABYLON.StandardMaterial("texture1", scene);
                //    //materialBox1.wireframe = true;
        
                //    //Creation of a red material with alpha
                //    var materialBox1 = new BABYLON.StandardMaterial("texture1", scene);
                //    materialBox1.diffuseColor = new BABYLON.Color3(1, 0, 0); //Red
                //    materialBox1.alpha = 0.8;
        
           
        
                //    //Creation of a repeated textured material
                //    var materialPlane = new BABYLON.StandardMaterial("texturePlane", scene);
                //    materialPlane.diffuseTexture = new BABYLON.Texture("textures/grass.jpg", scene);
                //    materialPlane.diffuseTexture.uScale = 5.0;//Repeat 5 times on the Vertical Axes
                //    materialPlane.diffuseTexture.vScale = 5.0;//Repeat 5 times on the Horizontal Axes
                //    materialPlane.backFaceCulling = false;//Allways show the front and the back of an element
        
                //    //Apply the materials to meshes
            
        	    //    box1.material = materialBox1; 
            
        
                //    plane.material = materialPlane;
        
                //    return scene;
                //};
        
        
                var scene = createScene();

                engine.runRenderLoop(function () {
                    scene.render();
                });

                // Resize
                window.addEventListener("resize", function () {
                    engine.resize();
                });
            </script>
             </div>
            </div>



    <%--To show footblock--%>
    <div class="container-fluid">

        <div class="row" id="footer">
            
            <div class="col-xs-4"  style="text-align:center;  margin-top:3px;">Contact Us</div>
            <div class="col-xs-4" style="text-align:center; margin-top:3px;">Terms of Use</div>
            <div class="col-xs-4" style="text-align:center; margin-top:3px;">Trademarks</div>
        </div>
    </div>

</body>
</html>
