require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://toronto.en.craigslist.ca/bia/"))
bikes = page.css('blockquote#toc_rows p.row span.pl a') #The hard part, getting to the part of the document you want to scrape

prices = page.css('blockquote#toc_rows p.row span.l2 span.price')


# # This places results in an .xml file

  # File.open('prices.xml', 'w') do |f|

  # f.puts prices

  # end


File.open('bikes.html', 'w') do |f|

f.puts("<html>")
f.puts("<head>")
f.puts('<link type="text/css" rel="stylesheet" href="stylesheet.css"/>')
f.puts("<title>SCRAPE</title>")
f.puts("</head>")
f.puts("<body>")
f.puts("<h1>--SCRAPE--</h1>")
f.puts("<ol>")
bikes.each do |bike| 
  #f.puts("<li>#{bike.text}</li>")
  f.puts %(<li class="title">#{bike.text}</li>)

end
f.puts("</ol>")

f.puts("<ol>")
prices.each do |price| 
f.puts %(<li class="price">#{price.text}</li>)
end
f.puts("</ol>")

f.puts('</body>')
f.puts('</html>')

end
