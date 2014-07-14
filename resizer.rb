dimensions=ARGV[0]
file=ARGV[1]
if file.nil?
  puts "Enter file name, with extension, using this format: whatever.jpg"
  abort
else
  puts file
end
if dimensions.nil?
  puts "Enter file dimensions using this format: 1280x800"
  abort
else
  puts dimensions
end
filename_without_extension=file.split(".")[0]
unless file.split(".")[1]=="jpg"
  filename_jpg=filename_without_extension+".jpg"
  convert_to_jpg="convert #{file} #{filename_jpg}"
  system(convert_to_jpg)
end
fname=filename_without_extension
resize_image="convert #{file} -resize #{dimensions}\\! #{fname}_1.jpg"
mirror_image="convert #{fname}_1.jpg -flop #{fname}_2.jpg"
stitch_into_one_image="convert #{fname}_1.jpg #{fname}_2.jpg #{fname}_1.jpg +append background.jpg"
#puts convert_to_jpg,resize_image,mirror_image,stitch_into_one_image
system(resize_image)
system(mirror_image)
system(stitch_into_one_image)
copy="cp background.jpg ~/JavaScript/Node/nodescreen/public/images/background.jpg"
system(copy)
