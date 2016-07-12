require 'bundler/setup'
require 'nokogiri'
require 'open-uri'
module Test
  class Hola
	  def self.process
	    doc = Nokogiri::HTML(open('http://www.imdb.com/movies-in-theaters/?ref_=nv_mv_inth_1'))

	    @cinemas=[]
	    @title=doc.at_css('.sub-list+ .sub-list h3').text
	    @head_title=doc.at_css('.header+ .sub-list h3').text
	  
		  doc.css('.list_item').each do |item|
				begin
				  @item={}
			    @item["title"]= item.at_css('h4 a').text
			    @item["desc"]= item.at_css('.overview-top .outline').text
			    @item["rating"]=item.css('.value').text
			    @item["metascore"]=item.css('.metascore strong').text
			    @item["review"]=item.css('.metascore a').text
			    #@item["img"]=item.at_css('.shadowed').attr('src')
			    @cinemas << @item
			  rescue
			  end
    	end
			
			@cinemas

	  end
  end
end
