The files in this repo is a use case of the easyzoom jquery plugin.

The original plugin is found here: http://cssglobe.com/jquery-plugin-easy-image-zoom/

However, this plugin can only work with one image per page. I modified the plugin so that it will work with multiple images in one page such as a page 
with a list of different products each with its own zoomable image.

The instructions on how to use this plugin is found on the url above.

The same instructions from the author of the plugin are repeated below (just in case the url is not accessible).


MARKUP
All you need for this plugin to work is anchor element containing the small image linking to the large image, but this structure is required:

<a href="large.jpg"><img src="small.jpg" alt="Small image" /></a>

The script (and CSS) takes care fo the rest. 


OPTIONS

This plugin is customizable with several options and simple CSS definitions. In terms of CSS all you need to do is define the newly created image zoom element’s size, position and appearance. 
In my demo I am using this definition:

#easy_zoom{
	width:600px;
	height:400px;	
	border:5px solid #eee;
	background:#fff;
	color:#333;
	position:absolute;
	top:15px;
	left:400px;
	overflow:hidden;
	-moz-box-shadow:0 0 10px #555;
	-webkit-box-shadow:0 0 10px #555;
	box-shadow:0 0 10px #555;
	/* vertical and horizontal alignment used for preloader text */
	line-height:400px;
	text-align:center;
	}
	
You will notice the line-height property… I am using if for vertical alignment of the message text that is displayed while the detailed image is loading. 
Of course you can use your own positioning methods, your own text, insert extra markup if you want to and add your own CSS to style the preloader. 
Perhaps some preloader gif as a preloader image? I’ll leave that to you, what I am showing here is a bare-bone example that you can easily customize.

Let’s take a look at the plugin options. Here is a list of them with default values and descriptions:

id
Default value: "easy_zoom"
The ID of the newly created image zoom element. Of course you can use your own, but make sure you update the CSS accordingly.

parent
Default value: "body"
This defines the DOM element where newly created image zoom element will be inserted. You can insert it anywhere you like in the DOM by editing this option.

append
Default value: "true"
If set to true (by default) the newly created element will be inserted as a last child of the parent element. If this option is set to false then the newly created element will be inserted as a first child of the parent element. 	
	
preload
Default value: "Loading…"
A message that appears before the large image is loaded. You can use this option to write your own preload messages and insert any HTML you want. If you want to use the preloader gifs, I suggest you go with background images.

error
Default value: "There has been a problem with loading the image."
In case the large image is not found or can’t be loaded, this error message will appear. You can use this option for custom error messages.


Here’s a sample code for using some custom options:

jQuery(function($){
	
	$('a.zoom').easyZoom({
		id: 'imagezoom',
		preload: '<p class="preloader">Loading the image</p>'
		parent: '#container'
	});

});	

