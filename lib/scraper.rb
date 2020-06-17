require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)

    doc = Nokogiri::HTML(open(index_url))

    student_index_array = []

    doc.css(".student-card").map do |student|
      name 
      student_index_array.push({
        name: student.css("h4.student-name").text,
        location: student.css("p.student-location").text,
        profile_url: "https://learn-co-curriculum.github.io/student-scraper-test-page/students/#{student.css("a").attribute("href").value}"})
    end
    student_index_array
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

