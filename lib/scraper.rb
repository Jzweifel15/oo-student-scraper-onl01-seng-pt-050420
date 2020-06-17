require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)

    doc = Nokogiri::HTML(open(index_url))

    student_index_array = []

    doc.css(".student-card").map do |student|
      student_name = student.css("h4.student-name").text
      student_location = student.css("p.student-location").text
      student_profile_url = "https://learn-co-cirriculum.github.io/student-scraper-test-page/students/#{student.css("a").attribute("href").value}"
      student_index_array.push({name => student_name, location => student_location, profile_url => student_profile_url})
    end 
    student_index_array 
  end 

  def self.scrape_profile_page(profile_url) 
    
  end 

end 

