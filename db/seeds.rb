Source.create(name: "edX")
Source.create(name: "Coursera")
Source.create(name: "Mathworks")
Source.create(name: "Other")

# courses = [{title: "Getting Started with MATLAB", description: "Welcome to this MATLAB Video tutorial. If you have never used MATLAB before, this demonstration will get you started and show you where to go to next to learn more.", image_url: "http://www.mathworks.com/matlabcentral/fileexchange/23927/raw_content/html/GettingStartedWithMATLAB_02.png", url: "http://www.mathworks.com/examples/matlab/3760-getting-started-with-matlab", source_id: Source.find_by(name: "Mathworks").id}, {title: "Line Plots", description: "To create two-dimensional line plots, use the plot function. For example, plot the value of the sine function from 0 to 2pi", image_url: "http://www.mathworks.com/help/releases/R2014b/examples/matlab/LinePlotsGSExample_04.png", url: "http://www.mathworks.com/examples/matlab/1070-line-plots", source_id: Source.find_by(name: "Mathworks").id}, {title: "Manipulating Multidimensional Arrays", description: "This example shows how to work with arrays having more than two dimensions. Multidimensional arrays can be numeric, character, cell, or structure arrays. Multidimensional arrays can be used to represent multivariate data. MATLAB® provides a number of functions that directly support multidimensional arrays.", image_url: "http://www.mathworks.com/help/releases/R2014b/examples/matlab_product/nddemo_01.png", url: "http://www.mathworks.com/examples/matlab/1099-manipulating-multidimensional-arrays", source_id: Source.find_by(name: "Mathworks").id}, {title: "Scientific Computing", description: "Investigate the flexibility and power of project-oriented computational analysis. Practice using this technique to resolve complicated problems in a range of fields including the physical and engineering sciences, finance and economics, medical, social and biological sciences. Enhance communication of information by creating visual representations of scientific data.", url: "https://www.coursera.org/course/scientificcomp", source_id: Source.find_by(name: "Coursera").id}, {title: "Introduction to Scientific Computing with Matlab", url: "https://edge.edx.org/courses/BerkeleyX/E7/Introduction_to_Scientific_Computing_with_Matlab/about", source_id: Source.find_by(name: "edX").id}]

# courses.each do |course|
#   Course.find_or_create_by!(title: course[:title], description: course[:description], image_url: course[:image_url], url: course[:url], source_id: course[:source_id])
# end

page_url = "http://www.mathworks.com/examples/matlab/"

html = open(page_url)
doc = Nokogiri::HTML(html)

parsethrough = doc.css('div.package')
parsethrough.each do |readable|
  puts "Adding . . . "

  title = readable.css('.package__overview .package__overview__content h3').first.children.text
  puts "Title: " + title

  description = readable.css('.package__overview .package__overview__content p').first.children.text
  puts "Description: " + description

  url = "http://www.mathworks.com" + readable.children.css('a').first.attributes["href"].value
  puts "URL: " + url

  if readable.css('.package__head .package__img').first.children.css('img').attr('src') == nil
    image_url = "default.png"
  else
    image_url = readable.css('.package__head .package__img').first.children.css('img').attr('src').value
  end
  puts "Image: " + image_url

  Course.find_or_create_by!(title: title, description: description, url: url, image_url: image_url, source_id: Source.find_by(name: "Mathworks").id)
  puts "______________"
end
