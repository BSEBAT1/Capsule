This application will show you artciles from the NY times in a tableView. Once clicked a small preview will open along with a link to go to each webpage. It also allows you to filter by type of article. 
The application was created without any external libraries. It does not use storyboards as these are cumbersome in enterprise projects and 
stop us from using dependency injection. Auto layout was used for laying out the views.
Due to time contraints and the nature of my current job some comprimses had to me be made in the UI of the application. 

The app uses MVVM architecture along with reusable views and view controllers to manage those views. There is a service class to handle web requests.
The service class inherits from the service protocol which allows us to easily make fake service classes for testing our services. One such class is there in the unit tests
for intrest of everybodies time I did not create further tests. 

The app does not have an icon or a launc screen. It does however have an icon warning image used in error states where we cannot download the correct iamge. 

TODO if I had more time 

Improve the UI
Write more test cases 
Add more marks and comments 
Add more filter options 


