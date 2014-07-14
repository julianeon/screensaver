dimensions=ARGV[0]
file=ARGV[1]
if dimensions.nil? || !(dimensions=~/[0-9]+x[0-9]+/)
  puts dimensions
  puts "Enter file dimensions using this format: 1280x800"
  abort
else
  puts dimensions
end
if file.nil?
  puts "Enter file name, with extension, using this format: whatever.jpg"
  abort
else
  puts file
end

stitch_string=""
ARGV.drop(1).each do |file|
  filename_without_extension=file.split(".")[0]
  unless file.split(".")[1]=="jpg"
    filename_jpg=filename_without_extension+".jpg"
    convert_to_jpg="convert #{file} #{filename_jpg}"
    system(convert_to_jpg)
  end
  fname=filename_without_extension
  resize_image="convert #{file} -resize #{dimensions}\\! #{fname}_1.jpg"
  stitch_string+="#{fname}_1.jpg " 
  system(resize_image)
end
stitch_left_image="convert #{stitch_string}+append stitch_left.jpg"
stitch_right_image="convert stitch_left.jpg -flop stitch_right.jpg"
#system(stitch_left_image)
#system(stitch_right_image)
first_image=stitch_string.split[0]
stitch_whole_image="convert stitch_left.jpg stitch_right.jpg #{first_image} +append stitch_whole.jpg"
puts stitch_left_image,stitch_right_image,stitch_whole_image
#system(copy)
system(stitch_left_image)
system(stitch_right_image)
system(stitch_whole_image)

