# dx.hack : Surface Sales website

This solution attempts to build a simple online marketplace for Surface line of products and accessories. This is a part of the DX Hackathon we did back in August, 2015. Final solution can be viewed at http://surfacesales.azurewebsites.net/home 
What we have done:
-	Truly responsive website (using HTML5, CSS3, Bootstrap, custom media queries, Javascript and jQuery).
-	Included Babylon.JS to create a simple 3D model of products. (‘View in 3D’)
-	Included a sample video about the product, leveraging Azure Media services at the backend. (‘Watch Video’)
-	Created a prototype of IoT scenario leveraging Azure at the backend. Used Arduino-compatible Sparkfun Weather Shield to collect light reading from the sensor, sent the data to Raspberry Pi2 (running Windows10 IoT), which further connected to Events Hub in Azure. We then ran a Stream Analytics query to send the data to Azure SQL database. With regards to the Surface Sales website, we’ve created a scenario where the light sensor would be set up on the rack holding Surface and the accessories. If there is a Surface on rack, the light reading should be low (ideally completely dark) and hence the product is in stock. For the purpose of our demo, we’ve set a breakpoint at 5 Lumens. If the light reading is less than 5, the product is available, otherwise it is not.  (‘In Stock’)
-	Created a hosted web app for Windows 10. For the demo, we show a native UI popup for Windows 10 if the website is accessed as a hosted web app.
-	Used Manifold.JS to create hosted apps across multiple platforms.
-	Used Vorlon.JS to debug and test the website across mobile, desktop and tablets.
-	Set up Continuous Integration on VSO.
-	Hosted the entire solution on Azure App Service Web app. We set up auto-scaling on the web app (1-2 instances with 50-80% of CPU utilization) and scheduled backup of the web app to a Azure Storage container (retention of 30 days with frequency of 7 days)

Final solution: http://surfacesales.azurewebsites.net/home

