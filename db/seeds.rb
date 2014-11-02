# seed Sources
Source.create(name: "edX")
Source.create(name: "Coursera")
Source.create(name: "Mathworks")
Source.create(name: "Other")

# seed courses from matlab examples website
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

  if readable.css('.package__head .package__img').first.children.css('img').attr('src') == nil || readable.css('.package__head .package__img').first.children.css('img').attr('src').value == "DefaultImage.png"
    image_url = "default.png"
  else
    image_url = readable.css('.package__head .package__img').first.children.css('img').attr('src').value
  end
  image_url ="default.png" if image_url == "/examples/assets/DefaultImage.png"

  puts "Image: " + image_url

  Course.find_or_create_by!(title: title, description: description, url: url, image_url: image_url, source_id: Source.find_by(name: "Mathworks").id)
  puts "______________"
end

Course.where(image_url: "default.png").delete_all
