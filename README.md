A screensaver that gives you the choice of displaying a static gif or looping through a gallery.

I thought that it would be nice to have a screensaver that either displays a nature gif (1), or loops through a gallery that shows the PagerDuty logo in the bottom corner (2). This does that, basically.

This was written in Node.js using ejs, which is basically straight html with the ability to add variables & code (equivalent to Rails' erb). I actually could have used html instead of ejs, as the view files are only html.

To run this screensaver, first, install Node.js if you don't already have it. Then git clone the directory, cd into the directory and type:

npm install
npm start

Then go to localhost:3000/ and you'll see the page.

Gif shows a gif, usually one of water (since water animates nicely, is not distracting, and you don't notice when it starts repeating). You can find more like this by Googling in image search for cinemagraph.

Loop animates through a "gallery", really a single image that has been mirror-imaged and then added on again to the last frame so it looks like a gallery (but is really one image). However, that single image is kind of a technicality since it can be made up of multiple images, using multisizer.rb.

Use the Ruby files resizer.rb and multisizer.rb to automatically create symmetrical images (for nice transitions).

To use resizer.rb, write this on the command line:

ruby resizer.rb 1280x800 dragon.jpg

To use resizer.rb, write this on the command line:

ruby multisizer.rb 1280x800 dragon.jpg waterfall.png kittens.jpg statue.jpg cliffs.png

(and so on - there's no limit for multisizer)

Both of these files reqiure imagemagick, so you'll need to install imagemagick for the them to work.

It's possible that multisizer makes resizer useless, so you might be able to use multisizer for all of this.

For the transitions, for a smooth transition (i.e., not jerking to a completely different image on the last frame), you want the last frame of the repeating image
to exactly match the first frame of the repeating image, so you can't tell when it restarts. Both scripts basically create background images that do this, by taking your image(s), mirroring them, and then adding the first image again on the end.

Both scripts ask for your screen dimensions because I couldn't figure out a way in css to have those exactly match the contours of your screen (that is, the last frame on screens of different sizes does not equal the first frame, causing jerky transitions/ugly 'tiled' images that don't look natural). This would be better, since you could then access the same url on different sized screens, but I wrote the scripts to incorporate the screen size at the time they're creating those symmetrical images, since it was easy to do that with imagemagick.



