* css: Should contain stylesheet files for your app. Contains a default application.css file which must be present if you want to run your app with stylesheet from the assets folder. All other css files must be imported in this file, as it serves as base to all css files.

* js: Should contain javascript files for your app. Contains a default application.css file which must be present if you want to run your app with javascript from the assets folder. All other javascript files must be linked this file, as it serves as base to all javascript files.

If you want to use another css/javascript file as the base file. Create the file in the css/javascript folder (as the case may be) and change the variable passed to the `include_stylesheet` or `include_javascript` helper to the name of your chosen base file, without the ".css" or ".js" extension.

* images: Should contain all images to be used in the app. If you want a favicon for your app. Include the file in this folder with the name "favicon.png". Other images in this directory can be accessed by passing the image name (e.g "image.jpg") to the `image_tag` helper.
Note: The favicon must have be a png file to use the `display_favicon` helper.
